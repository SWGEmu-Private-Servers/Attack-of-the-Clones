/*
 * FactionManager.cpp
 *
 *  Created on: Mar 17, 2011
 *      Author: crush
 */

#include "FactionManager.h"
#include "FactionMap.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "templates/manager/TemplateManager.h"
#include "server/zone/managers/player/PlayerManager.h"
#include "server/chat/ChatManager.h"
#include "server/zone/managers/visibility/VisibilityManager.h"
#include "server/zone/objects/group/GroupObject.h"
#include "server/zone/managers/director/DirectorManager.h"


FactionManager::FactionManager() {
	setLoggingName("FactionManager");
	setGlobalLogging(false);
	setLogging(false);
}

void FactionManager::checkForDynamicEvent(PlayerObject* player)
{
	if(player == nullptr)
	{
		return;
	}

	if(currentCisFactionCounter > factionNeededToSpawnFactionEvent)
	{
		currentCisFactionCounter = 0;
		// spawn REPUBLIC event!
		String hurtFactionName = "Republic";
		launchScreenPlayFactionEvent(republicSpawnableScreenplays, hurtFactionName, player);
	}

	if(currentRepublicFactionCounter > factionNeededToSpawnFactionEvent)
	{
		currentRepublicFactionCounter = 0;
		// spawn CIS event!
		String hurtFactionName = "CIS";
		launchScreenPlayFactionEvent(cisSpawnableScreenplays, hurtFactionName, player);
	}
}

void FactionManager::launchScreenPlayFactionEvent(Vector<FactionDynamicScreenplayData>& screenplays, String factionName, PlayerObject* player) {
	if(screenplays.size() > 0)
	{
		String screenplayName = "";
		String serverMessage = "";
		int index = System::random(screenplays.size());
		if(index == screenplays.size())
		{
			index -= 1;
		}
		FactionDynamicScreenplayData data = screenplays.get(index);
		//if(data != NULL)
		{
			screenplayName = data.screenplayName;
			serverMessage = data.serverMessage;

			String zBroadcast = "\\#00e604 The " + factionName + " losses are too heavy -- " + serverMessage;
			player->getZoneServer()->getChatManager()->broadcastGalaxy(NULL, zBroadcast);

			if(DirectorManager::instance() == nullptr)
			{
				return;
			}
			DirectorManager::instance()->startScreenPlay(nullptr, screenplayName);

		}
	}
}

void FactionManager::loadData() {
	loadLuaConfig();
	loadFactionRanks();
}

void FactionManager::loadFactionRanks() {
	IffStream* iffStream = TemplateManager::instance()->openIffFile("datatables/faction/rank.iff");

	if (iffStream == nullptr) {
		warning("Faction ranks could not be found.");
		return;
	}

	DataTableIff dtiff;
	dtiff.readObject(iffStream);

	factionRanks.readObject(&dtiff);

	delete iffStream;

	info("loaded " + String::valueOf(factionRanks.getCount()) + " ranks", true);
}

void FactionManager::loadLuaConfig() {
	info("Loading config file.", true);

	FactionMap* fMap = getFactionMap();

	Lua* lua = new Lua();
	lua->init();

	//Load the faction manager lua file.
	lua->runFile("scripts/managers/faction_manager.lua");

	isFactionDynamicEventsEnabled = lua->getGlobalInt("factionNeededToSpawnFactionEvent");
	factionNeededToSpawnFactionEvent = lua->getGlobalInt("factionNeededToSpawnFactionEvent");

	//republicSpawnableScreenplays();// = &(new Vector<FactionDynamicScreenplayData>());
	LuaObject republicObject = lua->getGlobalObject("republicSpawnableScreenplays");
	if (republicObject.isValidTable()) {
		for (int i = 1; i <= republicObject.getTableSize(); ++i) {
			LuaObject spData = republicObject.getObjectAt(i);
			if (spData.isValidTable()) {
	 		 	String spName = spData.getStringAt(1);
		 		String svMessage = spData.getStringAt(2);
	  		FactionDynamicScreenplayData screenPlayDataObj(spName, svMessage);
	 		 	republicSpawnableScreenplays.add(screenPlayDataObj);
			}

			spData.pop();
		}

	}

	republicObject.pop();


	LuaObject cisObject = lua->getGlobalObject("cisSpawnableScreenplays");
	if (cisObject.isValidTable()) {
		for (int i = 1; i <= cisObject.getTableSize(); ++i) {
			LuaObject spData = cisObject.getObjectAt(i);
			if (spData.isValidTable()) {
	 		 	String spName = spData.getStringAt(1);
		 		String svMessage = spData.getStringAt(2);
	  		FactionDynamicScreenplayData screenPlayDataObj(spName, svMessage);
	 		 	cisSpawnableScreenplays.add(screenPlayDataObj);
			}

			spData.pop();
		}

	}

	republicObject.pop();

	LuaObject luaObject = lua->getGlobalObject("factionList");
	if (luaObject.isValidTable()) {
		for (int i = 1; i <= luaObject.getTableSize(); ++i) {
			LuaObject factionData = luaObject.getObjectAt(i);

			if (factionData.isValidTable()) {
				String factionName = factionData.getStringAt(1);
				bool playerAllowed = factionData.getBooleanAt(2);
				String enemies = factionData.getStringAt(3);
				String allies = factionData.getStringAt(4);
				float adjustFactor = factionData.getFloatAt(5);

				Faction faction(factionName);
				faction.setAdjustFactor(adjustFactor);
				faction.setPlayerAllowed(playerAllowed);
				faction.parseEnemiesFromList(enemies);
				faction.parseAlliesFromList(allies);

				fMap->addFaction(faction);
			}

			factionData.pop();
		}
	}

	luaObject.pop();

	delete lua;
	lua = nullptr;
}

FactionMap* FactionManager::getFactionMap() {
	return &factionMap;
}

void FactionManager::awardFactionStanding(CreatureObject* player, const String& factionName, int level) {
	if (player == nullptr)
		return;

		// Get visibility threshold from the VisbilityManager - should only happen the first time
	if(factionRankVisibilityThreshold == 0)
	{
		factionRankVisibilityThreshold = VisibilityManager::instance()->getMinimumFactionRankRequired();
	}

	ManagedReference<PlayerObject*> ghost = player->getPlayerObject();

	if (!factionMap.contains(factionName))
		return;

	const Faction& faction = factionMap.get(factionName);
	const SortedVector<String>* enemies = faction.getEnemies();
	const SortedVector<String>* allies = faction.getAllies();

	if (!faction.isPlayerAllowed())
		return;

	float gain = level * faction.getAdjustFactor();

	// Stack - adjust faction gain by a percent if you're above the visibility threshold
	int factionRank = player->getFactionRank();

	if(factionRank >= factionRankVisibilityThreshold)
	{
		// Stack - 20% increase over the rank
		gain *= 1.2;
	}


	float lose = gain * 2;

	ghost->decreaseFactionStanding(factionName, lose);

	//Lose faction standing to allies of the creature.
	for (int i = 0; i < allies->size(); ++i) {
		const String& ally = allies->get(i);

		if ((ally == "rebel" || ally == "imperial")) {
			continue;
		}

		if (!factionMap.contains(ally))
			continue;

		const Faction& allyFaction = factionMap.get(ally);

		if (!allyFaction.isPlayerAllowed())
			continue;

		ghost->decreaseFactionStanding(ally, lose);
	}

	bool gcw = false;
	if (factionName == "rebel" || factionName == "imperial") {
		gcw = true;
	}

	//Gain faction standing to enemies of the creature.
	for (int i = 0; i < enemies->size(); ++i) {
		const String& enemy = enemies->get(i);

		if ((enemy == "rebel" || enemy == "imperial") && !gcw) {
			continue;
		}

		if (!factionMap.contains(enemy))
			continue;

		const Faction& enemyFaction = factionMap.get(enemy);

		if (!enemyFaction.isPlayerAllowed())
			continue;

		ghost->increaseFactionStanding(enemy, gain);

		if (gcw == true){

			if(isFactionDynamicEventsEnabled != 0)
			{
				// Stack - accrue the points in each faction for dnyamic events
				if(factionName == "imperial")
				{
					currentCisFactionCounter += gain;
				}
				if(factionName == "rebel")
				{
					currentRepublicFactionCounter += gain;
				}

				checkForDynamicEvent(ghost);
			}


			StringBuffer factionRewardQuery; //store mission data for website
			StringBuffer factionKillQuery;
			String playerName = player->getFirstName();
			factionRewardQuery << "Update faction_tracker set reward = reward +'" <<gain << "' where player  = '" <<playerName.escapeString()<<"';";
			factionKillQuery << "Update faction_tracker set kills = kills + 1 where player  = '" <<playerName.escapeString()<<"';";
			ServerDatabase::instance()->executeStatement(factionRewardQuery);
			ServerDatabase::instance()->executeStatement(factionKillQuery);
		}
	}
}


void FactionManager::awardPvpFactionPoints(TangibleObject* killer, CreatureObject* destructedObject) {
	if (killer->isPlayerCreature() && destructedObject->isPlayerCreature()) {
		CreatureObject* killerCreature = cast<CreatureObject*>(killer);
		ManagedReference<PlayerObject*> ghost = killerCreature->getPlayerObject();
		ManagedReference<GroupObject*> group;

		ManagedReference<PlayerObject*> killedGhost = destructedObject->getPlayerObject();

		ManagedReference<PlayerManager*> playerManager = killerCreature->getZoneServer()->getPlayerManager();

				//Broadcast to Server
				String playerName = destructedObject->getFirstName();
				String killerName = killerCreature->getFirstName();
				StringBuffer zBroadcast;

		if (killer->isRebel() && destructedObject->isImperial()) {
			ghost->increaseFactionStanding("rebel", 30);
			ghost->decreaseFactionStanding("imperial", 45);
			playerManager->awardExperience(killerCreature, "gcw_currency_rebel", 250);


			group = killerCreature->getGroup();
			Vector<ManagedReference<CreatureObject*> > players;
			int playerCount = 1;

			if (group != nullptr){
				//Locker lockerGroup(group, _this.getReferenceUnsafeStaticCast());
				playerCount = group->getNumberOfPlayerMembers();
				for (int x=0; x< group->getGroupSize(); x++){
					Reference<CreatureObject*> groupMember = group->getGroupMember(x);
					if (groupMember == killerCreature)
						continue;
					if (groupMember->isRebel() && groupMember->isInRange(killerCreature, 128.0f))
						players.add(groupMember);
				}
			} else {
				players.add(killerCreature);
			}

			if (players.size() == 0) {
				players.add(killerCreature);
			}

			if (playerCount > players.size()) {
				killerCreature->sendSystemMessage("Some players were too far away from the kill!"); // Mission Alert! Some group members are too far away from the group to receive their reward and and are not eligible for reward.
			}

			int dividedKill = 1000 / players.size();
			for (int i = 0; i < players.size(); i++){
				ManagedReference<CreatureObject*> player = players.get(i);
				ManagedReference<PlayerManager*> groupPlayerManager = player->getZoneServer()->getPlayerManager();
				groupPlayerManager->awardExperience(player, "gcw_currency_rebel", dividedKill);
				StringBuffer sysMessage;
				sysMessage << "You have received CW XP for your kill participation!";
				player->sendSystemMessage(sysMessage.toString());
			}

			killedGhost->decreaseFactionStanding("imperial", 45);
		} else if (killer->isImperial() && destructedObject->isRebel()) {
			ghost->increaseFactionStanding("imperial", 30);
			ghost->decreaseFactionStanding("rebel", 45);
			playerManager->awardExperience(killerCreature, "gcw_currency_imperial", 250);
			//zBroadcast << "\\#00e604" << playerName << " \\#e60000 was slain in the GCW by " << "\\#00cc99" << killerName;
			//ghost->getZoneServer()->getChatManager()->broadcastGalaxy(NULL, zBroadcast.toString());

			group = killerCreature->getGroup();
			Vector<ManagedReference<CreatureObject*> > players;
			int playerCount = 1;

			if (group != nullptr){
				//Locker lockerGroup(group, _this.getReferenceUnsafeStaticCast());
				playerCount = group->getNumberOfPlayerMembers();
				for (int x=0; x< group->getGroupSize(); x++){
					Reference<CreatureObject*> groupMember = group->getGroupMember(x);
					if (groupMember == killerCreature)
						continue;
					if (groupMember->isImperial() && groupMember->isInRange(killerCreature, 128.0f))
						players.add(groupMember);
				}
			} else {
				players.add(killerCreature);
			}

			if (players.size() == 0) {
				players.add(killerCreature);
			}

			if (playerCount > players.size()) {
				killerCreature->sendSystemMessage("Some players were too far away from the kill!"); // Mission Alert! Some group members are too far away from the group to receive their reward and and are not eligible for reward.
			}

			int dividedKill = 1000 / players.size();
			for (int i = 0; i < players.size(); i++){
				ManagedReference<CreatureObject*> player = players.get(i);
				ManagedReference<PlayerManager*> groupPlayerManager = player->getZoneServer()->getPlayerManager();
				groupPlayerManager->awardExperience(player, "gcw_currency_imperial", dividedKill);
				StringBuffer sysMessage;
				sysMessage << "You have received CW XP for your kill participation!";
				player->sendSystemMessage(sysMessage.toString());

			}

			killedGhost->decreaseFactionStanding("rebel", 45);
		}
	}
}

String FactionManager::getRankName(int idx) {
	if (idx >= factionRanks.getCount())
		return "";

	return factionRanks.getRank(idx).getName();
}

int FactionManager::getRankCost(int rank) {
	if (rank >= factionRanks.getCount())
		return -1;

	return factionRanks.getRank(rank).getCost();
}

int FactionManager::getRankDelegateRatioFrom(int rank) {
	if (rank >= factionRanks.getCount())
		return -1;

	return factionRanks.getRank(rank).getDelegateRatioFrom();
}

int FactionManager::getRankDelegateRatioTo(int rank) {
	if (rank >= factionRanks.getCount())
		return -1;

	return factionRanks.getRank(rank).getDelegateRatioTo();
}

int FactionManager::getFactionPointsCap(int rank) {
	if (rank >= factionRanks.getCount())
		return -1;

	return Math::max(1000, getRankCost(rank) * 20);
}

bool FactionManager::isFaction(const String& faction) {
	if (factionMap.contains(faction))
		return true;

	return false;
}

bool FactionManager::isEnemy(const String& faction1, const String& faction2) {

	if (!factionMap.contains(faction1) || !factionMap.contains(faction2))
		return false;

	Faction* faction = factionMap.getFaction(faction1);

	return faction->getEnemies()->contains(faction2);
}

bool FactionManager::isAlly(const String& faction1, const String& faction2) {

	if (!factionMap.contains(faction1) || !factionMap.contains(faction2))
		return false;

	Faction* faction = factionMap.getFaction(faction1);

	return faction->getAllies()->contains(faction2);
}
