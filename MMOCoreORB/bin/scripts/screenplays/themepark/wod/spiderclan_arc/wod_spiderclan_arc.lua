wodSpiderclanArc = ScreenPlay:new {

}

registerScreenPlay("wodSpiderclanArc", false)

local QuestManager = require("managers.quest.quest_manager")

-- TODO: Patrol move before boss despawns

function wodSpiderclanArc:startBossFight()	
	local pBoss = spawnMobile("dathomir", "wod_spider_queen", 0, 46.3343, -67.424, -95.4863, 324, 610001008) 
	createObserver(OBJECTDESTRUCTION, "wodSpiderclanArc", "notifyBossKilled", pBoss)
	writeData("wodThemepark:spiderBossState", 1)
	writeData("wodThemepark:queenMotherBossFight:active", 1)
	createEvent(30 * 1000, "wodSpiderclanArc", "spawnAdds", nil, "")
	createEvent(10 * 60 * 1000, "wodSpiderclanArc", "failBossFight", pBoss, "")
	self:sendMessageToGroup(pBoss)
	
	local pOwner = getSceneObject(readData("wodThemepark:spiderBossFightOwnerID"))
	
	if (pOwner == nil) then
		return
	end
	
	local groupSize = CreatureObject(pOwner):getGroupSize()

	for i = 0, groupSize - 1, 1 do
		local pMember = CreatureObject(pOwner):getGroupMember(i)
		if (pMember ~= nil and CreatureObject(pOwner):isInRangeWithObject(pMember, 50)) then
			if (QuestManager.hasActiveQuest(pMember, QuestManager.quests.WOD_NS_QUEEN_MOTHER_FIGHT_02)) then
				QuestManager.completeQuest(pMember, QuestManager.quests.WOD_NS_QUEEN_MOTHER_FIGHT_02)
				QuestManager.activateQuest(pMember, QuestManager.quests.WOD_NS_QUEEN_MOTHER_FIGHT_03)
			elseif (QuestManager.hasActiveQuest(pMember, QuestManager.quests.WOD_SM_QUEEN_MOTHER_FIGHT_02)) then
				QuestManager.completeQuest(pMember, QuestManager.quests.WOD_SM_QUEEN_MOTHER_FIGHT_02)
				QuestManager.activateQuest(pMember, QuestManager.quests.WOD_SM_QUEEN_MOTHER_FIGHT_03)
			end
		end
	end
end

function wodSpiderclanArc:spawnAdds()
	spawnMobile("dathomir", "wod_spider_queen_consort", 0, 31.8323, -66.7798, -75.8352, 142, 610001008)
	spawnMobile("dathomir", "wod_spider_queen_guard", 0, 34.2232, -68.3924, -97.2978, 71, 610001008) 
	spawnMobile("dathomir", "wod_spider_queen_guard", 0, 51.4676, -66.435, -77.8212, 184, 610001008)  
	spawnMobile("dathomir", "wod_spider_queen_guard", 0, 31.1171, -66.8453, -74.6009, 145, 610001008) 
end

function wodSpiderclanArc:notifyBossKilled(pBoss)
	if (pBoss == nil) then
		return 1
	end
	
	local pOwner = getSceneObject(readData("wodThemepark:spiderBossFightOwnerID"))
	
	if (pOwner == nil) then
		return 1
	end
	
	local groupSize = CreatureObject(pOwner):getGroupSize()

	for i = 0, groupSize - 1, 1 do
		local pMember = CreatureObject(pOwner):getGroupMember(i)
		if (pMember ~= nil and CreatureObject(pOwner):isInRangeWithObject(pMember, 50)) then
			if (QuestManager.hasActiveQuest(pMember, QuestManager.quests.WOD_NS_QUEEN_MOTHER_FIGHT_03)) then
				QuestManager.completeQuest(pMember, QuestManager.quests.WOD_NS_QUEEN_MOTHER_FIGHT_03)
				QuestManager.completeQuest(pMember, QuestManager.quests.WOD_NS_QUEEN_MOTHER_FIGHT)
				witchesOfDathomirScreenplay:handleReward(pMember, "huntingParty")
			elseif (QuestManager.hasActiveQuest(pMember, QuestManager.quests.WOD_SM_QUEEN_MOTHER_FIGHT_03)) then
				QuestManager.completeQuest(pMember, QuestManager.quests.WOD_SM_QUEEN_MOTHER_FIGHT_03)
				QuestManager.completeQuest(pMember, QuestManager.quests.WOD_SM_QUEEN_MOTHER_FIGHT)
				witchesOfDathomirScreenplay:handleReward(pMember, "huntingParty")
			end
		end
	end

	deleteData("wodThemepark:queenMotherBossFight:active")
	deleteData("wodThemepark:spiderBossState")
	return 1
end

function wodSpiderclanArc:sendMessageToGroup(pBoss)
	if (pBoss == nil) then
		return
	end
	
	local pOwner = getSceneObject(readData("wodThemepark:spiderBossFightOwnerID"))
	
	if (pOwner == nil) then
		return
	end
	
	local bossState = readData("wodThemepark:spiderBossState")
	
	if (bossState == nil or bossState == "") then
		return
	end
	
	local groupSize = CreatureObject(pOwner):getGroupSize()

	for i = 0, groupSize - 1, 1 do
		local pMember = CreatureObject(pOwner):getGroupMember(i)
		if (pMember ~= nil and CreatureObject(pOwner):isInRangeWithObject(pMember, 50)) then
			if (bossState == 1) then
				createEvent(9 * 60 * 1000, "wodSpiderclanArc", "sendMessageToGroup", nil, "")
				CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:boss_spider_start")
				CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:boss_begin")
			elseif (bossState == 2) then
				CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:boss_time_warning")
			elseif (bossState == 3) then
				CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:boss_leaving")
			elseif (bossState == 4) then
				CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:boss_failed")
			end
		end
	end
	
	writeData("wodThemepark:spiderBossState", bossState + 1)
end

function wodSpiderclanArc:failBossFight(pBoss)
	if (pBoss == nil) then
		return
	end
	
	self:sendMessageToGroup(pBoss)
	CreatureObject(pBoss):setPvpStatusBitmask(0)
	forcePeace(pBoss)
	--Do move, then despawn
	createEvent(5 * 1000, "wodSpiderclanArc", "despawnBoss", pBoss, "")
end

function wodSpiderclanArc:despawnBoss(pBoss)
	if (pBoss == nil) then
		return
	end
	
	self:sendMessageToGroup(pBoss)

	if (SceneObject(pBoss):isAiAgent()) then
		CreatureObject(pBoss):setPvpStatusBitmask(0)
		forcePeace(pBoss)
	end
	SceneObject(pBoss):destroyObjectFromWorld()
	deleteData("wodThemepark:queenMotherBossFight:active")
	deleteData("wodThemepark:spiderBossState")
end

--Eliminate quest
function wodSpiderclanArc:startEliminateQuest(pPlayer)
	
	dropObserver(KILLEDCREATURE, "wodSpiderclanArc", "notifyKilledHuntTarget", pPlayer)
	deleteScreenPlayData(pPlayer, "wodThemepark:spiderclanArc:killQuest", "huntTarget")
	deleteScreenPlayData(pPlayer, "wodThemepark:spiderclanArc:killQuest", "huntTargetCount")
	deleteScreenPlayData(pPlayer, "wodThemepark:spiderclanArc:killQuest", "huntTargetGoal")
	
	writeScreenPlayData(pPlayer, "wodThemepark:spiderclanArc:killQuest", "huntTargetCount", 0)
	
	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_LOST_E02_01) or QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_LOST_E02_01)) then
		writeScreenPlayData(pPlayer, "wodThemepark:spiderclanArc:killQuest", "huntTargetGoal", 1) -- TODO: Magic number
		writeScreenPlayData(pPlayer, "wodThemepark:spiderclanArc:killQuest", "huntTarget", "wod_spiderclan_obfuscatrix") --TODO: Magic string
	elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_LOST_E02_03) or QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_LOST_E02_03)) then
		writeScreenPlayData(pPlayer, "wodThemepark:spiderclanArc:killQuest", "huntTargetGoal", 5) -- TODO: Magic number
		writeScreenPlayData(pPlayer, "wodThemepark:spiderclanArc:killQuest", "huntTarget", "spider_nightsister_initiate") --TODO: Magic string
	elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_EHS_02) or QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_EHS_02)) then
		writeScreenPlayData(pPlayer, "wodThemepark:spiderclanArc:killQuest", "huntTargetGoal", 6) -- TODO: Magic number
		writeScreenPlayData(pPlayer, "wodThemepark:spiderclanArc:killQuest", "huntTarget", "wod_spiderclan_obfuscatrix") --TODO: Magic string
	end
	
	createObserver(KILLEDCREATURE, "wodSpiderclanArc", "notifyKilledHuntTarget", pPlayer)
end

function wodSpiderclanArc:notifyKilledHuntTarget(pPlayer, pVictim)
	if (pVictim == nil or pPlayer == nil) then
		return 0
	end
	
	if (not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_LOST_E02_03) and not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_LOST_E02_03) or not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_EHS_02) or not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_EHS_02)) then
		return 0
	end

	local huntTarget = readScreenPlayData(pPlayer, "wodThemepark:spiderclanArc:killQuest", "huntTarget")
	local targetCount = tonumber(readScreenPlayData(pPlayer, "wodThemepark:spiderclanArc:killQuest", "huntTargetCount"))
	local targetGoal = tonumber(readScreenPlayData(pPlayer, "wodThemepark:spiderclanArc:killQuest", "huntTargetGoal"))

	if (targetCount == nil) then
		printLuaError("wodSpiderclanArc:notifyKilledHuntTarget, nil targetCount for player: " .. SceneObject(pPlayer):getCustomObjectName() .. " (player killed target: " .. SceneObject(pVictim):getObjectName() .. "). Setting to 0.")
		writeScreenPlayData(pPlayer, "wodThemepark:spiderclanArc:killQuest", "huntTargetCount", 0)
		targetCount = 0
	end

	if (targetGoal == nil) then
		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_LOST_E02_01) or QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_LOST_E02_01)) then
			printLuaError("wodSpiderclanArc:notifyKilledHuntTarget, nil targetGoal for player: " .. SceneObject(pPlayer):getCustomObjectName() .. " (player killed target: " .. SceneObject(pVictim):getObjectName() .. "). Setting to 1.") -- TODO: Magic numbe
			writeScreenPlayData(pPlayer, "wodThemepark:spiderclanArc:killQuest", "huntTargetGoal", 1) -- TODO: Magic number
			targetGoal = 1 -- TODO: Magic number
		elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_LOST_E02_03) or QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_LOST_E02_03)) then
			printLuaError("wodSpiderclanArc:notifyKilledHuntTarget, nil targetGoal for player: " .. SceneObject(pPlayer):getCustomObjectName() .. " (player killed target: " .. SceneObject(pVictim):getObjectName() .. "). Setting to 5.") -- TODO: Magic numbe
			writeScreenPlayData(pPlayer, "wodThemepark:spiderclanArc:killQuest", "huntTargetGoal", 5) -- TODO: Magic number
			targetGoal = 5 -- TODO: Magic number
		elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_EHS_02) or QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_EHS_02)) then
			printLuaError("wodSpiderclanArc:notifyKilledHuntTarget, nil targetGoal for player: " .. SceneObject(pPlayer):getCustomObjectName() .. " (player killed target: " .. SceneObject(pVictim):getObjectName() .. "). Setting to 6.") -- TODO: Magic numbe
			writeScreenPlayData(pPlayer, "wodThemepark:spiderclanArc:killQuest", "huntTargetGoal", 6) -- TODO: Magic number
			targetGoal = 6 -- TODO: Magic number
		end
	end

	if (huntTarget == nil or huntTarget == "") then
		local newTarget = ""
		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_LOST_E02_01) or QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_LOST_E02_01)) then
			newTarget = "wod_spiderclan_obfuscatrix" --TODO: Magic string
			printLuaError("wodSpiderclanArc:notifyKilledHuntTarget, nil huntTarget for player: " .. SceneObject(pPlayer):getCustomObjectName() .. " (player killed target: " .. SceneObject(pVictim):getObjectName() .. "). Setting to " .. newTarget .. ".")
			writeScreenPlayData(pPlayer, "wodThemepark:spiderclanArc:killQuest", "huntTarget", "wod_spiderclan_obfuscatrix") --TODO: Magic string
		elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_LOST_E02_03) or QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_LOST_E02_03)) then
			newTarget = "wod_spider_nightsister_initiate" --TODO: Magic string
			printLuaError("wodSpiderclanArc:notifyKilledHuntTarget, nil huntTarget for player: " .. SceneObject(pPlayer):getCustomObjectName() .. " (player killed target: " .. SceneObject(pVictim):getObjectName() .. "). Setting to " .. newTarget .. ".")
			writeScreenPlayData(pPlayer, "wodThemepark:spiderclanArc:killQuest", "huntTarget", "wod_spider_nightsister_initiate") --TODO: Magic string
		elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_EHS_02) or QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_EHS_02)) then
			newTarget = "wod_spiderclan_obfuscatrix" --TODO: Magic string
			printLuaError("wodSpiderclanArc:notifyKilledHuntTarget, nil huntTarget for player: " .. SceneObject(pPlayer):getCustomObjectName() .. " (player killed target: " .. SceneObject(pVictim):getObjectName() .. "). Setting to " .. newTarget .. ".")
			writeScreenPlayData(pPlayer, "wodThemepark:spiderclanArc:killQuest", "huntTarget", "wod_spiderclan_obfuscatrix") --TODO: Magic string
		end
		huntTarget = newTarget
	end

	if (SceneObject(pVictim):getZoneName() ~= SceneObject(pPlayer):getZoneName() or not CreatureObject(pPlayer):isInRangeWithObject(pVictim, 80)) then
		return 0
	end

	local targetList = HelperFuncs:splitString(huntTarget, ";")

	if (huntTarget == SceneObject(pVictim):getObjectName() or HelperFuncs:tableContainsValue(targetList, SceneObject(pVictim):getObjectName())) then
		targetCount = targetCount + 1
		
		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_LOST_E02_01) or QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_LOST_E02_01)) then
			if (getRandomNumber(1, 5) ~= 1) then
				return 0
			end
		end

		writeScreenPlayData(pPlayer, "wodThemepark:spiderclanArc:killQuest", "huntTargetCount", targetCount)

		local remaining = targetGoal - targetCount

		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_LOST_E02_03) or QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_LOST_E02_03)) then
			if (remaining == 0) then
				if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_LOST_E02_03)) then
					CreatureObject(pPlayer):sendSystemMessage("Your disturbance has allowed the initiate to escape, return to Leandra.")
				else
					CreatureObject(pPlayer):sendSystemMessage("Your disturbance has allowed the initiate to escape, return to Azzenaj.")
				end
			else
				CreatureObject(pPlayer):sendSystemMessage("You have killed an acolyte.")
			end
		elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_EHS_02) or QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_EHS_02)) then
			CreatureObject(pPlayer):sendSystemMessage("You have killed a Spiderclan Obfuscatrix.")
		end

		if (targetCount >= targetGoal) then
			if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_LOST_E02_01)) then
				QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_NS_LOST_E02_01)
				QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_NS_LOST_E02_02)
				self:sendCommMessage(pPlayer)
			elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_LOST_E02_01)) then
				QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_SM_LOST_E02_01)
				QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_LOST_E02_02)
				self:sendCommMessage(pPlayer)
			elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_LOST_E02_03)) then
				QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_NS_LOST_E02_03)
				QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_NS_LOST_E02_04)
				wodNSLostE0204Goto:start(pPlayer)
			elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_LOST_E02_03)) then
				QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_SM_LOST_E02_03)
				QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_LOST_E02_04)
				wodSMLostE0204Goto:start(pPlayer)
			elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_EHS_02)) then
				QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_NS_EHS_02)
				QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_NS_EHS_03)
				self:sendCommMessage(pPlayer)
			elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_EHS_02)) then
				QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_SM_EHS_02)
				QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_EHS_03)
				self:sendCommMessage(pPlayer)
			end
			return 1
		end
	end
	return 0
end

function wodSpiderclanArc:sendCommMessage(pPlayer)
	if (pPlayer == nil) then
		return
	end

	local sui = SuiMessageBox.new("wodSpiderclanArc", "noCallback")
	sui.hideCancelButton()

	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_LOST_E01_03)) then
		sui.setTitle("@theme_park_wod/wod_ns_lost_e01:comm_message_title")
		sui.setPrompt("@theme_park_wod/wod_ns_lost_e01:task03_comm_message_text")
		sui.sendTo(pPlayer)
	elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_LOST_E01_03)) then
		sui.setTitle("@theme_park_wod/wod_sm_lost_e01:comm_message_title")
		sui.setPrompt("@theme_park_wod/wod_sm_lost_e01:task03_comm_message_text")
		sui.sendTo(pPlayer)
	elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_LOST_E02_01)) then
		sui.setTitle("@theme_park_wod/wod_ns_lost_e02:comm_message_title")
		sui.setPrompt("@theme_park_wod/wod_ns_lost_e02:task01_comm_message_text")
		sui.sendTo(pPlayer)
	elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_LOST_E02_01)) then
		sui.setTitle("@theme_park_wod/wod_sm_lost_e02:comm_message_title")
		sui.setPrompt("@theme_park_wod/wod_sm_lost_e02:task01_comm_message_text")
		sui.sendTo(pPlayer)
	elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_LOST_E01_02)) then
		sui.setTitle("@theme_park_wod/wod_ns_lost_e01:comm_message_title")
		sui.setPrompt("@theme_park_wod/wod_ns_lost_e01:task02_comm_message_text")
		sui.sendTo(pPlayer)
	elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_LOST_E01_02)) then
		sui.setTitle("@theme_park_wod/wod_sm_lost_e01:comm_message_title")
		sui.setPrompt("@theme_park_wod/wod_sm_lost_e01:task02_comm_message_text")
		sui.sendTo(pPlayer)
	elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_EHS_02)) then
		sui.setTitle("@theme_park_wod/wod_ns_ehs:comm_message_title")
		sui.setPrompt("@theme_park_wod/wod_ns_ehs:task02_comm_message_text")
		sui.sendTo(pPlayer)
	elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_EHS_02)) then
		sui.setTitle("@theme_park_wod/wod_sm_ehs:comm_message_title")
		sui.setPrompt("@theme_park_wod/wod_sm_ehs:task02_comm_message_text")
		sui.sendTo(pPlayer)
	end
end

function wodSpiderclanArc:noCallback(pPlayer, pSui, eventIndex, ...)
end
