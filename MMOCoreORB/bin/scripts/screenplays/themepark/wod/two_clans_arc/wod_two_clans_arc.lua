wodTwoClansArc = ScreenPlay:new {
	sister2Adds = {
		firstLocation = {
		
		},
		secondLocation = {
		
		},
		thirdLocation = {
		
		},
		fourthLocation = {
		
		},
	},
}

registerScreenPlay("wodTwoClansArc", true)

--TODO: Mobiles

local QuestManager = require("managers.quest.quest_manager")

function wodTwoClansArc:start()
	if (isZoneEnabled("dathomir")) then
		self:spawnFirstSister()
		self:spawnSecondSister()
		self:spawnThirdSister()
	end
end

function wodTwoClansArc:noCallback(pPlayer, pSui, eventIndex, ...)
end

function wodTwoClansArc:startEliminateQuest(pPlayer)
	if (not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_SISTER1_02) or not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_SISTER1_02)) then
		return
	end
	
	dropObserver(KILLEDCREATURE, "wodTwoClansArc", "notifyKilledHuntTarget", pPlayer)
	deleteScreenPlayData(pPlayer, "wodThemepark:hunting", "huntTarget")
	deleteScreenPlayData(pPlayer, "wodThemepark:hunting", "huntTargetCount")
	deleteScreenPlayData(pPlayer, "wodThemepark:hunting", "huntTargetGoal")
	
	writeScreenPlayData(pPlayer, "wodThemepark:hunting", "huntTargetCount", 0)
	writeScreenPlayData(pPlayer, "wodThemepark:hunting", "huntTargetGoal", 5) -- TODO: Magic number
	writeScreenPlayData(pPlayer, "wodThemepark:hunting", "huntTarget", "malkloc_plainswalker_female;malkloc;malkloc_bull;malkloc_plainswalker;young_malkloc;malkloc_plainswalker_youth") --TODO: Magic string
	
	createObserver(KILLEDCREATURE, "wodTwoClansArc", "notifyKilledHuntTarget", pPlayer)
end

function wodTwoClansArc:notifyKilledHuntTarget(pPlayer, pVictim)
	if (pVictim == nil or pPlayer == nil) then
		return 0
	end
	
	if (not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_SISTER1_02) and not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_SISTER1_02)) then
		return 0
	end

	local huntTarget = readScreenPlayData(pPlayer, "wodThemepark:hunting", "huntTarget")
	local targetCount = tonumber(readScreenPlayData(pPlayer, "wodThemepark:hunting", "huntTargetCount"))
	local targetGoal = tonumber(readScreenPlayData(pPlayer, "wodThemepark:hunting", "huntTargetGoal"))

	if (targetCount == nil) then
		printLuaError("wodTwoClansArc:notifyKilledHuntTarget, nil targetCount for player: " .. SceneObject(pPlayer):getCustomObjectName() .. " (player killed target: " .. SceneObject(pVictim):getObjectName() .. "). Setting to 0.")
		writeScreenPlayData(pPlayer, "wodThemepark:hunting", "huntTargetCount", 0)
		targetCount = 0
	end

	if (targetGoal == nil) then
		printLuaError("wodTwoClansArc:notifyKilledHuntTarget, nil targetGoal for player: " .. SceneObject(pPlayer):getCustomObjectName() .. " (player killed target: " .. SceneObject(pVictim):getObjectName() .. "). Setting to 5.") -- TODO: Magic numbe
		writeScreenPlayData(pPlayer, "wodThemepark:hunting", "huntTargetGoal", 5) -- TODO: Magic number
		targetGoal = 5 -- TODO: Magic number
	end

	if (huntTarget == nil or huntTarget == "") then
		local newTarget = ""
		writeScreenPlayData(pPlayer, "wodThemepark:hunting", "huntTarget", "female_malkloc_plainswalker;malkloc;malkloc_bull;malkloc_plainswalker;young_malkloc;young_malkloc_plainswalker") --TODO: Magic string
		newTarget = "female_malkloc_plainswalker;malkloc;malkloc_bull;malkloc_plainswalker;young_malkloc;young_malkloc_plainswalker" --TODO: Magic string
		printLuaError("wodTwoClansArc:notifyKilledHuntTarget, nil huntTarget for player: " .. SceneObject(pPlayer):getCustomObjectName() .. " (player killed target: " .. SceneObject(pVictim):getObjectName() .. "). Setting to " .. newTarget .. ".")
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
		writeScreenPlayData(pPlayer, "wodThemepark:hunting", "huntTargetCount", targetCount)
		
		local remaining = targetGoal - targetCount
		if (remaining == 0) then
			CreatureObject(pPlayer):sendSystemMessage("You have collected all the necessary prime malkloc meat, return to prepare the altar.")
		else
			CreatureObject(pPlayer):sendSystemMessage("You have collected some prime malkloc meat, " .. remaining .. " remaining.")
		end
		
		local pGhost = CreatureObject(pPlayer):getPlayerObject()

		if (pGhost == nil) then
			return 0
		end

		if (targetCount >= targetGoal) then
			if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_SISTER1_02)) then
				QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_NS_SISTER1_02)
				QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_NS_SISTER1_03)
			elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_SISTER1_02)) then
				QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_SM_SISTER1_02)
				QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_SISTER1_03)
			end
			PlayerObject(pGhost):addWaypoint("dathomir", "@theme_park_wod/wod_sister1:task03_waypoint_name", "", -4841, -2938, WAYPOINTYELLOW, true, true, 0)
			return 1
		end
	end

	return 0
end

function wodTwoClansArc:spawnFirstSister(pPlayer)
	if (pPlayer == nil) then
		return
	end
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	PlayerObject(pGhost):addWaypoint("dathomir", "@theme_park_wod/wod_sister1:task04_waypoint_name", "", -4782, -2951, WAYPOINTYELLOW, true, true, 0)
	local pFirstSister = spawnMobile("dathomir", "wod_first_sister", 60, -4782, 128.4, -2951, -82, 0)
	CreatureObject(pFirstSister):setPvpStatusBitmask(0)
	createObserver(OBJECTDESTRUCTION, "wodTwoClansArc", "notifyFirstSisterKilled", pFirstSister)
end

function wodTwoClansArc:startFirstSisterEncounter(pNpc)
	if (pNpc == nil) then
		return
	end
	
	CreatureObject(pNpc):setPvpStatusBitmask(AGGRESSIVE + ATTACKABLE + ENEMY)
	spatialChat(pNpc, "@theme_park_wod/wod:first_sister_aggro")
end

function wodTwoClansArc:notifyFirstSisterKilled(pFirstSister)
	if (pFirstSister == nil) then
		return 1
	end
	
	local ownerID = readData("wodThemePark:firstSisterOwnerID")
	
	if (ownerID == nil) then
		return 1
	end
	
	local pOwner = getSceneObject(ownerID)
	
	if (pOwner == nil) then
		return 0
	end
	
	if (QuestManager.hasActiveQuest(pOwner, QuestManager.quests.WOD_NS_SISTER1_05)) then
		QuestManager.completeQuest(pOwner, QuestManager.quests.WOD_NS_SISTER1_05)
	else
		QuestManager.completeQuest(pOwner, QuestManager.quests.WOD_SM_SISTER1_05)
	end
	
	wodSister1ReturnGoto:start(pOwner)
	
	createEvent(5 * 1000, "wodTwoClansArc", "sendFirstSisterCommMessage", pOwner, "")
	return 0
end

function wodTwoClansArc:sendFirstSisterCommMessage(pPlayer)
	if (pPlayer == nil) then
		return
	end

	local sui = SuiMessageBox.new("wodTwoClansArc", "noCallBack")
	sui.setTitle("@theme_park_wod/wod_sister1:comm_message_title")
	sui.setPrompt("@theme_park_wod/wod_sister1:task04_comm_message_text")
	sui.hideCancelButton()
	sui.sendTo(pPlayer)
end

function wodTwoClansArc:spawnSecondSisterFireAdds(location)
	if (location == nil) then
		return
	end
	
	for i,v in ipairs(#self.sister2Adds[location]) do
		spawnMobile("dathomir", v[1], v[2], v[3], v[4], v[5], v[6], v[7])
	end
end

function wodTwoClansArc:checkSecondSisterFireStatus(pPlayer)
	if (pPlayer == nil) then
		return
	end
	
	for i = 2, 5 do
		if (not QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_ns_sister2_0" .. i)) and not QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_sm_sister2_0" .. i))) then
			return
		end
	end
	
	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_SISTER2)) then
		QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_NS_SISTER2_06)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_NS_SISTER2_07)
	else
		QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_SM_SISTER2_06)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_SISTER2_07)
	end
end

function wodTwoClansArc:spawnSecondSister(pPlayer)
	if (pPlayer == nil) then
		return
	end
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	PlayerObject(pGhost):addWaypoint("dathomir", "@theme_park_wod/wod_sister2:task07_waypoint_name", "", -3517, -6050, WAYPOINTYELLOW, true, true, 0)
	local pSecondSister = spawnMobile("dathomir", "wod_second_sister", 60, -3517, 92.5, -6050, -63, 0)
	CreatureObject(pSecondSister):setPvpStatusBitmask(0)
	createObserver(OBJECTDESTRUCTION, "wodTwoClansArc", "notifySecondSisterKilled", pSecondSister)
end

function wodTwoClansArc:startSecondSisterEncounter(pNpc)
	if (pNpc == nil) then
		return
	end
	
	CreatureObject(pNpc):setPvpStatusBitmask(AGGRESSIVE + ATTACKABLE + ENEMY)
	spatialChat(pNpc, "@theme_park_wod/wod:second_sister_aggro")
end

function wodTwoClansArc:notifySecondSisterKilled(pSecondSister)
	if (pSecondSister == nil) then
		return 1
	end
	
	local ownerID = readData("wodThemePark:secondSisterOwnerID")
	
	if (ownerID == nil) then
		return 1
	end
	
	local pOwner = getSceneObject(ownerID)
	
	if (pOwner == nil) then
		return 0
	end
	
	if (QuestManager.hasActiveQuest(pOwner, QuestManager.quests.WOD_NS_SISTER1_05)) then
		QuestManager.completeQuest(pOwner, QuestManager.quests.WOD_NS_SISTER1_05)
	else
		QuestManager.completeQuest(pOwner, QuestManager.quests.WOD_SM_SISTER1_05)
	end
	
	wodSister2ReturnGoto:start(pOwner)
	
	createEvent(5 * 1000, "wodTwoClansArc", "sendSecondSisterCommMessage", pOwner, "")
	return 0
end

function wodTwoClansArc:sendSecondSisterCommMessage(pPlayer)
	if (pPlayer == nil) then
		return
	end
	
	if (QuestManager.hasCompletedQuest(pPlayer, QuestManager.quests.WOD_NS_SISTER2_07)) then
		QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_NS_SISTER1_07)
	else
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_SISTER1_07)
	end

	local sui = SuiMessageBox.new("wodTwoClansArc", "noCallBack")
	sui.setTitle("@theme_park_wod/wod_sister2:comm_message_title")
	sui.setPrompt("@theme_park_wod/wod_sister2:task07_comm_message_text")
	sui.hideCancelButton()
	sui.sendTo(pPlayer)
end

function wodTwoClansArc:spawnThirdSister()
	local pThirdSister = spawnMobile("dathomir", "wod_third_sister", 60, -3228.6, 28.5, -3701.8, -48, 0)
	CreatureObject(pThirdSister):setPvpStatusBitmask(0)
	createObserver(OBJECTDESTRUCTION, "wodTwoClansArc", "notifyThirdSisterKilled", pThirdSister)
end

function wodTwoClansArc:startThirdSisterEncounter(pNpc)
	if (pNpc == nil) then
		return
	end
	
	CreatureObject(pNpc):setPvpStatusBitmask(AGGRESSIVE + ATTACKABLE + ENEMY)
	spatialChat(pNpc, "@theme_park_wod/wod:third_sister_aggro")
	createEvent(10 * 60 * 1000, "wodTwoClansArc", "despawnMobile", pNpc, "")
end

function wodTwoClansArc:notifyThirdSisterKilled(pThirdSister)
	if (pThirdSister == nil) then
		return 1
	end
	
	local ownerID = readData("wodThemePark:thirdSisterOwnerID")
	
	if (ownerID == nil) then
		return 0
	end
	
	local pOwner = getSceneObject(ownerID)
	
	if (pOwner == nil) then
		return 0
	end
	
	if (QuestManager.hasActiveQuest(pOwner, QuestManager.quests.WOD_NS_SISTER3_02)) then
		QuestManager.completeQuest(pOwner, QuestManager.quests.WOD_NS_SISTER3_02)
	else
		QuestManager.completeQuest(pOwner, QuestManager.quests.WOD_SM_SISTER3_02)
	end
	
	wodSister3ReturnGoto:start(pOwner)
	
	createEvent(5 * 1000, "wodTwoClansArc", "sendThirdSisterCommMessage", pOwner, "")
	return 0
end

function wodTwoClansArc:sendThirdSisterCommMessage(pPlayer)
	if (pPlayer == nil) then
		return
	end
	
	if (QuestManager.hasCompletedQuest(pPlayer, QuestManager.quests.WOD_NS_SISTER3_02)) then
		QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_NS_SISTER3_03)
	else
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_NS_SISTER3_03)
	end

	local sui = SuiMessageBox.new("wodTwoClansArc", "noCallBack")
	sui.setTitle("@theme_park_wod/wod_sister3:comm_message_title")
	sui.setPrompt("@theme_park_wod/wod_sister3:task02_comm_message_text")
	sui.hideCancelButton()
	sui.sendTo(pPlayer)
end
