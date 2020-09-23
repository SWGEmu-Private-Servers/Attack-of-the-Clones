wodEntertainerQuest = ScreenPlay:new {
	targetList = "",
}

registerScreenPlay("wodEntertainerQuest", false)

local QuestManager = require("managers.quest.quest_manager")

--TODO: Timer

function wodEntertainerQuest:beginQuest(pPlayer)
	dropObserver(STARTENTERTAIN, "wodEntertainerQuest", "notifyPerformanceObserver", pPlayer)
	createObserver(STARTENTERTAIN, "wodEntertainerQuest", "notifyPerformanceObserver", pPlayer)
end

function wodEntertainerQuest:notifyPerformanceObserver(pPlayer, pPlayer2)
	if (pPlayer == nil) then
		return 1
	end

	if (self:isCorrectTarget(pPlayer)) then
		createObserver(FLOURISH, "wodEntertainerQuest", "notifyFlourishObserver", pPlayer)
	end

	return 0
end

function wodEntertainerQuest:isCorrectTarget(pPlayer)
	if (pPlayer == nil) then
		return false
	end

	local targetID = CreatureObject(pPlayer):getTargetID()

	if (targetID == nil) then
		return false
	end

	local pTarget = getSceneObject(targetID)

	if (pTarget == nil) then
		return false
	end

	local targetList = HelperFuncs:splitString(self.targetList, ";")

	if (self.targetList == SceneObject(pTarget):getObjectName() or HelperFuncs:tableContainsValue(targetList, SceneObject(pTarget):getObjectName())) then
		writeData("wodThemepark:rancorTamerRancorID:" .. SceneObject(pPlayer):getObjectID(), targetID)
		return true
	end

	return false
end

function wodEntertainerQuest:notifyFlourishObserver(pPlayer, pPlayer2, flourishID)
	if (pPlayer == nil) then
		return 1
	end

	local pTarget = getSceneObject(readData("wodThemepark:rancorTamerRancorID:" .. SceneObject(pPlayer):getObjectID()))

	if (pTarget == nil or pTarget == "") then
		return 1
	end

	if (CreatureObject(pTarget):isInCombat() or CreatureObject(pTarget):isDead() or not CreatureObject(pTarget):isAiAgent()) then
		return 1
	end

	local targetID = SceneObject(pTarget):getObjectID()
	local n = getRandomNumber(1, 10)

	if (n == 10) then
		dropObserver(FLOURISH, pPlayer)
		CreatureObject(pTarget):engageCombat(pPlayer)
		CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:got_control")
		return 1
	end

	if (n <= 3) then
		CreatureObject(pTarget):setPvpStatusBitmask(0)
		AiAgent(pTarget):setAiTemplate("escort")
		AiAgent(pTarget):setFollowObject(pPlayer)
		if (readData("wodThemepark:rancorEntTamed:" .. targetID) == 1) then
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:renew_control")
			writeData("wodThemepark:rancorEntState:" .. rancorID, 0)
		elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_RANCOR_TAMER)) then
			QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_NS_RANCOR_TAMER_01)
			QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_NS_RANCOR_TAMER_02)
			wodEntNSReturnGoto:start(pPlayer, pTarget)
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:got_control")
		elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_RANCOR_TAMER)) then
			QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_SM_RANCOR_TAMER_01)
			QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_RANCOR_TAMER_02)
			wodEntSMReturnGoto:start(pPlayer, pTarget)
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:got_control")
		end
		writeData("wodThemepark:rancorEntTamed:" .. targetID, 1)
		createEvent(30 * 1000, "wodEntertainerQuest", "checkControl", pPlayer, targetID)
		return 1
	else
		if (n <= 6) then
			local i = getRandomNumber(1, 4)
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:rancor_flavor_" .. i)
		end
	end
	return 0
end

function wodEntertainerQuest:checkControl(pPlayer, rancorID)
	if (pPlayer == nil or rancorID == nil) then
		return
	end

	if (readData("wodThemepark:rancorEntTamed:" .. SceneObject(pPlayer):getObjectID()) ~= 1) then
		return
	end

	local pRancor = getSceneObject(rancorID)

	if (not CreatureObject(pRancor):isInRangeWithObject(pPlayer, 64)) then
		CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:stop_following")
		AiAgent(pTarget):setFollowObject(nil)
		AiAgent(pRancor):setHomeLocation(SceneObject(pRancor):getWorldPositionX(), SceneObject(pRancor):getWorldPositionZ(), SceneObject(pRancor):getWorldPositionY(), SceneObject(pRancor):getParent())
		CreatureObject(pTarget):setPvpStatusBitmask(AGGRESSIVE + ATTACKABLE + ENEMY)
		deleteData("wodThemepark:rancorEntState:" .. rancorID)
	end

	local n = getRandomNumber (1, 10)

	if (readData("wodThemepark:rancorEntState:" .. rancorID) == 1) then
		if (n < 4) then
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:lost_control")
			AiAgent(pTarget):setFollowObject(nil)
			AiAgent(pRancor):setHomeLocation(SceneObject(pRancor):getWorldPositionX(), SceneObject(pRancor):getWorldPositionZ(), SceneObject(pRancor):getWorldPositionY(), SceneObject(pRancor):getParent())
			CreatureObject(pTarget):setPvpStatusBitmask(AGGRESSIVE + ATTACKABLE + ENEMY)
			CreatureObject(pRancor):engageCombat(pPlayer)
			deleteData("wodThemepark:rancorEntState:" .. rancorID)
			return
		end
	else
		if (n == 10) then
			writeData("wodThemepark:rancorEntState:" .. rancorID, 1)
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:control_warning")
		elseif (n >= 6) then
			local i = getRandomNumber(1, 4)
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:rancor_flavor_" .. i)
		end
	end
	createEvent(30 * 1000, "wodEntertainerQuest", "checkControl", pPlayer, rancorID)
end

function wodEntertainerQuest:failQuest(pPlayer)
	if (pPlayer == nil) then
		return
	end
	dropObserver(STARTENTERTAIN, "wodEntertainerQuest", "notifyPerformanceObserver", pPlayer)
	
	local clan = readScreenPlayData(pPlayer, "witchesOfDathomir", "clanAlignment")
	QuestManager.completeQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_rancor_tamer_01"))
	QuestManager.completeQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_rancor_tamer_02"))
	QuestManager.activateQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_rancor_tamer_04"))
	
	CreatureObject(pPlayer):sendSystemMessage("You failed to bring a rancor home before the salve wore off.")
	
	local pRancor = getSceneObject(readData("wodThemepark:rancorTamingRancorID" .. SceneObject(pPlayer):getObjectID()))
	AiAgent(pTarget):setFollowObject(nil)
	AiAgent(pRancor):setHomeLocation(SceneObject(pRancor):getWorldPositionX(), SceneObject(pRancor):getWorldPositionZ(), SceneObject(pRancor):getWorldPositionY(), SceneObject(pRancor):getParent())
	CreatureObject(pTarget):setPvpStatusBitmask(AGGRESSIVE + ATTACKABLE + ENEMY)
	CreatureObject(pRancor):engageCombat(pPlayer)
	
	deleteData("wodThemepark:rancorEntState:" .. readData("wodThemepark:rancorTamingRancorID" .. SceneObject(pPlayer):getObjectID()))
	deleteData("wodThemepark:rancorEntTamed:" .. readData("wodThemepark:rancorTamingRancorID" .. SceneObject(pPlayer):getObjectID()))
	deleteData("wodThemepark:rancorTamingActive:" .. SceneObject(pPlayer):getObjectID())
	deleteData("wodThemepark:rancorTamerRancorID:" .. SceneObject(pPlayer):getObjectID())
end
