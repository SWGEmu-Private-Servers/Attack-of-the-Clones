wodHunting = ScreenPlay:new {

}

registerScreenPlay("wodHunting", false)

local QuestManager = require("managers.quest.quest_manager")

--Eliminate quest
function wodHunting:startEliminateQuest(pPlayer)
	if (not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_HUNTING_01) or not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_HUNTING_01)) then
		return
	end
	
	dropObserver(KILLEDCREATURE, "wodHunting", "notifyKilledHuntTarget", pPlayer)
	deleteScreenPlayData(pPlayer, "wodThemepark:hunting", "huntTarget")
	deleteScreenPlayData(pPlayer, "wodThemepark:hunting", "huntTargetCount")
	deleteScreenPlayData(pPlayer, "wodThemepark:hunting", "huntTargetGoal")
	
	writeScreenPlayData(pPlayer, "wodThemepark:hunting", "huntTargetCount", 0)
	writeScreenPlayData(pPlayer, "wodThemepark:hunting", "huntTargetGoal", 5) -- TODO: Magic number
	writeScreenPlayData(pPlayer, "wodThemepark:hunting", "huntTarget", "alpha_bolma;bolma;bolma_calf;bolma_female;bolma_male;bolma_pack_master;bolma_prime;bolma_youth;craggy_bolma;disturbed_bolma;lumbering_bolma") --TODO: Magic string
	
	createObserver(KILLEDCREATURE, "wodHunting", "notifyKilledHuntTarget", pPlayer)
end

function wodHunting:notifyKilledHuntTarget(pPlayer, pVictim)
	if (pVictim == nil or pPlayer == nil) then
		return 0
	end
	
	if (not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_HUNTING_01) and not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_HUNTING_01)) then
		return 0
	end

	local huntTarget = readScreenPlayData(pPlayer, "wodThemepark:hunting", "huntTarget")
	local targetCount = tonumber(readScreenPlayData(pPlayer, "wodThemepark:hunting", "huntTargetCount"))
	local targetGoal = tonumber(readScreenPlayData(pPlayer, "wodThemepark:hunting", "huntTargetGoal"))

	if (targetCount == nil) then
		printLuaError("wodHunting:notifyKilledHuntTarget, nil targetCount for player: " .. SceneObject(pPlayer):getCustomObjectName() .. " (player killed target: " .. SceneObject(pVictim):getObjectName() .. "). Setting to 0.")
		writeScreenPlayData(pPlayer, "wodThemepark:hunting", "huntTargetCount", 0)
		targetCount = 0
	end

	if (targetGoal == nil) then
		printLuaError("wodHunting:notifyKilledHuntTarget, nil targetGoal for player: " .. SceneObject(pPlayer):getCustomObjectName() .. " (player killed target: " .. SceneObject(pVictim):getObjectName() .. "). Setting to 5.") -- TODO: Magic numbe
		writeScreenPlayData(pPlayer, "wodThemepark:hunting", "huntTargetGoal", 5) -- TODO: Magic number
		targetGoal = 5 -- TODO: Magic number
	end

	if (huntTarget == nil or huntTarget == "") then
		local newTarget = ""
		writeScreenPlayData(pPlayer, "wodThemepark:hunting", "huntTarget", "alpha_bolma;bolma;bolma_calf;bolma_female;bolma_male;bolma_pack_master;bolma_prime;bolma_youth;craggy_bolma;disturbed_bolma;lumbering_bolma") --TODO: Magic string
		newTarget = "alpha_bolma;bolma;bolma_calf;bolma_female;bolma_male;bolma_pack_master;bolma_prime;bolma_youth;craggy_bolma;disturbed_bolma;lumbering_bolma" --TODO: Magic string
		printLuaError("wodHunting:notifyKilledHuntTarget, nil huntTarget for player: " .. SceneObject(pPlayer):getCustomObjectName() .. " (player killed target: " .. SceneObject(pVictim):getObjectName() .. "). Setting to " .. newTarget .. ".")
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
		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_HUNTING)) then
			if (remaining == 0) then
				CreatureObject(pPlayer):sendSystemMessage("You have collected all the necessary bolma meat, return to Kais.")
			else
				CreatureObject(pPlayer):sendSystemMessage("You have collected some bolma meat, " .. remaining .. " remaining.")
			end
		elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_HUNTING)) then
			if (remaining == 0) then
				CreatureObject(pPlayer):sendSystemMessage("You have collected all the necessary bolma meat, return to Vhaunda.")
			else
				CreatureObject(pPlayer):sendSystemMessage("You have collected some bolma meat, " .. remaining .. " remaining.")
			end
		end

		if (targetCount >= targetGoal) then
			if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_HUNTING)) then
				QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_NS_HUNTING_01)
				QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_NS_HUNTING_02)
				wodHuntingNSReturnGoto:start(pPlayer)
			elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_HUNTING)) then
				QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_SM_HUNTING_01)
				QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_HUNTING_02)
				wodHuntingSMReturnGoto:start(pPlayer)
			end
			return 1
		end
	end

	return 0
end
