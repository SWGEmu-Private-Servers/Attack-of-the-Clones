/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions. */

#include "SuiManager.h"

#include "server/zone/ZoneProcessServer.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/player/sui/SuiWindowType.h"
#include "server/zone/objects/player/sui/banktransferbox/SuiBankTransferBox.h"
#include "server/zone/objects/player/sui/characterbuilderbox/SuiCharacterBuilderBox.h"
#include "server/zone/objects/player/sui/transferbox/SuiTransferBox.h"
#include "server/zone/objects/creature/commands/UnconsentCommand.h"
#include "server/zone/managers/skill/SkillManager.h"
#include "server/zone/objects/player/sui/listbox/SuiListBox.h"
#include "server/zone/objects/player/sui/inputbox/SuiInputBox.h"
#include "server/zone/objects/player/sui/messagebox/SuiMessageBox.h"
#include "server/zone/ZoneServer.h"
#include "server/zone/managers/minigames/FishingManager.h"
#include "server/zone/objects/player/sui/keypadbox/SuiKeypadBox.h"
#include "server/zone/objects/player/sui/callbacks/LuaSuiCallback.h"
#include "server/zone/objects/tangible/terminal/characterbuilder/CharacterBuilderTerminal.h"
#include "templates/params/creature/CreatureAttribute.h"
#include "templates/params/creature/CreatureState.h"
#include "server/zone/objects/tangible/deed/eventperk/EventPerkDeed.h"
#include "server/zone/objects/tangible/eventperk/Jukebox.h"
#include "server/zone/objects/tangible/eventperk/ShuttleBeacon.h"
#include "server/zone/objects/player/sui/SuiBoxPage.h"
#include "server/zone/managers/loot/LootManager.h"
#include "server/zone/managers/player/PlayerManager.h"
#include "server/zone/managers/gcw/GCWManager.h"
#include "server/zone/Zone.h"
#include "server/zone/objects/transaction/TransactionLog.h"

SuiManager::SuiManager() : Logger("SuiManager") {
	server = nullptr;
	setGlobalLogging(true);
	setLogging(false);
}

void SuiManager::handleSuiEventNotification(uint32 boxID, CreatureObject* player, uint32 eventIndex, Vector<UnicodeString>* args) {
	uint16 windowType = (uint16) boxID;

	Locker _lock(player);

	ManagedReference<PlayerObject*> ghost = player->getPlayerObject();

	if (ghost == nullptr)
		return;

	ManagedReference<SuiBox*> suiBox = ghost->getSuiBox(boxID);

	if (suiBox == nullptr)
		return;

	//Remove the box from the player, callback can readd it to the player if needed.
	ghost->removeSuiBox(boxID);
	suiBox->clearOptions(); //TODO: Eventually SuiBox needs to be cleaned up to not need this.

	Reference<SuiCallback*> callback = suiBox->getCallback();

	if (callback != nullptr) {
		Reference<LuaSuiCallback*> luaCallback = cast<LuaSuiCallback*>(callback.get());

		if (luaCallback != nullptr && suiBox->isSuiBoxPage()) {
			Reference<SuiBoxPage*> boxPage = cast<SuiBoxPage*>(suiBox.get());

			if (boxPage != nullptr) {
				Reference<SuiPageData*> pageData = boxPage->getSuiPageData();

				if (pageData != nullptr) {
					try {
						Reference<SuiCommand*> suiCommand = pageData->getCommand(eventIndex);

						if (suiCommand != nullptr && suiCommand->getCommandType() == SuiCommand::SCT_subscribeToEvent) {
							StringTokenizer callbackString(suiCommand->getNarrowParameter(2));
							callbackString.setDelimeter(":");

							String luaPlay = "";
							String luaCall = "";

							callbackString.getStringToken(luaPlay);
							callbackString.getStringToken(luaCall);

							callback = new LuaSuiCallback(player->getZoneServer(), luaPlay, luaCall);
						}
					} catch(Exception& e) {
						error(e.getMessage());
					}
				}
			}
		}
		callback->run(player, suiBox, eventIndex, args);
		return;
	}

	debug() << "Unknown message callback with SuiWindowType: " << hex << windowType << ". Falling back on old handler system.";

	switch (windowType) {
	case SuiWindowType::DANCING_START:
		handleStartDancing(player, suiBox, eventIndex, args);
		break;
	case SuiWindowType::DANCING_CHANGE:
		handleStartDancing(player, suiBox, eventIndex, args);
		break;
	case SuiWindowType::MUSIC_START:
		handleStartMusic(player, suiBox, eventIndex, args);
		break;
	case SuiWindowType::MUSIC_CHANGE:
		handleStartMusic(player, suiBox, eventIndex, args);
		break;
	case SuiWindowType::BAND_START:
		handleStartMusic(player, suiBox, eventIndex, args);
		break;
	case SuiWindowType::BAND_CHANGE:
		handleStartMusic(player, suiBox, eventIndex, args);
		break;
	case SuiWindowType::BANK_TRANSFER:
		handleBankTransfer(player, suiBox, eventIndex, args);
		break;
	case SuiWindowType::FISHING:
		handleFishingAction(player, suiBox, eventIndex, args);
		break;
	case SuiWindowType::CHARACTER_BUILDER_LIST:
		handleCharacterBuilderSelectItem(player, suiBox, eventIndex, args);
		break;
	case SuiWindowType::OBJECT_NAME:
		handleSetObjectName(player, suiBox, eventIndex, args);
		break;
	}
}

void SuiManager::handleSetObjectName(CreatureObject* player, SuiBox* suiBox, uint32 cancel, Vector<UnicodeString>* args) {
	if (!suiBox->isInputBox() || cancel != 0)
		return;

	ManagedReference<SceneObject*> object = suiBox->getUsingObject().get();

	if (object == nullptr)
		return;

	if (args->size() < 1)
		return;

	UnicodeString objectName = args->get(0);

	object->setCustomObjectName(objectName, true);

	if (object->isSignObject()) {
		StringIdChatParameter params("@player_structure:prose_sign_name_updated"); //Sign name successfully updated to '%TO'.
		params.setTO(objectName);

		player->sendSystemMessage(params);
	}
}

void SuiManager::handleStartDancing(CreatureObject* player, SuiBox* suiBox, uint32 cancel, Vector<UnicodeString>* args) {
	if (!suiBox->isListBox() || cancel != 0)
		return;

	if (args->size() < 2)
		return;

	int index = Integer::valueOf(args->get(0).toString());

	uint32 id = suiBox->getBoxID();

	bool change = (uint16)id == SuiWindowType::DANCING_CHANGE;


	SuiListBox* listBox = cast<SuiListBox*>( suiBox);

	if (index == -1)
		return;

	String dance = listBox->getMenuItemName(index);

	if (!change)
		player->executeObjectControllerAction(STRING_HASHCODE("startdance"), 0, dance);
	else
		player->executeObjectControllerAction(STRING_HASHCODE("changedance"), 0, dance);
}

void SuiManager::handleStartMusic(CreatureObject* player, SuiBox* suiBox, uint32 cancel, Vector<UnicodeString>* args) {
	if (!suiBox->isListBox() || cancel != 0)
		return;

	if (args->size() < 2)
		return;

	int index = Integer::valueOf(args->get(0).toString());

	uint32 id = suiBox->getBoxID();

	SuiListBox* listBox = cast<SuiListBox*>( suiBox);

	if (index == -1)
		return;

	String dance = listBox->getMenuItemName(index);

	switch ((uint16)id) {
	case SuiWindowType::MUSIC_START:
		player->executeObjectControllerAction(STRING_HASHCODE("startmusic"), player->getTargetID(), dance);
		break;
	case SuiWindowType::MUSIC_CHANGE:
		player->executeObjectControllerAction(STRING_HASHCODE("changemusic"), player->getTargetID(), dance);
		break;
	case SuiWindowType::BAND_CHANGE:
		player->executeObjectControllerAction(STRING_HASHCODE("changebandmusic"), player->getTargetID(), dance);
		break;
	case SuiWindowType::BAND_START:
		player->executeObjectControllerAction(STRING_HASHCODE("startband"), player->getTargetID(), dance);
		break;
	}
}

void SuiManager::handleBankTransfer(CreatureObject* player, SuiBox* suiBox, uint32 cancel, Vector<UnicodeString>* args) {
	if (!suiBox->isBankTransferBox() || cancel != 0)
		return;

	if (args->size() < 2)
		return;

	int cash = Integer::valueOf(args->get(0).toString());
	int bank = Integer::valueOf(args->get(1).toString());

	SuiBankTransferBox* suiBank = cast<SuiBankTransferBox*>( suiBox);

	ManagedReference<SceneObject*> bankObject = suiBank->getBank();

	if (bankObject == nullptr)
		return;

	if (!player->isInRange(bankObject, 5))
		return;

	TransactionLog trx(player, player, TrxCode::BANK, 0, false);
	player->transferCredits(cash, bank);
}

void SuiManager::handleFishingAction(CreatureObject* player, SuiBox* suiBox, uint32 cancel, Vector<UnicodeString>* args) {
	if (cancel != 0)
		return;

	if (args->size() < 1)
		return;

	int index = Integer::valueOf(args->get(0).toString());

	FishingManager* manager = server->getFishingManager();

	manager->setNextAction(player, index + 1);

	uint32 newBoxID = 0;

	switch (index + 1) {
	case FishingManager::TUGUP:
		newBoxID = manager->createWindow(player, suiBox->getBoxID());
		break;
	case FishingManager::TUGRIGHT:
		newBoxID = manager->createWindow(player, suiBox->getBoxID());
		break;
	case FishingManager::TUGLEFT:
		newBoxID = manager->createWindow(player, suiBox->getBoxID());
		break;
	case FishingManager::REEL:
		newBoxID = manager->createWindow(player, suiBox->getBoxID());
		break;
	case FishingManager::STOPFISHING:
		player->sendSystemMessage("@fishing:stop_fishing"); //You reel-in your line and stop fishing...
		manager->stopFishing(player, suiBox->getBoxID(), true);
		return;
		break;
	default:
		newBoxID = manager->createWindow(player, suiBox->getBoxID());
		break;
	}

	manager->setFishBoxID(player, suiBox->getBoxID());
}

void SuiManager::handleCharacterBuilderSelectItem(CreatureObject* player, SuiBox* suiBox, uint32 cancel, Vector<UnicodeString>* args) {
	if (!ConfigManager::instance()->getCharacterBuilderEnabled())
		return;

	ZoneServer* zserv = player->getZoneServer();

	if (args->size() < 1)
		return;

	bool otherPressed = false;
	int index = 0;

	if(args->size() > 1) {
		otherPressed = Bool::valueOf(args->get(0).toString());
		index = Integer::valueOf(args->get(1).toString());
	} else {
		index = Integer::valueOf(args->get(0).toString());
	}

	if (!suiBox->isCharacterBuilderBox())
		return;

	ManagedReference<SuiCharacterBuilderBox*> cbSui = cast<SuiCharacterBuilderBox*>( suiBox);

	const CharacterBuilderMenuNode* currentNode = cbSui->getCurrentNode();

	PlayerObject* ghost = player->getPlayerObject();

	//If cancel was pressed then we kill the box/menu.
	if (cancel != 0 || ghost == nullptr)
		return;

	//Back was pressed. Send the node above it.
	if (otherPressed) {
		const CharacterBuilderMenuNode* parentNode = currentNode->getParentNode();

		if(parentNode == nullptr)
			return;

		cbSui->setCurrentNode(parentNode);

		ghost->addSuiBox(cbSui);
		player->sendMessage(cbSui->generateMessage());
		return;
	}

	const CharacterBuilderMenuNode* node = currentNode->getChildNodeAt(index);

	//Node doesn't exist or the index was out of bounds. Should probably resend the menu here.
	if (node == nullptr) {
		ghost->addSuiBox(cbSui);
		player->sendMessage(cbSui->generateMessage());
		return;
	}

	if (node->hasChildNodes()) {
		//If it has child nodes, display them.
		cbSui->setCurrentNode(node);
		ghost->addSuiBox(cbSui);
		player->sendMessage(cbSui->generateMessage());
	} else {
		ManagedReference<SceneObject*> scob = cbSui->getUsingObject().get();

		if (scob == nullptr)
			return;

		CharacterBuilderTerminal* bluefrog = scob.castTo<CharacterBuilderTerminal*>();

		if (bluefrog == nullptr)
			return;

		String templatePath = node->getTemplatePath();

		if (templatePath.indexOf(".iff") < 0) { // Non-item selections

			if (templatePath == "unlearn_all_skills") {

				SkillManager::instance()->surrenderAllSkills(player, true, false);
				player->sendSystemMessage("All skills unlearned.");

			} else if (templatePath == "cleanse_character") {
				if (!player->isInCombat()) {
					player->sendSystemMessage("You have been cleansed from the signs of previous battles.");

					for (int i = 0; i < 9; ++i) {
						player->setWounds(i, 0);
					}

					player->setShockWounds(0);
				} else {
					player->sendSystemMessage("Not within combat.");
					return;
				}
			} else if (templatePath == "fill_force_bar") {
				if (ghost->isJedi()) {
					if (!player->isInCombat()) {
						player->sendSystemMessage("You force bar has been filled.");

						ghost->setForcePower(ghost->getForcePowerMax(), true);
					} else {
						player->sendSystemMessage("Not within combat.");
					}
				}
			} else if (templatePath == "leaderboard_pvp") {
				// Stack, ability to view pvp ranks ON TERMINAL
				ManagedReference<SuiListBox*> listBox = new SuiListBox(player, SuiWindowType::ADMIN_LIST);
				listBox->setPromptTitle("PVP Ranking List");
				listBox->setPromptText("Here are the top 5 PVPers right now");
				listBox->setCancelButton(true, "@cancel");

				// Query the DB!
				try
				{
					String pvpQuery = "SELECT *, count(*) as 'NumKills' from gcw_kills GROUP BY killer ORDER BY NumKills DESC LIMIT 5;";
					Reference<ResultSet*> results = ServerDatabase::instance()->executeQuery(pvpQuery);
					String playerLabel = "Player: ";
					String ratingLabel = " | PVP Rating: ";
					String killsLabel = " | Kills: ";
					while(results->next())
					{
						int32 id = results->getInt(0);
						String playerName = results->getString(1);
						String playerRating = results->getString(2);
						int32 numKills = results->getInt(8);

						String killString = playerLabel + playerName + ratingLabel + playerRating + killsLabel + numKills;
						listBox->addMenuItem(killString);
					}

					Locker locker(player);

					player->getPlayerObject()->closeSuiWindowType(SuiWindowType::ADMIN_LIST);

					player->getPlayerObject()->addSuiBox(listBox);
					player->sendMessage(listBox->generateMessage());

				} catch (DatabaseException& e) {
						error(e.getMessage());
				}

			}else if (templatePath == "leaderboard_faction") {
				// Stack, ability to view pvp ranks ON TERMINAL
				ManagedReference<SuiListBox*> listBox = new SuiListBox(player, SuiWindowType::ADMIN_LIST);
				listBox->setPromptTitle("Top Faction Contributors");
				listBox->setPromptText("Here are the top 5 faction contributors right now");
				listBox->setCancelButton(true, "@cancel");

				// Query the DB!
				try
				{
					String factionQuery = "SELECT * from faction_tracker ORDER BY reward DESC LIMIT 5;";
					Reference<ResultSet*> results = ServerDatabase::instance()->executeQuery(factionQuery);
					String playerLabel = "Player: ";
					String npcKillsLabel = " | NPC Kills: ";
					String factionRewardLabel = " | Faction: ";
					while(results->next())
					{
						int32 id = results->getInt(0);
						String playerName = results->getString(1);
						int32 npcKills = results->getInt(2);
						int32 factionReward = results->getInt(3);

						String killString = playerLabel + playerName + npcKillsLabel + npcKills + factionRewardLabel + factionReward;
						listBox->addMenuItem(killString);
					}

					Locker locker(player);

					player->getPlayerObject()->closeSuiWindowType(SuiWindowType::ADMIN_LIST);

					player->getPlayerObject()->addSuiBox(listBox);
					player->sendMessage(listBox->generateMessage());

				} catch (DatabaseException& e) {
						error(e.getMessage());
				}

			}	else if (templatePath == "heal_wounds") {
				// Stack, creating ability to heal wounds for PLAYERS
				if(player->verifyCashCredits(50000))
				{
					player->subtractCashCredits(50000);
					for (int i = 0; i < 9; ++i) {
						player->setWounds(i, 0);
					}
					player->sendSystemMessage("All wounds healed!");
				}
				else
				{
					player->sendSystemMessage("Not enough credits for wound heal");
				}

			} else if (templatePath == "heal_battle_fatigue") {
				// Stack, creating ability to heal wounds for PLAYERS
				if(player->verifyCashCredits(50000))
				{
					player->subtractCashCredits(50000);
					player->setShockWounds(0, true);
					player->sendSystemMessage("All BF healed!");
				}
				else
				{
					player->sendSystemMessage("Not enough credits for BF heal");
				}

			} else if (templatePath == "reset_buffs") {
				if (!player->isInCombat()) {
					player->sendSystemMessage("Your buffs have been reset.");

					player->clearBuffs(true, false);

					ghost->setFoodFilling(0);
					ghost->setDrinkFilling(0);
				} else {
					player->sendSystemMessage("Not within combat.");
					return;
				}

			} else if (templatePath.beginsWith("crafting_apron_")) {
				//"object/tangible/wearables/apron/apron_chef_s01.iff"
				//"object/tangible/wearables/ithorian/apron_chef_jacket_s01_ith.iff"

				ManagedReference<SceneObject*> inventory = player->getSlottedObject("inventory");
				if (inventory == nullptr) {
					return;
				}

				uint32 itemCrc = ( player->getSpecies() != CreatureObject::ITHORIAN ) ? 0x5DDC4E5D : 0x6C191FBB;

				ManagedReference<WearableObject*> apron = zserv->createObject(itemCrc, 2).castTo<WearableObject*>();

				if (apron == nullptr) {
					player->sendSystemMessage("There was an error creating the requested item. Please report this issue.");
					ghost->addSuiBox(cbSui);
					player->sendMessage(cbSui->generateMessage());

					error("could not create frog crafting apron");
					return;
				}

				Locker locker(apron);

				apron->createChildObjects();

				if (apron->isWearableObject()) {
					apron->addMagicBit(false);

					UnicodeString modName = "(General)";
					apron->addSkillMod(SkillModManager::WEARABLE, "general_assembly", 25);
					apron->addSkillMod(SkillModManager::WEARABLE, "general_experimentation", 25);

					if(templatePath == "crafting_apron_armorsmith") {
						modName = "(Armorsmith)";
						apron->addSkillMod(SkillModManager::WEARABLE, "armor_assembly", 25);
						apron->addSkillMod(SkillModManager::WEARABLE, "armor_experimentation", 25);
						apron->addSkillMod(SkillModManager::WEARABLE, "armor_repair", 25);
					} else if(templatePath == "crafting_apron_weaponsmith") {
						modName = "(Weaponsmith)";
						apron->addSkillMod(SkillModManager::WEARABLE, "weapon_assembly", 25);
						apron->addSkillMod(SkillModManager::WEARABLE, "weapon_experimentation", 25);
						apron->addSkillMod(SkillModManager::WEARABLE, "weapon_repair", 25);
						apron->addSkillMod(SkillModManager::WEARABLE, "grenade_assembly", 25);
						apron->addSkillMod(SkillModManager::WEARABLE, "grenade_experimentation", 25);
					} else if(templatePath == "crafting_apron_tailor") {
						modName = "(Tailor)";
						apron->addSkillMod(SkillModManager::WEARABLE, "clothing_assembly", 25);
						apron->addSkillMod(SkillModManager::WEARABLE, "clothing_experimentation", 25);
						apron->addSkillMod(SkillModManager::WEARABLE, "clothing_repair", 25);
					} else if(templatePath == "crafting_apron_chef") {
						modName = "(Chef)";
						apron->addSkillMod(SkillModManager::WEARABLE, "food_assembly", 25);
						apron->addSkillMod(SkillModManager::WEARABLE, "food_experimentation", 25);
					} else if(templatePath == "crafting_apron_architect") {
						modName = "(Architect)";
						apron->addSkillMod(SkillModManager::WEARABLE, "structure_assembly", 25);
						apron->addSkillMod(SkillModManager::WEARABLE, "structure_experimentation", 25);
						apron->addSkillMod(SkillModManager::WEARABLE, "structure_complexity", 25);
					} else if(templatePath == "crafting_apron_droid_engineer") {
						modName = "(Droid Engineer)";
						apron->addSkillMod(SkillModManager::WEARABLE, "droid_assembly", 25);
						apron->addSkillMod(SkillModManager::WEARABLE, "droid_experimentation", 25);
						apron->addSkillMod(SkillModManager::WEARABLE, "droid_complexity", 25);
					} else if(templatePath == "crafting_apron_doctor") {
						modName = "(Doctor)";
						apron->addSkillMod(SkillModManager::WEARABLE, "medicine_assembly", 25);
						apron->addSkillMod(SkillModManager::WEARABLE, "medicine_experimentation", 25);
					} else if(templatePath == "crafting_apron_combat_medic") {
						modName = "(Combat Medic)";
						apron->addSkillMod(SkillModManager::WEARABLE, "combat_medicine_assembly", 25);
						apron->addSkillMod(SkillModManager::WEARABLE, "combat_medicine_experimentation", 25);
					}

					UnicodeString apronName = "Crafting Apron " + modName;
					apron->setCustomObjectName(apronName, false);
				}

				TransactionLog trx(TrxCode::CHARACTERBUILDER, player, apron);

				if (inventory->transferObject(apron, -1, true)) {
					trx.commit();
					apron->sendTo(player, true);
				} else {
					trx.abort() << "Failed to transferObject to player inventory";
					apron->destroyObjectFromDatabase(true);
					return;
				}

				StringIdChatParameter stringId;
				stringId.setStringId("@faction_perk:bonus_base_name"); //You received a: %TO.
				stringId.setTO(apron->getObjectID());
				player->sendSystemMessage(stringId);

			} else if (templatePath == "enhance_character") {
				bluefrog->enhanceCharacter(player);

			} else if (templatePath == "axkva_roll_rebel") {
							Reference<PlayerObject*> ghost = player->getSlottedObject("ghost").castTo<PlayerObject*>();
							Zone* zone = player->getZone();
							GCWManager* gcwMan = zone->getGCWManager();
							if (ghost == nullptr || gcwMan == nullptr)
								return;
							uint32 winningFaction = gcwMan->getWinningFaction();
							if (winningFaction != Factions::FACTIONREBEL ){
								player->sendSystemMessage("This planet is not owned by the Separatists!");
								return;
							}
							int gcwCurrency = ghost->getExperience("gcw_currency_rebel");
							if (gcwCurrency < 20000){
								player->sendSystemMessage("You do not have enough War Renown for a loot roll");
								return;
							}
							ManagedReference<LootManager*> lootManager = player->getZoneServer()->getLootManager();
							ManagedReference<SceneObject*> inventory = player->getSlottedObject("inventory");
							if (lootManager == nullptr || inventory == nullptr) {
								player->sendSystemMessage("Loot roll failed");
								return;
							}
							//Check if inventory is full.
							if (inventory->isContainerFullRecursive()) {
								player->sendSystemMessage("Loot roll failed because inventory is full"); //"Some foraged items were discarded, because your inventory is full."
								return;
							}
							int success = System::random(100);
							TransactionLog trx(TrxCode::BOUNTYSYSTEM, player);
							if (success > 95) {
								lootManager->createLoot(trx, inventory, "axkva_min", 302);
							}else{
								lootManager->createLoot(trx, inventory, "axkva_min_terminal", 302);
							}
							player->sendSystemMessage("Congratulations! You have received loot from Axkva Min");
							player->getZoneServer()->getPlayerManager()->awardExperience(player, "gcw_currency_rebel", -20000);
						} else if (templatePath == "axkva_roll_imperial") {
							Reference<PlayerObject*> ghost = player->getSlottedObject("ghost").castTo<PlayerObject*>();
							GCWManager* gcwMan = player->getZone()->getGCWManager();
							if (ghost == nullptr || gcwMan == nullptr)
								return;
							uint32 winningFaction = gcwMan->getWinningFaction();
							if (winningFaction != Factions::FACTIONIMPERIAL ){
								player->sendSystemMessage("This planet is not owned by the Republic!");
								return;
							}
							int gcwCurrency = ghost->getExperience("gcw_currency_imperial");
							if (gcwCurrency < 20000){
								player->sendSystemMessage("You do not have enough War Renown for a loot roll");
								return;
							}
							ManagedReference<LootManager*> lootManager = player->getZoneServer()->getLootManager();
							ManagedReference<SceneObject*> inventory = player->getSlottedObject("inventory");
							if (lootManager == nullptr || inventory == nullptr) {
								player->sendSystemMessage("Loot roll failed");
								return;
							}
							//Check if inventory is full.
							if (inventory->isContainerFullRecursive()) {
								player->sendSystemMessage("Loot roll failed because inventory is full"); //"Some foraged items were discarded, because your inventory is full."
								return;
							}
							int success = System::random(100);
							TransactionLog trx(TrxCode::BOUNTYSYSTEM, player);
							if (success > 95){
								lootManager->createLoot(trx, inventory, "axkva_min", 302);
							} else {
								lootManager->createLoot(trx, inventory, "axkva_min_terminal", 302);
							}
							player->sendSystemMessage("Congratulations! You have received loot from Axkva Min");
							player->getZoneServer()->getPlayerManager()->awardExperience(player, "gcw_currency_imperial", -20000);
						} else if (templatePath == "acklay_roll_rebel") {
							Reference<PlayerObject*> ghost = player->getSlottedObject("ghost").castTo<PlayerObject*>();
							Zone* zone = player->getZone();
							GCWManager* gcwMan = zone->getGCWManager();
							if (ghost == nullptr || gcwMan == nullptr)
								return;
							uint32 winningFaction = gcwMan->getWinningFaction();
							if (winningFaction != Factions::FACTIONREBEL ){
								player->sendSystemMessage("This planet is not owned by the Separatists!");
								return;
							}
							int gcwCurrency = ghost->getExperience("gcw_currency_rebel");
							if (gcwCurrency < 20000){
								player->sendSystemMessage("You do not have enough War Renown for a loot roll");
								return;
							}
							ManagedReference<LootManager*> lootManager = player->getZoneServer()->getLootManager();
							ManagedReference<SceneObject*> inventory = player->getSlottedObject("inventory");
							if (lootManager == nullptr || inventory == nullptr) {
								player->sendSystemMessage("Loot roll failed");
								return;
							}
							//Check if inventory is full.
							if (inventory->isContainerFullRecursive()) {
								player->sendSystemMessage("Loot roll failed because inventory is full"); //"Some foraged items were discarded, because your inventory is full."
								return;
							}
							int success = System::random(100);
							TransactionLog trx(TrxCode::BOUNTYSYSTEM, player);
							if (success > 50) {
								lootManager->createLoot(trx, inventory, "acklay", 157);
							} else if (success < 51 && success > 40){
								lootManager->createLoot(trx, inventory, "weapons_all", 336);
							} else if (success < 41 && success > 30){
								lootManager->createLoot(trx, inventory, "armor_all", 336);
							} else if (success < 31 && success > 25){
								lootManager->createLoot(trx, inventory, "armor_attachments", 336);
							} else if (success < 26 && success > 20){
								lootManager->createLoot(trx, inventory, "clothing_attachments", 336);
							} else if (success < 21 && success > 10){
								lootManager->createLoot(trx, inventory, "geonosian_common", 66);
							} else if (success < 11){
								lootManager->createLoot(trx, inventory, "geonosian_hard", 66);
							}
							player->sendSystemMessage("Congratulations! You have received loot from the Acklay and Geo Caves!");
							player->getZoneServer()->getPlayerManager()->awardExperience(player, "gcw_currency_rebel", -20000);
						} else if (templatePath == "acklay_roll_imperial") {
							Reference<PlayerObject*> ghost = player->getSlottedObject("ghost").castTo<PlayerObject*>();
							Zone* zone = player->getZone();
							GCWManager* gcwMan = zone->getGCWManager();
							if (ghost == nullptr || gcwMan == nullptr)
								return;
							uint32 winningFaction = gcwMan->getWinningFaction();
							if (winningFaction != Factions::FACTIONIMPERIAL ){
								player->sendSystemMessage("This planet is not owned by the Republic!");
								return;
							}
							int gcwCurrency = ghost->getExperience("gcw_currency_imperial");
							if (gcwCurrency < 20000){
								player->sendSystemMessage("You do not have enough War Renown for a loot roll");
								return;
							}
							ManagedReference<LootManager*> lootManager = player->getZoneServer()->getLootManager();
							ManagedReference<SceneObject*> inventory = player->getSlottedObject("inventory");
							if (lootManager == nullptr || inventory == nullptr) {
								player->sendSystemMessage("Loot roll failed");
								return;
							}
							//Check if inventory is full.
							if (inventory->isContainerFullRecursive()) {
								player->sendSystemMessage("Loot roll failed because inventory is full"); //"Some foraged items were discarded, because your inventory is full."
								return;
							}
							int success = System::random(100);
							TransactionLog trx(TrxCode::BOUNTYSYSTEM, player);
							if (success > 50) {
								lootManager->createLoot(trx, inventory, "acklay", 157);
							} else if (success < 51 && success > 40){
								lootManager->createLoot(trx, inventory, "weapons_all", 336);
							} else if (success < 41 && success > 30){
								lootManager->createLoot(trx, inventory, "armor_all", 336);
							} else if (success < 31 && success > 25){
								lootManager->createLoot(trx, inventory, "armor_attachments", 336);
							} else if (success < 26 && success > 20){
								lootManager->createLoot(trx, inventory, "clothing_attachments", 336);
							} else if (success < 21 && success > 10){
								lootManager->createLoot(trx, inventory, "geonosian_common", 66);
							} else if (success < 11){
								lootManager->createLoot(trx, inventory, "geonosian_hard", 66);
							}
							player->sendSystemMessage("Congratulations! You have received loot from the Acklay and Geo Caves!");
							player->getZoneServer()->getPlayerManager()->awardExperience(player, "gcw_currency_imperial", -20000);
						} else if (templatePath == "firespider_roll_imperial") {
							Reference<PlayerObject*> ghost = player->getSlottedObject("ghost").castTo<PlayerObject*>();
							Zone* zone = player->getZone();
							GCWManager* gcwMan = zone->getGCWManager();
							if (ghost == nullptr || gcwMan == nullptr)
								return;
							uint32 winningFaction = gcwMan->getWinningFaction();
							if (winningFaction != Factions::FACTIONIMPERIAL ){
								player->sendSystemMessage("This planet is not owned by the Republic!");
								return;
							}
							int gcwCurrency = ghost->getExperience("gcw_currency_imperial");
							if (gcwCurrency < 20000){
								player->sendSystemMessage("You do not have enough War Renown for a loot roll");
								return;
							}
							ManagedReference<LootManager*> lootManager = player->getZoneServer()->getLootManager();
							ManagedReference<SceneObject*> inventory = player->getSlottedObject("inventory");
							if (lootManager == nullptr || inventory == nullptr) {
								player->sendSystemMessage("Loot roll failed");
								return;
							}
							//Check if inventory is full.
							if (inventory->isContainerFullRecursive()) {
								player->sendSystemMessage("Loot roll failed because inventory is full"); //"Some foraged items were discarded, because your inventory is full."
								return;
							}
							int success = System::random(100);
							TransactionLog trx(TrxCode::BOUNTYSYSTEM, player);
							if (success > 75) {
								lootManager->createLoot(trx, inventory, "fire_breathing_spider", 108);
							} else if (success < 76 && success > 65){
								lootManager->createLoot(trx, inventory, "weapons_all", 336);
							} else if (success < 66 && success > 55){
								lootManager->createLoot(trx, inventory, "armor_all", 336);
							} else if (success < 56 && success > 45){
								lootManager->createLoot(trx, inventory, "armor_attachments", 336);
							} else if (success < 46 && success > 35){
								lootManager->createLoot(trx, inventory, "clothing_attachments", 336);
							} else if (success < 36 && success > 15){
								lootManager->createLoot(trx, inventory, "geonosian_common", 66);
							} else if (success < 16){
								lootManager->createLoot(trx, inventory, "geonosian_hard", 66);
							}
							player->sendSystemMessage("Congratulations! You have received loot from the Fire Spider and Geo Caves!");
							player->getZoneServer()->getPlayerManager()->awardExperience(player, "gcw_currency_imperial", -20000);
						} else if (templatePath == "firespider_roll_rebel") {
							Reference<PlayerObject*> ghost = player->getSlottedObject("ghost").castTo<PlayerObject*>();
							Zone* zone = player->getZone();
							GCWManager* gcwMan = zone->getGCWManager();
							if (ghost == nullptr || gcwMan == nullptr)
								return;
							uint32 winningFaction = gcwMan->getWinningFaction();
							if (winningFaction != Factions::FACTIONREBEL ){
								player->sendSystemMessage("This planet is not owned by the Separatists!");
								return;
							}
							int gcwCurrency = ghost->getExperience("gcw_currency_rebel");
							if (gcwCurrency < 20000){
								player->sendSystemMessage("You do not have enough War Renown for a loot roll");
								return;
							}
							ManagedReference<LootManager*> lootManager = player->getZoneServer()->getLootManager();
							ManagedReference<SceneObject*> inventory = player->getSlottedObject("inventory");
							if (lootManager == nullptr || inventory == nullptr) {
								player->sendSystemMessage("Loot roll failed");
								return;
							}
							//Check if inventory is full.
							if (inventory->isContainerFullRecursive()) {
								player->sendSystemMessage("Loot roll failed because inventory is full"); //"Some foraged items were discarded, because your inventory is full."
								return;
							}
							int success = System::random(100);
							TransactionLog trx(TrxCode::BOUNTYSYSTEM, player);
							if (success > 75) {
								lootManager->createLoot(trx, inventory, "fire_breathing_spider", 108);
							} else if (success < 76 && success > 65){
								lootManager->createLoot(trx, inventory, "weapons_all", 336);
							} else if (success < 66 && success > 55){
								lootManager->createLoot(trx, inventory, "armor_all", 336);
							} else if (success < 56 && success > 45){
								lootManager->createLoot(trx, inventory, "armor_attachments", 336);
							} else if (success < 46 && success > 35){
								lootManager->createLoot(trx, inventory, "clothing_attachments", 336);
							} else if (success < 36 && success > 15){
								lootManager->createLoot(trx, inventory, "geonosian_common", 66);
							} else if (success < 16){
								lootManager->createLoot(trx, inventory, "geonosian_hard", 66);
							}
							player->sendSystemMessage("Congratulations! You have received loot from the Fire Spider and Geo Caves");
							player->getZoneServer()->getPlayerManager()->awardExperience(player, "gcw_currency_rebel", -20000);
						} else if (templatePath == "ancient_roll_rebel") {
							Reference<PlayerObject*> ghost = player->getSlottedObject("ghost").castTo<PlayerObject*>();
							Zone* zone = player->getZone();
							GCWManager* gcwMan = zone->getGCWManager();
							if (ghost == nullptr || gcwMan == nullptr)
								return;
							uint32 winningFaction = gcwMan->getWinningFaction();
							if (winningFaction != Factions::FACTIONREBEL ){
								player->sendSystemMessage("This planet is not owned by the Separatists!");
								return;
							}
							int gcwCurrency = ghost->getExperience("gcw_currency_rebel");
							if (gcwCurrency < 20000){
								player->sendSystemMessage("You do not have enough War Renown for a loot roll");
								return;
							}
							ManagedReference<LootManager*> lootManager = player->getZoneServer()->getLootManager();
							ManagedReference<SceneObject*> inventory = player->getSlottedObject("inventory");
							if (lootManager == nullptr || inventory == nullptr) {
								player->sendSystemMessage("Loot roll failed");
								return;
							}
							//Check if inventory is full.
							if (inventory->isContainerFullRecursive()) {
								player->sendSystemMessage("Loot roll failed because inventory is full"); //"Some foraged items were discarded, because your inventory is full."
								return;
							}
							int success = System::random(100);
							TransactionLog trx(TrxCode::BOUNTYSYSTEM, player);
							if (success < 21)
							{
								lootManager->createLoot(trx, inventory, "armor_all", 336);
							}else if (success > 20 && success < 41){
								lootManager->createLoot(trx, inventory, "weapons_all", 336);
							} else if (success > 40 && success < 66) {
								lootManager->createLoot(trx, inventory, "krayt_dragon_common", 336);
							} else if (success > 65 && success < 86){
								lootManager->createLoot(trx, inventory, "krayt_tissue_rare", 336);
							} else if (success > 85){
								lootManager->createLoot(trx, inventory, "krayt_pearls", 336);
							}
							player->sendSystemMessage("Congratulations! You have received loot from a Krayt Dragon Ancient!");
							player->getZoneServer()->getPlayerManager()->awardExperience(player, "gcw_currency_rebel", -20000);
						} else if (templatePath == "ancient_roll_imperial") {
							Reference<PlayerObject*> ghost = player->getSlottedObject("ghost").castTo<PlayerObject*>();
							Zone* zone = player->getZone();
							GCWManager* gcwMan = zone->getGCWManager();
							if (ghost == nullptr || gcwMan == nullptr)
								return;
							uint32 winningFaction = gcwMan->getWinningFaction();
							if (winningFaction != Factions::FACTIONIMPERIAL ){
								player->sendSystemMessage("This planet is not owned by the Republic!");
								return;
							}
							int gcwCurrency = ghost->getExperience("gcw_currency_imperial");
							if (gcwCurrency < 20000){
								player->sendSystemMessage("You do not have enough War Renown for a loot roll");
								return;
							}
							ManagedReference<LootManager*> lootManager = player->getZoneServer()->getLootManager();
							ManagedReference<SceneObject*> inventory = player->getSlottedObject("inventory");
							if (lootManager == nullptr || inventory == nullptr) {
								player->sendSystemMessage("Loot roll failed");
								return;
							}
							//Check if inventory is full.
							if (inventory->isContainerFullRecursive()) {
								player->sendSystemMessage("Loot roll failed because inventory is full"); //"Some foraged items were discarded, because your inventory is full."
								return;
							}
							int success = System::random(100);
							TransactionLog trx(TrxCode::BOUNTYSYSTEM, player);
							if (success < 21)
							{
								lootManager->createLoot(trx, inventory, "armor_all", 336);
							}else if (success > 20 && success < 41){
								lootManager->createLoot(trx, inventory, "weapons_all", 336);
							} else if (success > 40 && success < 66) {
								lootManager->createLoot(trx, inventory, "krayt_dragon_common", 336);
							} else if (success > 65 && success < 86){
								lootManager->createLoot(trx, inventory, "krayt_tissue_rare", 336);
							} else if (success > 85){
								lootManager->createLoot(trx, inventory, "krayt_pearls", 336);
							}
							player->sendSystemMessage("Congratulations! You have received loot from a Krayt Dragon Ancient!");
							player->getZoneServer()->getPlayerManager()->awardExperience(player, "gcw_currency_imperial", -20000);
						} else if (templatePath == "base_roll_rep_01") {
							Reference<PlayerObject*> ghost = player->getSlottedObject("ghost").castTo<PlayerObject*>();
							Zone* zone = player->getZone();
							GCWManager* gcwMan = zone->getGCWManager();
							if (ghost == nullptr || gcwMan == nullptr)
								return;
							int gcwCurrency = ghost->getExperience("gcw_currency_imperial");
							if (gcwCurrency < 10000){
								player->sendSystemMessage("You do not have enough War Renown for a pvp base.");
								return;
							}
							ManagedReference<LootManager*> lootManager = player->getZoneServer()->getLootManager();
							ManagedReference<SceneObject*> inventory = player->getSlottedObject("inventory");
							if (lootManager == nullptr || inventory == nullptr) {
								player->sendSystemMessage("Loot roll failed");
								return;
							}
							//Check if inventory is full.
							if (inventory->isContainerFullRecursive()) {
								player->sendSystemMessage("Loot roll failed because inventory is full"); //"Some foraged items were discarded, because your inventory is full."
								return;
							}
							TransactionLog trx(TrxCode::BOUNTYSYSTEM, player);
							lootManager->createLoot(trx, inventory, "rep_base_01", 336);
							player->sendSystemMessage("Congratulations! You have received a Republic PVP Base!");
							player->getZoneServer()->getPlayerManager()->awardExperience(player, "gcw_currency_imperial", -10000);
						} else if (templatePath == "base_roll_rep_02") {
							Reference<PlayerObject*> ghost = player->getSlottedObject("ghost").castTo<PlayerObject*>();
							Zone* zone = player->getZone();
							GCWManager* gcwMan = zone->getGCWManager();
							if (ghost == nullptr || gcwMan == nullptr)
								return;
							int gcwCurrency = ghost->getExperience("gcw_currency_imperial");
							if (gcwCurrency < 12000){
								player->sendSystemMessage("You do not have enough War Renown for a pvp base.");
								return;
							}
							ManagedReference<LootManager*> lootManager = player->getZoneServer()->getLootManager();
							ManagedReference<SceneObject*> inventory = player->getSlottedObject("inventory");
							if (lootManager == nullptr || inventory == nullptr) {
								player->sendSystemMessage("Loot roll failed");
								return;
							}
							//Check if inventory is full.
							if (inventory->isContainerFullRecursive()) {
								player->sendSystemMessage("Loot roll failed because inventory is full"); //"Some foraged items were discarded, because your inventory is full."
								return;
							}
							TransactionLog trx(TrxCode::BOUNTYSYSTEM, player);
							lootManager->createLoot(trx, inventory, "rep_base_02", 336);
							player->sendSystemMessage("Congratulations! You have received a Republic PVP Base!");
							player->getZoneServer()->getPlayerManager()->awardExperience(player, "gcw_currency_imperial", -12000);
						} else if (templatePath == "base_roll_rep_03") {
							Reference<PlayerObject*> ghost = player->getSlottedObject("ghost").castTo<PlayerObject*>();
							Zone* zone = player->getZone();
							GCWManager* gcwMan = zone->getGCWManager();
							if (ghost == nullptr || gcwMan == nullptr)
								return;
							int gcwCurrency = ghost->getExperience("gcw_currency_imperial");
							if (gcwCurrency < 14000){
								player->sendSystemMessage("You do not have enough War Renown for a pvp base.");
								return;
							}
							ManagedReference<LootManager*> lootManager = player->getZoneServer()->getLootManager();
							ManagedReference<SceneObject*> inventory = player->getSlottedObject("inventory");
							if (lootManager == nullptr || inventory == nullptr) {
								player->sendSystemMessage("Loot roll failed");
								return;
							}
							//Check if inventory is full.
							if (inventory->isContainerFullRecursive()) {
								player->sendSystemMessage("Loot roll failed because inventory is full"); //"Some foraged items were discarded, because your inventory is full."
								return;
							}
							TransactionLog trx(TrxCode::BOUNTYSYSTEM, player);
							lootManager->createLoot(trx, inventory, "rep_base_03", 336);
							player->sendSystemMessage("Congratulations! You have received a Republic PVP Base!");
							player->getZoneServer()->getPlayerManager()->awardExperience(player, "gcw_currency_imperial", -14000);
						} else if (templatePath == "base_roll_rep_04") {
							Reference<PlayerObject*> ghost = player->getSlottedObject("ghost").castTo<PlayerObject*>();
							Zone* zone = player->getZone();
							GCWManager* gcwMan = zone->getGCWManager();
							if (ghost == nullptr || gcwMan == nullptr)
								return;
							int gcwCurrency = ghost->getExperience("gcw_currency_imperial");
							if (gcwCurrency < 20000){
								player->sendSystemMessage("You do not have enough War Renown for a pvp base.");
								return;
							}
							ManagedReference<LootManager*> lootManager = player->getZoneServer()->getLootManager();
							ManagedReference<SceneObject*> inventory = player->getSlottedObject("inventory");
							if (lootManager == nullptr || inventory == nullptr) {
								player->sendSystemMessage("Loot roll failed");
								return;
							}
							//Check if inventory is full.
							if (inventory->isContainerFullRecursive()) {
								player->sendSystemMessage("Loot roll failed because inventory is full"); //"Some foraged items were discarded, because your inventory is full."
								return;
							}
							TransactionLog trx(TrxCode::BOUNTYSYSTEM, player);
							lootManager->createLoot(trx, inventory, "rep_base_04", 336);
							player->sendSystemMessage("Congratulations! You have received a Republic PVP Base!");
							player->getZoneServer()->getPlayerManager()->awardExperience(player, "gcw_currency_imperial", -20000);
						} else if (templatePath == "base_roll_cis_01") {
							Reference<PlayerObject*> ghost = player->getSlottedObject("ghost").castTo<PlayerObject*>();
							Zone* zone = player->getZone();
							GCWManager* gcwMan = zone->getGCWManager();
							if (ghost == nullptr || gcwMan == nullptr)
								return;
							int gcwCurrency = ghost->getExperience("gcw_currency_imperial");
							if (gcwCurrency < 10000){
								player->sendSystemMessage("You do not have enough War Renown for a pvp base.");
								return;
							}
							ManagedReference<LootManager*> lootManager = player->getZoneServer()->getLootManager();
							ManagedReference<SceneObject*> inventory = player->getSlottedObject("inventory");
							if (lootManager == nullptr || inventory == nullptr) {
								player->sendSystemMessage("Loot roll failed");
								return;
							}
							//Check if inventory is full.
							if (inventory->isContainerFullRecursive()) {
								player->sendSystemMessage("Loot roll failed because inventory is full"); //"Some foraged items were discarded, because your inventory is full."
								return;
							}
							TransactionLog trx(TrxCode::BOUNTYSYSTEM, player);
							lootManager->createLoot(trx, inventory, "cis_base_01", 336);
							player->sendSystemMessage("Congratulations! You have received a CIS PVP Base!");
							player->getZoneServer()->getPlayerManager()->awardExperience(player, "gcw_currency_rebel", -10000);
						} else if (templatePath == "base_roll_cis_02") {
							Reference<PlayerObject*> ghost = player->getSlottedObject("ghost").castTo<PlayerObject*>();
							Zone* zone = player->getZone();
							GCWManager* gcwMan = zone->getGCWManager();
							if (ghost == nullptr || gcwMan == nullptr)
								return;
							int gcwCurrency = ghost->getExperience("gcw_currency_rebel");
							if (gcwCurrency < 12000){
								player->sendSystemMessage("You do not have enough War Renown for a pvp base.");
								return;
							}
							ManagedReference<LootManager*> lootManager = player->getZoneServer()->getLootManager();
							ManagedReference<SceneObject*> inventory = player->getSlottedObject("inventory");
							if (lootManager == nullptr || inventory == nullptr) {
								player->sendSystemMessage("Loot roll failed");
								return;
							}
							//Check if inventory is full.
							if (inventory->isContainerFullRecursive()) {
								player->sendSystemMessage("Loot roll failed because inventory is full"); //"Some foraged items were discarded, because your inventory is full."
								return;
							}
							TransactionLog trx(TrxCode::BOUNTYSYSTEM, player);
							lootManager->createLoot(trx, inventory, "cis_base_02", 336);
							player->sendSystemMessage("Congratulations! You have received a CIS PVP Base!");
							player->getZoneServer()->getPlayerManager()->awardExperience(player, "gcw_currency_rebel", -12000);
						} else if (templatePath == "base_roll_cis_03") {
							Reference<PlayerObject*> ghost = player->getSlottedObject("ghost").castTo<PlayerObject*>();
							Zone* zone = player->getZone();
							GCWManager* gcwMan = zone->getGCWManager();
							if (ghost == nullptr || gcwMan == nullptr)
								return;
							int gcwCurrency = ghost->getExperience("gcw_currency_rebel");
							if (gcwCurrency < 14000){
								player->sendSystemMessage("You do not have enough War Renown for a pvp base.");
								return;
							}
							ManagedReference<LootManager*> lootManager = player->getZoneServer()->getLootManager();
							ManagedReference<SceneObject*> inventory = player->getSlottedObject("inventory");
							if (lootManager == nullptr || inventory == nullptr) {
								player->sendSystemMessage("Loot roll failed");
								return;
							}
							//Check if inventory is full.
							if (inventory->isContainerFullRecursive()) {
								player->sendSystemMessage("Loot roll failed because inventory is full"); //"Some foraged items were discarded, because your inventory is full."
								return;
							}
							TransactionLog trx(TrxCode::BOUNTYSYSTEM, player);
							lootManager->createLoot(trx, inventory, "cis_base_03", 336);
							player->sendSystemMessage("Congratulations! You have received a CIS PVP Base!");
							player->getZoneServer()->getPlayerManager()->awardExperience(player, "gcw_currency_rebel", -14000);
						} else if (templatePath == "base_roll_cis_04") {
							Reference<PlayerObject*> ghost = player->getSlottedObject("ghost").castTo<PlayerObject*>();
							Zone* zone = player->getZone();
							GCWManager* gcwMan = zone->getGCWManager();
							if (ghost == nullptr || gcwMan == nullptr)
								return;
							int gcwCurrency = ghost->getExperience("gcw_currency_rebel");
							if (gcwCurrency < 20000){
								player->sendSystemMessage("You do not have enough War Renown for a pvp base.");
								return;
							}
							ManagedReference<LootManager*> lootManager = player->getZoneServer()->getLootManager();
							ManagedReference<SceneObject*> inventory = player->getSlottedObject("inventory");
							if (lootManager == nullptr || inventory == nullptr) {
								player->sendSystemMessage("Loot roll failed");
								return;
							}
							//Check if inventory is full.
							if (inventory->isContainerFullRecursive()) {
								player->sendSystemMessage("Loot roll failed because inventory is full"); //"Some foraged items were discarded, because your inventory is full."
								return;
							}
							TransactionLog trx(TrxCode::BOUNTYSYSTEM, player);
							lootManager->createLoot(trx, inventory, "cis_base_04", 336);
							player->sendSystemMessage("Congratulations! You have received a CIS PVP Base!");
							player->getZoneServer()->getPlayerManager()->awardExperience(player, "gcw_currency_rebel", -20000);

			} else if (templatePath == "credits") {
				{
					TransactionLog trx(TrxCode::CHARACTERBUILDER, player, 50000, true);
					player->addCashCredits(50000, true);
				}
				player->sendSystemMessage("You have received 50.000 Credits");

			} else if (templatePath == "faction_rebel") {
				ghost->increaseFactionStanding("rebel", 100000);

			} else if (templatePath == "faction_imperial") {
				ghost->increaseFactionStanding("imperial", 100000);

			} else if (templatePath == "language") {
				bluefrog->giveLanguages(player);

			}else if (templatePath == "apply_all_dots_pay") {
				int cash = player->getCashCredits();
				if(cash < 10000)
				{
					player->sendSystemMessage("Not enough cash funds to apply DOTS");
				}
				else
				{
					for (int i = 0; i < 9; ++i) {
						player->setWounds(i, 5000);
					}

					player->setShockWounds(150);
					/*
					player->subtractCashCredits(10000);
					player->addDotState(player, CreatureState::POISONED, scob->getObjectID(), 800, CreatureAttribute::UNKNOWN, 360, -1, 0);
					player->addDotState(player, CreatureState::DISEASED, scob->getObjectID(), 800, CreatureAttribute::UNKNOWN, 360, -1, 0);
					*/

					player->sendSystemMessage("Poison and Disease applied");
				}



			}
			else if (templatePath == "apply_all_dots") {
				player->addDotState(player, CreatureState::POISONED, scob->getObjectID(), 100, CreatureAttribute::UNKNOWN, 60, -1, 0);
				player->addDotState(player, CreatureState::BLEEDING, scob->getObjectID(), 100, CreatureAttribute::UNKNOWN, 60, -1, 0);
				player->addDotState(player, CreatureState::DISEASED, scob->getObjectID(), 100, CreatureAttribute::UNKNOWN, 60, -1, 0);
				player->addDotState(player, CreatureState::ONFIRE, scob->getObjectID(), 100, CreatureAttribute::UNKNOWN, 60, -1, 0, 20);

			} else if (templatePath == "apply_poison_dot") {
				player->addDotState(player, CreatureState::POISONED, scob->getObjectID(), 100, CreatureAttribute::UNKNOWN, 60, -1, 0);

			} else if (templatePath == "apply_bleed_dot") {
				player->addDotState(player, CreatureState::BLEEDING, scob->getObjectID(), 100, CreatureAttribute::UNKNOWN, 60, -1, 0);

			} else if (templatePath == "apply_disease_dot") {
				player->addDotState(player, CreatureState::DISEASED, scob->getObjectID(), 100, CreatureAttribute::UNKNOWN, 60, -1, 0);

			} else if (templatePath == "apply_fire_dot") {
				player->addDotState(player, CreatureState::ONFIRE, scob->getObjectID(), 100, CreatureAttribute::UNKNOWN, 60, -1, 0, 20);

			} else if (templatePath == "clear_dots") {
				player->clearDots();
			} else if (templatePath == "frs_light_side") {
				PlayerManager* pman = zserv->getPlayerManager();
				pman->unlockFRSForTesting(player, 1);
			} else if (templatePath == "frs_dark_side") {
				PlayerManager* pman = zserv->getPlayerManager();
				pman->unlockFRSForTesting(player, 2);

			} else if (templatePath == "color_crystals" || templatePath == "krayt_pearls") {
				ManagedReference<SceneObject*> inventory = player->getSlottedObject("inventory");

				if (inventory == nullptr)
					return;

				LootManager* lootManager = zserv->getLootManager();
				TransactionLog trx(TrxCode::CHARACTERBUILDER, player);
				if (lootManager->createLoot(trx, inventory, templatePath, 300, true)) {
					trx.commit(true);
				} else {
					trx.abort() << "createLoot " << templatePath << " failed.";
				}

			} else if (templatePath == "max_xp") {
				ghost->maximizeExperience();
				player->sendSystemMessage("You have maximized all xp types.");

			} else if (templatePath == "become_glowy") {
				bluefrog->grantGlowyBadges(player);

			} else if (templatePath == "unlock_jedi_initiate") {
				bluefrog->grantJediInitiate(player);

			} else {
				if (templatePath.length() > 0) {
					SkillManager::instance()->awardSkill(templatePath, player, true, true, true);

					if (player->hasSkill(templatePath))
						player->sendSystemMessage("You have learned a skill.");

				} else {
					player->sendSystemMessage("Unknown selection.");
					return;
				}
			}

			ghost->addSuiBox(cbSui);
			player->sendMessage(cbSui->generateMessage());

		} else { // Items
			ManagedReference<SceneObject*> inventory = player->getSlottedObject("inventory");

			if (inventory == nullptr) {
				return;
			}

			if (templatePath.contains("event_perk")) {
				if (!ghost->hasGodMode() && ghost->getEventPerkCount() >= 5) {
					player->sendSystemMessage("@event_perk:pro_too_many_perks"); // You cannot rent any more items right now.
					ghost->addSuiBox(cbSui);
					player->sendMessage(cbSui->generateMessage());
					return;
				}
			}

			ManagedReference<SceneObject*> item = zserv->createObject(node->getTemplateCRC(), 1);

			if (item == nullptr) {
				player->sendSystemMessage("There was an error creating the requested item. Please report this issue.");
				ghost->addSuiBox(cbSui);
				player->sendMessage(cbSui->generateMessage());

				error("could not create frog item: " + node->getDisplayName());
				return;
			}

			Locker locker(item);

			item->createChildObjects();

			if (item->isEventPerkDeed()) {
				EventPerkDeed* deed = item.castTo<EventPerkDeed*>();
				deed->setOwner(player);
				ghost->addEventPerk(deed);
			}

			if (item->isEventPerkItem()) {
				if (item->getServerObjectCRC() == 0x46BD798B) { // Jukebox
					Jukebox* jbox = item.castTo<Jukebox*>();

					if (jbox != nullptr)
						jbox->setOwner(player);
				} else if (item->getServerObjectCRC() == 0x255F612C) { // Shuttle Beacon
					ShuttleBeacon* beacon = item.castTo<ShuttleBeacon*>();

					if (beacon != nullptr)
						beacon->setOwner(player);
				}
				ghost->addEventPerk(item);
			}

			TransactionLog trx(TrxCode::CHARACTERBUILDER, player, item);

			if (inventory->transferObject(item, -1, true)) {
				trx.commit();

				item->sendTo(player, true);

				StringIdChatParameter stringId;
				stringId.setStringId("@faction_perk:bonus_base_name"); //You received a: %TO.
				stringId.setTO(item->getObjectID());
				player->sendSystemMessage(stringId);

			} else {
				trx.abort() << "Failed to transferObject to player inventory";
				item->destroyObjectFromDatabase(true);
				player->sendSystemMessage("Error putting item in inventory.");
				return;
			}

			ghost->addSuiBox(cbSui);
			player->sendMessage(cbSui->generateMessage());
		}

		player->info("[CharacterBuilder] gave player " + templatePath, true);
	}
}

void SuiManager::sendKeypadSui(SceneObject* keypad, SceneObject* creatureSceneObject, const String& play, const String& callback) {

	if (keypad == nullptr)
		return;

	if (creatureSceneObject == nullptr || !creatureSceneObject->isCreatureObject())
		return;

	CreatureObject* creature = cast<CreatureObject*>(creatureSceneObject);

	PlayerObject* playerObject = creature->getPlayerObject();

	if (playerObject != nullptr) {
		ManagedReference<SuiKeypadBox*> keypadSui = new SuiKeypadBox(creature, 0x00);
		keypadSui->setCallback(new LuaSuiCallback(creature->getZoneServer(), play, callback));
		keypadSui->setUsingObject(keypad);
		keypadSui->setForceCloseDisabled();
		creature->sendMessage(keypadSui->generateMessage());
		playerObject->addSuiBox(keypadSui);
	}

}

void SuiManager::sendConfirmSui(SceneObject* terminal, SceneObject* player, const String& play, const String& callback, const String& prompt, const String& button) {

	if (terminal == nullptr)
		return;

	if (player == nullptr || !player->isCreatureObject())
		return;

	CreatureObject* creature = cast<CreatureObject*>(player);

	PlayerObject* playerObject = creature->getPlayerObject();

	if (playerObject != nullptr) {
		ManagedReference<SuiMessageBox*> confirmSui = new SuiMessageBox(creature, 0x00);
		confirmSui->setCallback(new LuaSuiCallback(creature->getZoneServer(), play, callback));
		confirmSui->setUsingObject(terminal);
		confirmSui->setPromptText(prompt);
		confirmSui->setOkButton(true, button);
		confirmSui->setOtherButton(false, "");
		confirmSui->setCancelButton(false, "");
		confirmSui->setForceCloseDistance(32);
		creature->sendMessage(confirmSui->generateMessage());
		playerObject->addSuiBox(confirmSui);
	}

}

void SuiManager::sendInputBox(SceneObject* terminal, SceneObject* player, const String& play, const String& callback, const String& prompt, const String& button) {
	if (terminal == nullptr)
		return;

	if (player == nullptr || !player->isCreatureObject())
		return;

	CreatureObject* creature = cast<CreatureObject*>(player);

	PlayerObject* playerObject = creature->getPlayerObject();

	if (playerObject != nullptr) {
		ManagedReference<SuiInputBox*> confirmSui = new SuiInputBox(creature, 0x00);
		confirmSui->setCallback(new LuaSuiCallback(creature->getZoneServer(), play, callback));
		confirmSui->setUsingObject(terminal);
		confirmSui->setPromptText(prompt);
		confirmSui->setOkButton(true, button);
		confirmSui->setOtherButton(false, "");
		confirmSui->setCancelButton(false, "");
		confirmSui->setForceCloseDistance(32);
		creature->sendMessage(confirmSui->generateMessage());
		playerObject->addSuiBox(confirmSui);
	}

}

void SuiManager::sendMessageBox(SceneObject* usingObject, SceneObject* player, const String& title, const String& text, const String& okButton, const String& screenplay, const String& callback, unsigned int windowType ) {
	if (usingObject == nullptr)
		return;

	if (player == nullptr || !player->isCreatureObject())
		return;

	CreatureObject* creature = cast<CreatureObject*>(player);

	PlayerObject* playerObject = creature->getPlayerObject();

	if (playerObject != nullptr) {
		ManagedReference<SuiMessageBox*> messageBox = new SuiMessageBox(creature, windowType);
		messageBox->setCallback(new LuaSuiCallback(creature->getZoneServer(), screenplay, callback));
		messageBox->setPromptTitle(title);
		messageBox->setPromptText(text);
		messageBox->setUsingObject(usingObject);
		messageBox->setOkButton(true, okButton);
		messageBox->setCancelButton(true, "@cancel");
		messageBox->setForceCloseDistance(32.f);

		creature->sendMessage(messageBox->generateMessage());
		playerObject->addSuiBox(messageBox);
	}
}

void SuiManager::sendListBox(SceneObject* usingObject, SceneObject* player, const String& title, const String& text, const uint8& numOfButtons, const String& cancelButton, const String& otherButton, const String& okButton, LuaObject& options, const String& screenplay, const String& callback, const float& forceCloseDist) {
	if (usingObject == nullptr)
		return;

	if (player == nullptr || !player->isCreatureObject())
		return;

	CreatureObject* creature = cast<CreatureObject*>(player);

	PlayerObject* playerObject = creature->getPlayerObject();

	if (playerObject != nullptr) {

		ManagedReference<SuiListBox*> box = nullptr;

		switch (numOfButtons) {
		case 1:
			box = new SuiListBox(creature, 0x00, SuiListBox::HANDLESINGLEBUTTON);
			box->setCancelButton(false, "");
			box->setOtherButton(false, "");
			box->setOkButton(true, okButton);
			break;
		case 2:
			box = new SuiListBox(creature, 0x00, SuiListBox::HANDLETWOBUTTON);
			box->setCancelButton(true, cancelButton);
			box->setOtherButton(false, "");
			box->setOkButton(true, okButton);
			break;
		case 3:
			box = new SuiListBox(creature, 0x00, SuiListBox::HANDLETHREEBUTTON);
			box->setCancelButton(true, cancelButton);
			box->setOtherButton(true, otherButton);
			box->setOkButton(true, okButton);
			break;
		default:
			return;
			break;
		}

		if (options.isValidTable()) {
			for (int i = 1; i <= options.getTableSize(); ++i) {
				LuaObject table = options.getObjectAt(i);
				box->addMenuItem(table.getStringAt(1), table.getLongAt(2));
				table.pop();
			}

			options.pop();
		}

		box->setCallback(new LuaSuiCallback(creature->getZoneServer(), screenplay, callback));
		box->setPromptTitle(title);
		box->setPromptText(text);
		box->setUsingObject(usingObject);
		box->setForceCloseDistance(forceCloseDist);

		creature->sendMessage(box->generateMessage());
		playerObject->addSuiBox(box);
	}
}

void SuiManager::sendTransferBox(SceneObject* usingObject, SceneObject* player, const String& title, const String& text, LuaObject& optionsAddFrom, LuaObject& optionsAddTo, const String& screenplay, const String& callback) {
	if (usingObject == nullptr)
		return;

	if (player == nullptr || !player->isCreatureObject())
		return;

	CreatureObject* creature = cast<CreatureObject*>(player);

	PlayerObject* playerObject = creature->getPlayerObject();

	if (playerObject != nullptr) {

		ManagedReference<SuiTransferBox*> box = nullptr;

		box = new SuiTransferBox(creature, 0x00);

		if(optionsAddFrom.isValidTable()){
			String optionAddFromTextString = optionsAddFrom.getStringAt(1);
			String optionAddFromStartingString = optionsAddFrom.getStringAt(2);
			String optionAddFromRatioString = optionsAddFrom.getStringAt(3);
			box->addFrom(optionAddFromTextString,
					optionAddFromStartingString,
					optionAddFromStartingString, optionAddFromRatioString);
			optionsAddFrom.pop();
		}

		if(optionsAddTo.isValidTable()){
			String optionAddToTextString = optionsAddTo.getStringAt(1);
			String optionAddToStartingString = optionsAddTo.getStringAt(2);
			String optionAddToRatioString = optionsAddTo.getStringAt(3);
			box->addTo(optionAddToTextString,
					optionAddToStartingString,
					optionAddToStartingString, optionAddToRatioString);
			optionsAddTo.pop();
		}

		box->setCallback(new LuaSuiCallback(creature->getZoneServer(), screenplay, callback));
		box->setPromptTitle(title);
		box->setPromptText(text);
		box->setUsingObject(usingObject);
		box->setForceCloseDistance(32.f);

		creature->sendMessage(box->generateMessage());
		playerObject->addSuiBox(box);
	}
}

int32 SuiManager::sendSuiPage(CreatureObject* creature, SuiPageData* pageData, const String& play, const String& callback, unsigned int windowType) {

	if (pageData == nullptr)
		return 0;

	if (creature == nullptr || !creature->isPlayerCreature())
		return 0;

	PlayerObject* playerObject = creature->getPlayerObject();

	if (playerObject != nullptr) {
		ManagedReference<SuiBoxPage*> boxPage = new SuiBoxPage(creature, pageData, windowType);
		boxPage->setCallback(new LuaSuiCallback(creature->getZoneServer(), play, callback));
		creature->sendMessage(boxPage->generateMessage());
		playerObject->addSuiBox(boxPage);

		return boxPage->getBoxID();
	}

	return 0;
}
