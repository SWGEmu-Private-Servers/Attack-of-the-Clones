wodKillSpiderclan = ScreenPlay:new {

}

registerScreenPlay("wodKillSpiderclan", false)

local QuestManager = require("managers.quest.quest_manager")

--Eliminate quest
function wodKillSpiderclan:startEliminateQuest(pPlayer)
	if (not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_KILL_SPIDERCLAN_01) or not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_KILL_SPIDERCLAN_01)) then
		return
	end
	
	dropObserver(KILLEDCREATURE, "wodKillSpiderclan", "notifyKilledHuntTarget", pPlayer)
	deleteScreenPlayData(pPlayer, "wodThemepark:spiderclan", "huntTarget")
	deleteScreenPlayData(pPlayer, "wodThemepark:spiderclan", "huntTargetCount")
	deleteScreenPlayData(pPlayer, "wodThemepark:spiderclan", "huntTargetGoal")
	
	writeScreenPlayData(pPlayer, "wodThemepark:spiderclan", "huntTargetCount", 0)
	writeScreenPlayData(pPlayer, "wodThemepark:spiderclan", "huntTargetGoal", 13) -- TODO: Magic number
	writeScreenPlayData(pPlayer, "wodThemepark:spiderclan", "huntTarget", "spider_nightsister_initiate;spider_nightsister_spell_weaver;spider_nightsister_crawler;spider_nightsister_elder;spider_nightsister_protector;spider_nightsister_sentinel;spider_nightsister_sentry;spider_nightsister_stalker;spider_nightsister_web_dancer") --TODO: Magic string
	
	createObserver(KILLEDCREATURE, "wodKillSpiderclan", "notifyKilledHuntTarget", pPlayer)
end

function wodKillSpiderclan:notifyKilledHuntTarget(pPlayer, pVictim)
	if (pVictim == nil or pPlayer == nil) then
		return 0
	end
	
	if (not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_KILL_SPIDERCLAN_01) and not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_KILL_SPIDERCLAN_01)) then
		return 0
	end

	local huntTarget = readScreenPlayData(pPlayer, "wodThemepark:spiderclan", "huntTarget")
	local targetCount = tonumber(readScreenPlayData(pPlayer, "wodThemepark:spiderclan", "huntTargetCount"))
	local targetGoal = tonumber(readScreenPlayData(pPlayer, "wodThemepark:spiderclan", "huntTargetGoal"))

	if (targetCount == nil) then
		printLuaError("wodKillSpiderclan:notifyKilledHuntTarget, nil targetCount for player: " .. SceneObject(pPlayer):getCustomObjectName() .. " (player killed target: " .. SceneObject(pVictim):getObjectName() .. "). Setting to 0.")
		writeScreenPlayData(pPlayer, "wodThemepark:spiderclan", "huntTargetCount", 0)
		targetCount = 0
	end

	if (targetGoal == nil) then
		printLuaError("wodKillSpiderclan:notifyKilledHuntTarget, nil targetGoal for player: " .. SceneObject(pPlayer):getCustomObjectName() .. " (player killed target: " .. SceneObject(pVictim):getObjectName() .. "). Setting to 13.") -- TODO: Magic numbe
		writeScreenPlayData(pPlayer, "wodThemepark:spiderclan", "huntTargetGoal", 13) -- TODO: Magic number
		targetGoal = 13 -- TODO: Magic number
	end

	if (huntTarget == nil or huntTarget == "") then
		local newTarget = ""
		writeScreenPlayData(pPlayer, "wodThemepark:spiderclan", "huntTarget", "spider_nightsister_initiate;spider_nightsister_spell_weaver;spider_nightsister_crawler;spider_nightsister_elder;spider_nightsister_protector;spider_nightsister_sentinel;spider_nightsister_sentry;spider_nightsister_stalker;spider_nightsister_web_dancer") --TODO: Magic string
		newTarget = "spider_nightsister_initiate;spider_nightsister_spell_weaver;spider_nightsister_crawler;spider_nightsister_elder;spider_nightsister_protector;spider_nightsister_sentinel;spider_nightsister_sentry;spider_nightsister_stalker;spider_nightsister_web_dancer" --TODO: Magic string
		printLuaError("wodKillSpiderclan:notifyKilledHuntTarget, nil huntTarget for player: " .. SceneObject(pPlayer):getCustomObjectName() .. " (player killed target: " .. SceneObject(pVictim):getObjectName() .. "). Setting to " .. newTarget .. ".")
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
		writeScreenPlayData(pPlayer, "wodThemepark:spiderclan", "huntTargetCount", targetCount)
		
		local remaining = targetGoal - targetCount
		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_KILL_SPIDERCLAN)) then
			if (remaining == 0) then
				CreatureObject(pPlayer):sendSystemMessage("You have kill enough members of the Spiderclan, return to Gethzerion.")
			else
				CreatureObject(pPlayer):sendSystemMessage("You have killed a member of the Spiderclan, " .. remaining .. " remaining.")
			end
		elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_KILL_SPIDERCLAN)) then
			if (remaining == 0) then
				CreatureObject(pPlayer):sendSystemMessage("You have kill enough members of the Spiderclan, return to Aujante K'lee.")
			else
				CreatureObject(pPlayer):sendSystemMessage("You have killed a member of the Spiderclan, " .. remaining .. " remaining.")
			end
		end

		if (targetCount >= targetGoal) then
			if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_KILL_SPIDERCLAN)) then
				QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_NS_KILL_SPIDERCLAN_01)
				QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_NS_KILL_SPIDERCLAN_02)
				wodKillSpiderclanNSReturnGoto:start(pPlayer)
			elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_KILL_SPIDERCLAN)) then
				QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_SM_KILL_SPIDERCLAN_01)
				QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_KILL_SPIDERCLAN_02)
				wodKillSpiderclanSMReturnGoto:start(pPlayer)
			end
			return 1
		end
	end

	return 0
end
