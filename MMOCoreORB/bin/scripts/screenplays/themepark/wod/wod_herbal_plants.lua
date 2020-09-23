wodHerbalPlants = ScreenPlay:new {
	spawnAreas = { --x coord, y coord, spawn radius, plant count
		{x = 866, y = 1095, radius = 35, count = 10}, -- Outcast 1
		{x = -1000, y = 862, radius = 35, count = 10}, -- Outcast 2
		{x = -2597, y = 4952, radius = 35, count = 10}, -- Outcast 3
		{x = 1482, y = 3515, radius = 35, count = 10}, -- Outcast 4
		{x = 1125, y = -1022, radius = 35, count = 10}, -- Outcast 5
		{x = -856, y = 2788, radius = 35, count = 10}, -- Outcast 6
		{x = -7121, y = 2933, radius = 35, count = 10}, -- Outcast 7
		{x = -3177, y = 3184, radius = 35, count = 10}, -- Rubina
		{x = -2080, y = 3143, radius = 75, count = 20}, -- Sarlacc Area
		{x = -3946, y = -50, radius = 75, count = 20}, -- NS Stronghold
		{x = 678, y = 4079, radius = 75, count = 20}, -- Singing Mountain
		{x = -1219, y = 6262, radius = 75, count = 15}, -- Spider cave
	},
	respawnTimeSecs = 60,
	plantTemplates = {
		"object/tangible/furniture/wod_themepark/wod_themepark_herb_01.iff", -- Lesset plant
		"object/tangible/furniture/wod_themepark/wod_themepark_herb_02.iff", -- Ongmuel plant
		"object/tangible/furniture/wod_themepark/wod_themepark_herb_03.iff", -- Greybush plant
		"object/tangible/furniture/wod_themepark/wod_themepark_herb_04.iff", -- Redweed plant
		"object/tangible/furniture/wod_themepark/wod_themepark_herb_05.iff", -- Rinor plant
		"object/tangible/furniture/wod_themepark/wod_themepark_herb_06.iff", -- Remmy plant (filler plant)
		"object/tangible/furniture/wod_themepark/wod_themepark_herb_07.iff", -- Forest mushroom (filler plant)
		"object/tangible/furniture/wod_themepark/wod_trampled_plant.iff", -- Trampled plant (filler plant)
	},
	gatherMessage = {
		"@theme_park_wod/messages:herb_zip_bar_lesset", -- Gathering Lesset Leaves
		"@theme_park_wod/messages:herb_zip_bar_ongmuel", -- Gathering Ongmuel Leaves
		"@theme_park_wod/messages:herb_zip_bar_grey", -- Gathering Greybush Leaves
		"@theme_park_wod/messages:herb_zip_bar_red", -- Gathering Redweed Leaves
		"@theme_park_wod/messages:herb_zip_bar_rinor", -- Gathering Rinor Leaves
		"@theme_park_wod/messages:herb_zip_bar_remmy", -- Gathering Remmy Stalks
		"@theme_park_wod/messages:herb_zip_bar_shroom", -- Gathering Forest Mushroom Cap
		"@theme_park_wod/messages:herb_zip_bar", -- Gathering Herb
	},
	screenPlayDataKey = { --Corresponds with number of herbs to gather
		"lesset",
		"ongmuel",
		"grey",
		"red",
		"rinor",
	}
}

registerScreenPlay("wodHerbalPlants", true)

local QuestManager = require("managers.quest.quest_manager")

function wodHerbalPlants:start()
	if (isZoneEnabled("dathomir")) then
		self:spawnHerbalPlants()
	end
end

function wodHerbalPlants:spawnHerbalPlants()
	local pAncor = getSceneObject(readData("wodThemepark:anchorID"))
	
	for i = 1, #self.spawnAreas do
		for j = 1, self.spawnAreas[i].count do
			local spawnPoint = self:getSpawnPoint(i)
			local n = getRandomNumber(1, #self.plantTemplates)
			local pObject = spawnSceneObject("dathomir", self.plantTemplates[n], spawnPoint.x, spawnPoint.z, spawnPoint.y, 0, math.rad(math.random(360)))
			writeData("wodThemepark:herbPlantLoc:" .. SceneObject(pObject):getObjectID(), i)
			writeData("wodThemepark:herbPlantTemplateNum:" .. SceneObject(pObject):getObjectID(), n)
		end
	end
end

function wodHerbalPlants:respawnHerbalPlants(none, loc)
	local spawnPoint = self:getSpawnPoint(loc)
	local n = getRandomNumber(1, #self.plantTemplates)
	local pObject = spawnSceneObject("dathomir", self.plantTemplates[n], spawnPoint.x, spawnPoint.z, spawnPoint.y, 0, math.rad(math.random(360)))
	writeData("wodThemepark:herbPlantLoc:" .. SceneObject(pObject):getObjectID(), loc)
	writeData("wodThemepark:herbPlantTemplateNum:" .. SceneObject(pObject):getObjectID(), n)
end

function wodHerbalPlants:getSpawnPoint(loc)
	local pAnchor = getSceneObject(readData("wodThemepark:anchorID"))
	local loc = tonumber(loc)
	local a = math.random() * 2 * math.pi
	local r = self.spawnAreas[loc].radius * math.sqrt(math.random())

	local newX = self.spawnAreas[loc].x + r * math.cos(a)
	local newY = self.spawnAreas[loc].y + r * math.sin(a)
	local newZ = getTerrainHeight(pAnchor, newX, newY)
		
	if (newZ <= 0) then
		return self:getSpawnPoint(loc)
	else
		return {x = newX, y = newY, z = newZ - 0.2}
	end
end

function wodHerbalPlants:gatherHerbalPlant(pPlayer, pPlant)
	if (pPlayer == nil or pPlant == nil) then
		return
	end
	
	local plantLoc = readData("wodThemepark:herbPlantLoc:" .. SceneObject(pPlant):getObjectID())
	local plantTemplateNum = readData("wodThemepark:herbPlantTemplateNum:" .. SceneObject(pPlant):getObjectID())
	
	local message = self.gatherMessage[plantTemplateNum]
	CreatureObject(pPlayer):sendSystemMessage(message)
	
	if (plantTemplateNum <= 5) then
		self:collectQuestHerb(pPlayer, plantTemplateNum)
	elseif (plantTemplateNum == 8) then
		CreatureObject(pPlayer):sendSystemMessage("You didn't manage to get anything useful from the trampled plant.")
	else
		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_HERB_GATHERING)) then
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/messages:dont_need_herb_ns")
		elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_HERB_GATHERING)) then
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/messages:dont_need_herb_sm")
		else
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/messages:dont_need_herb")
		end
		createEvent(5 * 1000, "wodHerbalPlants", "addBankCredits", pPlayer, "")
	end
	
	SceneObject(pPlant):destroyObjectFromWorld()
	createEvent(self.respawnTimeSecs * 1000, "wodHerbalPlants", "respawnHerbalPlants", nil, plantLoc)
end

function wodHerbalPlants:collectQuestHerb(pPlayer, num)
	if (pPlayer == nil or num == nil) then
		return
	end

	local spString = "wodThemepark:prologue:herbs"
	local questName = "wod_prologue_herb_gathering"
	local herbsNeeded = 3
	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_HERB_GATHERING)) then
		spString = "wodThemepark:ns:herbs"
		questName = "wod_ns_herb_gathering"
		herbsNeeded = 5
	elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_HERB_GATHERING)) then
		spString = "wodThemepark:sm:herbs"
		questName = "wod_sm_herb_gathering"
		herbsNeeded = 5
	end
	
	local curHerbs = tonumber(readScreenPlayData(pPlayer, spString, self.screenPlayDataKey[tonumber(num)]))
	
	if (curHerbs == nil or curHerbs == "") then
		curHerbs = 0
	end
	
	writeScreenPlayData(pPlayer, spString, self.screenPlayDataKey[tonumber(num)], curHerbs + 1)
	
	if (curHerbs + 1 == herbsNeeded) then
		CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/" .. questName .. ":task06_task_display_string_" .. num)
		QuestManager.completeQuest(pPlayer, getPlayerQuestID(questName .. "_0" .. num))
		self:checkQuestStatus(pPlayer, spString, questName)
	elseif (curHerbs + 1 > herbsNeeded) then
		CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/messages:extra_credit_herbs")
		local bankCredits = CreatureObject(pPlayer):getBankCredits()
		createEvent(5 * 1000, "wodHerbalPlants", "addBankCredits", pPlayer, "")
	end
end

function wodHerbalPlants:checkQuestStatus(pPlayer, spString, questName)
	if (pPlayer == nil or spString == nil or questName == nil) then
		return
	end
	
	for i = 1, 5 do
		if (not QuestManager.hasCompletedQuest(pPlayer, getPlayerQuestID(questName .. "_0" .. i))) then
			return
		end
	end
	
	deleteScreenPlayData(pPlayer, spString, self.screenPlayDataKey[1])
	deleteScreenPlayData(pPlayer, spString, self.screenPlayDataKey[2])
	deleteScreenPlayData(pPlayer, spString, self.screenPlayDataKey[3])
	deleteScreenPlayData(pPlayer, spString, self.screenPlayDataKey[4])
	deleteScreenPlayData(pPlayer, spString, self.screenPlayDataKey[5])
	
	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_HERB_GATHERING)) then
		QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_NS_HERB_GATHERING_06)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_NS_HERB_GATHERING_07)
		wodNSHerbReturnGoto:start(pPlayer)
	elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_HERB_GATHERING)) then
		QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_SM_HERB_GATHERING_06)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_HERB_GATHERING_07)
		wodSMHerbReturnGoto:start(pPlayer)
	else
		QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING_06)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING_07)
		wodRubinaReturnGoto:start(pPlayer)
	end
end

function wodHerbalPlants:addBankCredits(pPlayer)
	if (pPlayer == nil) then
		return
	end
	
	local rewardedCredits = wodPrologueRewardManager.herbs.extraCredits
	
	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_HERB_GATHERING)) then
		CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/messages:received_credits_ns")
		rewardedCredits = wodRewardManager.herbs.extraCredits
	elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_HERB_GATHERING)) then
		CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/messages:received_credits_sm")
		rewardedCredits = wodRewardManager.herbs.extraCredits
	else
		CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/messages:received_credits")
	end
	
	local bankCredits = CreatureObject(pPlayer):getBankCredits()
	CreatureObject(pPlayer):setBankCredits(bankCredits + rewardedCredits)
end
