/*
 * MissionTerminalImplementation.cpp
 *
 *  Created on: 03/05/11
 *      Author: polonel
 */

#include "server/zone/objects/tangible/terminal/mission/MissionTerminal.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/packets/object/ObjectMenuResponse.h"
#include "server/zone/objects/region/CityRegion.h"
#include "server/zone/managers/city/CityManager.h"
#include "server/zone/managers/city/CityRemoveAmenityTask.h"
#include "server/zone/objects/player/sessions/SlicingSession.h"
#include "server/zone/managers/visibility/VisibilityManager.h"
#include "server/zone/managers/director/DirectorManager.h"
#include "server/db/ServerDatabase.h"
#include <string>
#include "server/zone/objects/player/PlayerObject.h"

void MissionTerminalImplementation::fillObjectMenuResponse(ObjectMenuResponse* menuResponse, CreatureObject* player) {
	TerminalImplementation::fillObjectMenuResponse(menuResponse, player);

	ManagedReference<CityRegion*> city = player->getCityRegion().get();

	if (city != nullptr && city->isMayor(player->getObjectID()) && getParent().get() == nullptr) {

		menuResponse->addRadialMenuItem(72, 3, "@city/city:mt_remove"); // Remove

		menuResponse->addRadialMenuItem(73, 3, "@city/city:align"); // Align
		menuResponse->addRadialMenuItemToRadialID(73, 74, 3, "@city/city:north"); // North
		menuResponse->addRadialMenuItemToRadialID(73, 75, 3, "@city/city:east"); // East
		menuResponse->addRadialMenuItemToRadialID(73, 76, 3, "@city/city:south"); // South
		menuResponse->addRadialMenuItemToRadialID(73, 77, 3, "@city/city:west"); // West
	}

	if (terminalType == "general" || terminalType == "imperial" || terminalType == "rebel"){
		menuResponse->addRadialMenuItem(112, 3, "Choose Mission Level");
		menuResponse->addRadialMenuItem(113, 3, "Choose Mission Direction");
	}

	if (terminalType == "bounty"){
		menuResponse->addRadialMenuItem(114, 3, "See Top BH Leaderboard");
		menuResponse->addRadialMenuItem(115, 3, "See Top Jedi Leaderboard");
		menuResponse->addRadialMenuItem(116, 3, "View Visibility Eligibility");
	}
}

int MissionTerminalImplementation::handleObjectMenuSelect(CreatureObject* player, byte selectedID) {
	ManagedReference<CityRegion*> city = player->getCityRegion().get();

	if (selectedID == 69 && player->hasSkill("combat_smuggler_slicing_01")) {
		if (isBountyTerminal())
			return 0;

		if (city != nullptr && !city->isClientRegion() && city->isBanned(player->getObjectID())) {
			player->sendSystemMessage("@city/city:banned_services"); // You are banned from using this city's services.
			return 0;
		}

		if (player->containsActiveSession(SessionFacadeType::SLICING)) {
			player->sendSystemMessage("@slicing/slicing:already_slicing");
			return 0;
		}

		if (!player->checkCooldownRecovery("slicing.terminal")) {
			StringIdChatParameter message;
			message.setStringId("@slicing/slicing:not_yet"); // You will be able to hack the network again in %DI seconds.
			message.setDI(player->getCooldownTime("slicing.terminal")->getTime() - Time().getTime());
			player->sendSystemMessage(message);
			return 0;
		}

		//Create Session
		ManagedReference<SlicingSession*> session = new SlicingSession(player);
		session->initalizeSlicingMenu(player, _this.getReferenceUnsafeStaticCast());

		return 0;

	} else if (selectedID == 72) {

		if (city != nullptr && city->isMayor(player->getObjectID())) {
			CityRemoveAmenityTask* task = new CityRemoveAmenityTask(_this.getReferenceUnsafeStaticCast(), city);
			task->execute();

			player->sendSystemMessage("@city/city:mt_removed"); // The object has been removed from the city.
		}

		return 0;

	} else if (selectedID == 74 || selectedID == 75 || selectedID == 76 || selectedID == 77) {

		CityManager* cityManager = getZoneServer()->getCityManager();
		cityManager->alignAmenity(city, player, _this.getReferenceUnsafeStaticCast(), selectedID - 74);

		return 0;

	} else if (selectedID == 112) {

		Lua* lua = DirectorManager::instance()->getLuaInstance();

		Reference<LuaFunction*> mission_level_choice = lua->createFunction("mission_level_choice", "openWindow", 0);
		*mission_level_choice << player;

		mission_level_choice->callFunction();
		return 0;
	} else if (selectedID == 113) {

		Lua* lua = DirectorManager::instance()->getLuaInstance();

		Reference<LuaFunction*> mission_direction_choice = lua->createFunction("mission_direction_choice", "openWindow", 0);
		*mission_direction_choice << player;

		mission_direction_choice->callFunction();
		return 0;
	} else if (selectedID == 114) {
		// Stack, ability to view top BH from missions terminals
		ManagedReference<SuiListBox*> listBox = new SuiListBox(player, SuiWindowType::ADMIN_LIST);
		listBox->setPromptTitle("Top Bounty Hunters");
		listBox->setPromptText("Here are the top 5 BH");
		listBox->setCancelButton(true, "@cancel");

		// Query the DB!
		try
		{
			String bhQuery = "SELECT bh as 'BountyHunter', COUNT(*) as 'Kills', SUM(reward) as 'TotalEarned' from bh_kills WHERE bh = winner GROUP BY bh ORDER BY bh DESC LIMIT 5;";
			Reference<ResultSet*> results = ServerDatabase::instance()->executeQuery(bhQuery);
			String playerLabel = "Bounty Hunter: ";
			String killsLabel = " | Kills: ";
			String earningsLabel = " | Total Earnings: ";

			while(results->next())
			{
				String playerName = results->getString(0);
				int32 kills = results->getInt(1);
				int32 totalEarnings = results->getInt(2);

				String bountyString = playerLabel + playerName + killsLabel + kills + earningsLabel + totalEarnings;
				listBox->addMenuItem(bountyString);
			}

			Locker locker(player);

			player->getPlayerObject()->closeSuiWindowType(SuiWindowType::ADMIN_LIST);

			player->getPlayerObject()->addSuiBox(listBox);
			player->sendMessage(listBox->generateMessage());

		} catch (DatabaseException& e) {
				error(e.getMessage());
		}
		// Stack - top JEDI
		return 0;
	} else if (selectedID == 115) {

		// Stack, ability to view top JEDI from missions terminals
		ManagedReference<SuiListBox*> listBox = new SuiListBox(player, SuiWindowType::ADMIN_LIST);
		listBox->setPromptTitle("Top Jedi Defenders");
		listBox->setPromptText("Here are the top 5 Jedi Defenders");
		listBox->setCancelButton(true, "@cancel");

		// Query the DB!
		try
		{
			String bhQuery = "SELECT opponent as 'Jedi', COUNT(*) as 'BountyKills' from bh_kills WHERE opponent = winner GROUP BY opponent ORDER BY opponent DESC LIMIT 5;";
			Reference<ResultSet*> results = ServerDatabase::instance()->executeQuery(bhQuery);
			String playerLabel = "Jedi: ";
			String killsLabel = " | Successful Defenses: ";

			while(results->next())
			{
				String playerName = results->getString(0);
				int32 kills = results->getInt(1);

				String bountyString = playerLabel + playerName + killsLabel + kills;
				listBox->addMenuItem(bountyString);
			}

			Locker locker(player);

			player->getPlayerObject()->closeSuiWindowType(SuiWindowType::ADMIN_LIST);

			player->getPlayerObject()->addSuiBox(listBox);
			player->sendMessage(listBox->generateMessage());

		} catch (DatabaseException& e) {
				error(e.getMessage());
		}
		return 0;
	} else if (selectedID == 116) {
		// Stack, start of visibility debugging
		// Some notes:
		// getFactionStatus() == FactionStatus::ONLEAVE
		//getFactionStatus() == FactionStatus::COVERT
		ManagedReference<SuiListBox*> listBox = new SuiListBox(player, SuiWindowType::ADMIN_LIST);
		listBox->setPromptTitle("Visibility Eligibility");
		listBox->setPromptText("Here is a list of your eligibility statistics");
		listBox->setCancelButton(true, "@cancel");

		String factionImpOrReb = "Neutral";
		if(player->isRebel())
		{
			factionImpOrReb = "Separatist";
		}
		if(player->isImperial())
		{
			factionImpOrReb = "Republic";
		}

		String isAbleToBeHunted = "No";
		if(player->getFactionRank() >= VisibilityManager::instance()->getMinimumFactionRankRequired() )
		{
			isAbleToBeHunted = "Has enough faction rank ";
			if(player->getPlayerObject()->getVisibility() < VisibilityManager::instance()->getTerminalVisThreshold() )
			{
				isAbleToBeHunted += " but not enough visibility - NO.";
			}
			else
			{
				isAbleToBeHunted += " and enough visibility - YES.";
			}
		}

		String factionLabel = "Faction: " + factionImpOrReb;
		String factionRankLabel = "Faction Rank: " + std::to_string(player->getFactionRank());
		String currentVisibility = "Visibility: "  + std::to_string(player->getPlayerObject()->getVisibility());
		String ableToBeHunted = "Is huntable: " + isAbleToBeHunted;
		String spacer = "";

		// Add the menu items:
		listBox->addMenuItem(factionLabel );
		listBox->addMenuItem(factionRankLabel );
		listBox->addMenuItem(currentVisibility );
		listBox->addMenuItem(spacer );
		listBox->addMenuItem(ableToBeHunted );

		player->getPlayerObject()->addSuiBox(listBox);
		player->sendMessage(listBox->generateMessage());
		return 0;
	}

	return TangibleObjectImplementation::handleObjectMenuSelect(player, selectedID);
}

String MissionTerminalImplementation::getTerminalName() {
	String name = "@terminal_name:terminal_mission";

	if (terminalType == "artisan" || terminalType == "entertainer" || terminalType == "bounty" || terminalType == "imperial" || terminalType == "rebel" || terminalType == "scout")
		name = name + "_" + terminalType;

	return name;
}
