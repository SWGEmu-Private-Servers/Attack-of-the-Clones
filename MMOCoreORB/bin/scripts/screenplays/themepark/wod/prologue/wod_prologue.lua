wodPrologueScreenplay = ScreenPlay:new {

}

registerScreenPlay("wodPrologueScreenplay", false)

local QuestManager = require("managers.quest.quest_manager")

--TODO: Reward handling check if inventory is full

function wodPrologueScreenplay:onPlayerLoggedIn(pPlayer)
	if (pPlayer == nil) then
		return
	end

	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_RANCOR_01) or QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_SPIDER_CLAN_01)) then
		dropObserver(KILLEDCREATURE, "wodPrologueScreenplay", "notifyKilledHuntTarget", pPlayer)
		createObserver(KILLEDCREATURE, "wodPrologueScreenplay", "notifyKilledHuntTarget", pPlayer)
	end
end

--Reward handling
function wodPrologueScreenplay:addToCollection(pPlayer, fullKey)
	if (pPlayer == nil or fullKey == nil) then
		return
	end
	
	local curCount = tonumber(readScreenPlayData(pPlayer, "wodThemepark:prologue:collection", fullKey))
	
	if (curCount == nil or curCount == "") then
		curCount = 0
	end
	
	writeScreenPlayData(pPlayer, "wodThemepark:prologue:collection", fullKey, curCount + 1)
	
	local key = "enemies" .. fullKey
	local clan = ""
	
	if (string.match(string.lower(key), "sm")) then
		clan = "SM"
	elseif (string.match(string.lower(key), "ns")) then
		clan = "NS"
	end
	
	if (string.match(string.lower(key), "herbs")) then
		key = "herbs"
	elseif (string.match(string.lower(key), "wisdom")) then
		key = "wisdom"
	end

	if (curCount + 1 == wodPrologueRewardManager[key].collectionCount or not wodPrologueRewardManager[key].collectionRewardOnce) then
		if ((curCount + 1) % wodPrologueRewardManager[key].collectionCount == 0) then
			self:handleCollectionReward(pPlayer, fullKey)
		end
	end	
end

function wodPrologueScreenplay:handleCollectionReward(pPlayer, fullKey)
	if (pPlayer == nil or fullKey == nil) then
		return
	end

	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return
	end

	local key = "enemies" .. fullKey
	local clan = ""

	if (string.match(string.lower(key), "sm")) then
		clan = "SM"
	elseif (string.match(string.lower(key), "ns")) then
		clan = "NS"
	end

	if (string.match(string.lower(key), "herbs")) then
		key = "herbs"
	elseif (string.match(string.lower(key), "wisdom")) then
		key = "wisdom"
	end

	local rewardKey = wodPrologueRewardManager[key]
	local rewardString = "collectionReward" .. clan

	if (rewardKey.collectionRewardType == "all") then
		for i = 1, #rewardKey[rewardString] do
			giveItem(pInventory, rewardKey[rewardString][i], -1)
			CreatureObject(pPlayer):sendSystemMessage("You have received a reward.")
		end
	elseif (rewardKey.collectionRewardType == "pick") then
		local sui = SuiListBox.new("wodPrologueScreenplay", "pickRewardCallback")

		sui.setTargetNetworkId(SceneObject(pPlayer):getObjectID())
		sui.setTitle("Pick a Reward")

		local message = "Please select your reward."
		sui.setPrompt(message)
				
		for i = 1, #rewardKey[rewardString] do
			sui.add(rewardKey[rewardString][i][2], rewardKey[rewardString][i][1])
		end

		sui.sendTo(pPlayer)
	else --Random option
		if (rewardKey.collectionRewardType ~= "random") then
			CreatureObject(pPlayer):sendSystemMessage("A collection reward could not be found for prologue quest, key: '" .. key .. "', please contact an admin.")
			return
		end

		local n = getRandomNumber(1, #rewardKey[rewardString])
		giveItem(pInventory, rewardKey[rewardString][n], -1)
		CreatureObject(pPlayer):sendSystemMessage("You have received a reward.")
	end
	CreatureObject(pPlayer):sendSystemMessage("You have completed a collection.")
end

function wodPrologueScreenplay:handleReward(pPlayer, key)
	if (pPlayer == nil or key == nil) then
		return
	end

	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return
	end
	
	local curCount = tonumber(readScreenPlayData(pPlayer, "wodThemepark:prologue:reward", key))
	
	if (curCount == nil or curCount == "") then
		curCount = 0
	end

	writeScreenPlayData(pPlayer, "wodThemepark:prologue:reward", key, curCount + 1)

	local rewardKey = wodPrologueRewardManager[key]

	if (rewardKey.rewardOnce and curCount + 1 ~= 1) then
		return
	end

	local rewardInterval = 0
	if (rewardKey.rewardInterval ~= nil) then
		rewardInterval = (curCount + 1) % rewardKey.rewardInterval
	end

	if (curCount + 1 ~= 1 or rewardInterval == 0) then
		if (rewardKey.credits ~= nil and rewardKey.credits > 0) then
			CreatureObject(pPlayer):addCashCredits(rewardKey.credits)
		end		
		if (rewardKey.rewardType == "all") then
			for i = 1, #rewardKey.reward do
				giveItem(pInventory, rewardKey.reward[i], -1)
				CreatureObject(pPlayer):sendSystemMessage("You have received a reward.")
			end
		elseif (rewardKey.rewardType == "pick") then
			local sui = SuiListBox.new("wodPrologueScreenplay", "pickRewardCallback")

			sui.setTargetNetworkId(SceneObject(pPlayer):getObjectID())
			sui.setTitle("Pick a Reward")

			local message = "Please select your reward."
			sui.setPrompt(message)
	
			for i = 1, #rewardKey.reward do
				sui.add(rewardKey.reward[i][2], rewardKey.reward[i][1])
			end

			sui.sendTo(pPlayer)
		else --Random option
			if (rewardKey.rewardType ~= "random") then
				CreatureObject(pPlayer):sendSystemMessage("A reward could not be found for prologue quest, key: '" .. key .. "', please contact an admin.")
				return
			end
			local n = getRandomNumber(1, #rewardKey.reward)
			giveItem(pInventory, rewardKey.reward[n], -1)
			CreatureObject(pPlayer):sendSystemMessage("You have received a reward.")
		end
	end
end

function wodPrologueScreenplay:pickRewardCallback(pPlayer, pSui, eventIndex, args)
	local cancelPressed = (eventIndex == 1)
	local pPageData = LuaSuiBoxPage(pSui):getSuiPageData()

	if (pPageData == nil) then
		return
	end

	local suiPageData = LuaSuiPageData(pPageData)
	local reward = suiPageData:getStoredData(tostring(args))

	if (cancelPressed or args == nil or tonumber(args) < 0) then
		reward = suiPageData:getStoredData("1")
	end

	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return
	end

	giveItem(pInventory, reward, -1)
	CreatureObject(pPlayer):sendSystemMessage("You have received a reward.")
end

--Eliminate quest
function wodPrologueScreenplay:startEliminateQuest(pPlayer)
	if (not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_RANCOR_01) and not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_SPIDER_CLAN_01)) then
		return
	end
	
	dropObserver(KILLEDCREATURE, "wodPrologueScreenplay", "notifyKilledHuntTarget", pPlayer)
	deleteScreenPlayData(pPlayer, "wodThemepark:prologue", "huntTarget")
	deleteScreenPlayData(pPlayer, "wodThemepark:prologue", "huntTargetCount")
	deleteScreenPlayData(pPlayer, "wodThemepark:prologue", "huntTargetGoal")
	
	writeScreenPlayData(pPlayer, "wodThemepark:prologue", "huntTargetCount", 0)
	writeScreenPlayData(pPlayer, "wodThemepark:prologue", "huntTargetGoal", 5) -- TODO: Magic number
	
	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_RANCOR_01)) then
		writeScreenPlayData(pPlayer, "wodThemepark:prologue", "huntTarget", "mutant_rancor") --TODO: Magic string
	elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_SPIDER_CLAN)) then
		writeScreenPlayData(pPlayer, "wodThemepark:prologue", "huntTarget", "spider_nightsister_initiate;spider_nightsister_spell_weaver;spider_nightsister_crawler;spider_nightsister_elder;spider_nightsister_protector;spider_nightsister_sentinel;spider_nightsister_sentry;spider_nightsister_stalker;spider_nightsister_web_dancer") --TODO: Magic string
	end
	
	createObserver(KILLEDCREATURE, "wodPrologueScreenplay", "notifyKilledHuntTarget", pPlayer)
end

function wodPrologueScreenplay:notifyKilledHuntTarget(pPlayer, pVictim)
	if (pVictim == nil or pPlayer == nil) then
		return 0
	end

	if (not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_RANCOR_01) and not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_SPIDER_CLAN_01)) then
		return 0
	end

	local huntTarget = readScreenPlayData(pPlayer, "wodThemepark:prologue", "huntTarget")
	local targetCount = tonumber(readScreenPlayData(pPlayer, "wodThemepark:prologue", "huntTargetCount"))
	local targetGoal = tonumber(readScreenPlayData(pPlayer, "wodThemepark:prologue", "huntTargetGoal"))

	if (targetCount == nil) then
		printLuaError("wodPrologueScreenplay:notifyKilledHuntTarget, nil targetCount for player: " .. SceneObject(pPlayer):getCustomObjectName() .. " (player killed target: " .. SceneObject(pVictim):getObjectName() .. "). Setting to 0.")
		writeScreenPlayData(pPlayer, "wodThemepark:prologue", "huntTargetCount", 0)
		targetCount = 0
	end

	if (targetGoal == nil) then
		printLuaError("wodPrologueScreenplay:notifyKilledHuntTarget, nil targetGoal for player: " .. SceneObject(pPlayer):getCustomObjectName() .. " (player killed target: " .. SceneObject(pVictim):getObjectName() .. "). Setting to 5.") -- TODO: Magic numbe
		writeScreenPlayData(pPlayer, "wodThemepark:prologue", "huntTargetGoal", 5) -- TODO: Magic number
		targetGoal = 5 -- TODO: Magic number
	end

	if (huntTarget == nil or huntTarget == "") then
		local newTarget = ""
		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_RANCOR_01)) then
			writeScreenPlayData(pPlayer, "wodThemepark:prologue", "huntTarget", "mutant_rancor") --TODO: Magic string
			newTarget = "mutant_rancor" --TODO: Magic string
		elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_SPIDER_CLAN)) then
			writeScreenPlayData(pPlayer, "wodThemepark:prologue", "huntTarget", "spiderclan_acolyte;spiderclan_auspex;spiderclan_crawler;spiderclan_elder;spiderclan_protector;spiderclan_sentinel;spiderclan_sentry;spiderclan_stalker;spiderclan_web_dancer") --TODO: Magic string
			newTarget = "spiderclan_acolyte;spiderclan_auspex;spiderclan_crawler;spiderclan_elder;spiderclan_protector;spiderclan_sentinel;spiderclan_sentry;spiderclan_stalker;spiderclan_web_dancer" --TODO: Magic string
		end
		printLuaError("wodPrologueScreenplay:notifyKilledHuntTarget, nil huntTarget for player: " .. SceneObject(pPlayer):getCustomObjectName() .. " (player killed target: " .. SceneObject(pVictim):getObjectName() .. "). Setting to " .. newTarget .. ".")
		huntTarget = newTarget
	end

	if (SceneObject(pVictim):getZoneName() ~= SceneObject(pPlayer):getZoneName() or not CreatureObject(pPlayer):isInRangeWithObject(pVictim, 80)) then
		return 0
	end

	local targetList = HelperFuncs:splitString(huntTarget, ";")

	if (huntTarget == SceneObject(pVictim):getObjectName() or HelperFuncs:tableContainsValue(targetList, SceneObject(pVictim):getObjectName())) then
		local n = getRandomNumber(1, 4) --TODO: Magic number
		if (n == 1) then
			return 0
		end
		
		targetCount = targetCount + 1
		writeScreenPlayData(pPlayer, "wodThemepark:prologue", "huntTargetCount", targetCount)
		
		local remaining = targetGoal - targetCount
		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_RANCOR)) then
			if (remaining == 0) then
				CreatureObject(pPlayer):sendSystemMessage("You have collected a mutant rancor tooth, return to Rubina.")
			else
				CreatureObject(pPlayer):sendSystemMessage("You have collected a mutant rancor tooth, " .. remaining .. " remaining.")
			end
		elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_SPIDER_CLAN)) then
			if (remaining == 0) then
				CreatureObject(pPlayer):sendSystemMessage("You have collected a Spider Clan emblem, return to Rubina.")
			else
				CreatureObject(pPlayer):sendSystemMessage("You have collected a Spider Clan emblem, " .. remaining .. " remaining.")
			end
		end

		if (targetCount >= targetGoal) then
			if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_RANCOR)) then
				QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_RANCOR_01)
				QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_RANCOR_02)
			elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_SPIDER_CLAN)) then
				QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_SPIDER_CLAN_01)
				QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_SPIDER_CLAN_02)
			end
			wodEliminateReturnGoto:start(pPlayer)
			return 1
		end
	end

	return 0
end

--Rubina favor
function wodPrologueScreenplay:addToFavor(pPlayer, key)
	if (pPlayer == nil) then
		return
	end
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	curNSFavor = tonumber(readScreenPlayData(pPlayer, "wodThemepark:prologue:favor", "nsFavor"))
		
	if (curNSFavor == nil or curNSFavor == "") then
		curNSFavor = 0
	end
	
	curSMFavor = tonumber(readScreenPlayData(pPlayer, "wodThemepark:prologue:favor", "smFavor"))
		
	if (curSMFavor == nil or curSMFavor == "") then
		curSMFavor = 0
	end
	
	if (key == "ns") then
		if (curNSFavor < 8) then
			writeScreenPlayData(pPlayer, "wodThemepark:prologue:favor", "nsFavor", curNSFavor + 1)
		end
		
		if (curSMFavor > 0) then
			writeScreenPlayData(pPlayer, "wodThemepark:prologue:favor", "smFavor", curSMFavor - 1)
		end
		
		PlayerObject(pGhost):increaseFactionStanding("nightsister", 500) -- TODO: Magic number, add enable/disable faction gain/loss
		PlayerObject(pGhost):decreaseFactionStanding("mtn_clan", 500)
	elseif (key == "sm") then
		if (curSMFavor < 8) then
			writeScreenPlayData(pPlayer, "wodThemepark:prologue:favor", "smFavor", curSMFavor + 1)
		end
		
		if (curNSFavor > 0) then
			writeScreenPlayData(pPlayer, "wodThemepark:prologue:favor", "nsFavor", curNSFavor - 1)
		end
		
		PlayerObject(pGhost):increaseFactionStanding("mtn_clan", 500)
		PlayerObject(pGhost):decreaseFactionStanding("nightsister", 500)
	end
	
	local curCount = tonumber(readScreenPlayData(pPlayer, "wodThemepark:prologue:collection", key))
	
	if (curCount == nil or curCount == "") then
		curCount = 0
	end
	
	writeScreenPlayData(pPlayer, "wodThemepark:prologue:collection", key, curCount + 1)
	
	if (curCount + 1 % 5 == 0) then --TODO: Magic number
		self:handleCollectionReward(pPlayer, key)
	end
end

function wodPrologueScreenplay:getFavorStatus(pPlayer)
	if (pPlayer == nil) then
		return
	end
	
	curNSFavor = tonumber(readScreenPlayData(pPlayer, "wodThemepark:prologue:favor", "nsFavor"))
		
	if (curNSFavor == nil or curNSFavor == "") then
		curNSFavor = 0
	end
	
	curSMFavor = tonumber(readScreenPlayData(pPlayer, "wodThemepark:prologue:favor", "smFavor"))
		
	if (curSMFavor == nil or curSMFavor == "") then
		curSMFavor = 0
	end
	
	if (curNSFavor == curSMFavor) then
		return {count = 0, clan = ""}
	end
	
	if (curNSFavor > curSMFavor) then
		return {count = curNSFavor - curSMFavor, clan = "ns"}
	end
	
	if (curSMFavor > curNSFavor) then
		return {count = curSMFavor - curNSFavor, clan = "sm"}
	end
end

function wodPrologueScreenplay:startMysteriousWitchQuest(pPlayer)
	if (pPlayer == nil) then
		return
	end

	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	
	if (pGhost == nil) then
		return pConvScreen
	end

	QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_MEET_MYSTERIOUS_WITCH)
	PlayerObject(pGhost):addWaypoint("dathomir", "@theme_park_wod/wod_prologue_walkabout:task09_waypoint_name", "", -3177, 3184, WAYPOINTGREEN, true, true, 0)
	self:sendCommMessage(pPlayer)
end

function wodPrologueScreenplay:sendCommMessage(pPlayer)
	local sui = SuiMessageBox.new("wodPrologueScreenplay", "noCallBack")
	sui.setTitle("@theme_park_wod/wod_prologue_walkabout:comm_message_title_02")
	sui.setPrompt("@theme_park_wod/wod_prologue_walkabout:task07_comm_message_text_02")
	sui.hideCancelButton()
	sui.sendTo(pPlayer)
end

function wodPrologueScreenplay:noCallBack(pPlayer, pSui, eventIndex, ...)
end
