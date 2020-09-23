wodKillOtherClan = ScreenPlay:new {

}

registerScreenPlay("wodKillOtherClan", false)

local QuestManager = require("managers.quest.quest_manager")

--Eliminate quest
function wodKillOtherClan:startEliminateQuest(pPlayer)
	if (not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_KILL_01) or not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_KILL_01)) then
		return
	end
	
	dropObserver(KILLEDCREATURE, "wodKillOtherClan", "notifyKilledHuntTarget", pPlayer)
	deleteScreenPlayData(pPlayer, "wodThemepark:otherClan", "huntTarget")
	deleteScreenPlayData(pPlayer, "wodThemepark:otherClan", "huntTargetCount")
	deleteScreenPlayData(pPlayer, "wodThemepark:otherClan", "huntTargetGoal")
	
	writeScreenPlayData(pPlayer, "wodThemepark:otherClan", "huntTargetCount", 0)
	writeScreenPlayData(pPlayer, "wodThemepark:otherClan", "huntTargetGoal", 13) -- TODO: Magic number
	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_KILL_01)) then
		writeScreenPlayData(pPlayer, "wodThemepark:otherClan", "huntTarget", "singing_mtn_clan_arch_witch;singing_mtn_clan_councilwoman;singing_mtn_clan_dragoon;singing_mtn_clan_guardian;singing_mtn_clan_huntress;singing_mtn_clan_rancor_tamer;singing_mtn_clan_scout;singing_mountain_clan_sentry") --TODO: Magic string
	elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_KILL_01)) then
		writeScreenPlayData(pPlayer, "wodThemepark:otherClan", "huntTarget", "nightsister_elder;nightsister_protector;nightsister_rancor_tamer;nightsister_ranger;nightsister_sentinal;nightsister_sentry;nightsister_spell_weaver;nightsister_stalker") --TODO: Magic string
	end
	createObserver(KILLEDCREATURE, "wodKillOtherClan", "notifyKilledHuntTarget", pPlayer)
end

function wodKillOtherClan:notifyKilledHuntTarget(pPlayer, pVictim)
	if (pVictim == nil or pPlayer == nil) then
		return 0
	end
	
	if (not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_KILL_01) and not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_KILL_01)) then
		return 0
	end

	local huntTarget = readScreenPlayData(pPlayer, "wodThemepark:otherClan", "huntTarget")
	local targetCount = tonumber(readScreenPlayData(pPlayer, "wodThemepark:otherClan", "huntTargetCount"))
	local targetGoal = tonumber(readScreenPlayData(pPlayer, "wodThemepark:otherClan", "huntTargetGoal"))

	if (targetCount == nil) then
		printLuaError("wodKillOtherClan:notifyKilledHuntTarget, nil targetCount for player: " .. SceneObject(pPlayer):getCustomObjectName() .. " (player killed target: " .. SceneObject(pVictim):getObjectName() .. "). Setting to 0.")
		writeScreenPlayData(pPlayer, "wodThemepark:otherClan", "huntTargetCount", 0)
		targetCount = 0
	end

	if (targetGoal == nil) then
		printLuaError("wodKillOtherClan:notifyKilledHuntTarget, nil targetGoal for player: " .. SceneObject(pPlayer):getCustomObjectName() .. " (player killed target: " .. SceneObject(pVictim):getObjectName() .. "). Setting to 13.") -- TODO: Magic numbe
		writeScreenPlayData(pPlayer, "wodThemepark:otherClan", "huntTargetGoal", 13) -- TODO: Magic number
		targetGoal = 13 -- TODO: Magic number
	end

	if (huntTarget == nil or huntTarget == "") then
		local newTarget = ""
		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_KILL_01)) then
			writeScreenPlayData(pPlayer, "wodThemepark:otherClan", "huntTarget", "singing_mtn_clan_arch_witch;singing_mtn_clan_councilwoman;singing_mtn_clan_dragoon;singing_mtn_clan_guardian;singing_mtn_clan_huntress;singing_mtn_clan_rancor_tamer;singing_mtn_clan_scout;singing_mountain_clan_sentry") --TODO: Magic string
			newTarget = "singing_mtn_clan_arch_witch;singing_mtn_clan_councilwoman;singing_mtn_clan_dragoon;singing_mtn_clan_guardian;singing_mtn_clan_huntress;singing_mtn_clan_rancor_tamer;singing_mtn_clan_scout;singing_mountain_clan_sentry" --TODO: Magic string
		elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_KILL_01)) then
			writeScreenPlayData(pPlayer, "wodThemepark:otherClan", "huntTarget", "nightsister_elder;nightsister_protector;nightsister_rancor_tamer;nightsister_ranger;nightsister_sentinal;nightsister_sentry;nightsister_spell_weaver;nightsister_stalker") --TODO: Magic string
			newTarget = "nightsister_elder;nightsister_protector;nightsister_rancor_tamer;nightsister_ranger;nightsister_sentinal;nightsister_sentry;nightsister_spell_weaver;nightsister_stalker" --TODO: Magic string
		end
		printLuaError("wodKillOtherClan:notifyKilledHuntTarget, nil huntTarget for player: " .. SceneObject(pPlayer):getCustomObjectName() .. " (player killed target: " .. SceneObject(pVictim):getObjectName() .. "). Setting to " .. newTarget .. ".")
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
		writeScreenPlayData(pPlayer, "wodThemepark:otherClan", "huntTargetCount", targetCount)
		
		local remaining = targetGoal - targetCount
		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_KILL)) then
			if (remaining == 0) then
				CreatureObject(pPlayer):sendSystemMessage("You have kill enough members of the Singing Mountain Clan, return to Gethzerion.")
			else
				CreatureObject(pPlayer):sendSystemMessage("You have killed a member of the Singing Mountain Clan, " .. remaining .. " remaining.")
			end
		elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_KILL)) then
			if (remaining == 0) then
				CreatureObject(pPlayer):sendSystemMessage("You have kill enough members of the Nightsisters, return to Aujante K'lee.")
			else
				CreatureObject(pPlayer):sendSystemMessage("You have killed a member of the Nightsisters, " .. remaining .. " remaining.")
			end
		end

		if (targetCount >= targetGoal) then
			if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_KILL)) then
				QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_NS_KILL_01)
				QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_NS_KILL_02)
				wodKillOtherClanNSReturnGoto:start(pPlayer)
			elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_KILL)) then
				QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_SM_KILL_01)
				QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_KILL_02)
				wodKillOtherClanSMReturnGoto:start(pPlayer)
			end
			return 1
		end
	end

	return 0
end
