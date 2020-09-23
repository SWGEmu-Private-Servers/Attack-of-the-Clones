wodFishing = ScreenPlay:new {

}

registerScreenPlay("wodFishing", false)

local QuestManager = require("managers.quest.quest_manager")

--Eliminate quest
function wodFishing:startEliminateQuest(pPlayer)
	if (not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_FISHING_01) and not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_FISHING_01)) then
		return
	end
	
	dropObserver(FISHINGSUCESS, "wodFishing", "notifyFishingSuccess", pPlayer)
	deleteScreenPlayData(pPlayer, "wodThemepark:fishing", "fishTarget")
	deleteScreenPlayData(pPlayer, "wodThemepark:fishing", "fishTargetCount")
	deleteScreenPlayData(pPlayer, "wodThemepark:fishing", "fishTargetGoal")
	
	writeScreenPlayData(pPlayer, "wodThemepark:fishing", "fishTargetCount", 0)
	writeScreenPlayData(pPlayer, "wodThemepark:fishing", "fishTargetGoal", 5) -- TODO: Magic number
	writeScreenPlayData(pPlayer, "wodThemepark:fishing", "fishTarget", "blackfish;blowfish;bluefish;faa;laa;ray;striped") --TODO: Magic string
	
	createObserver(FISHINGSUCESS, "wodFishing", "notifyFishingSuccess", pPlayer)
end

function wodFishing:notifyFishingSuccess(pItem, pPlayer)
	if (pItem == nil or pPlayer == nil) then
		return 0
	end
	
	if (not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_FISHING_01) and not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_FISHING_01)) then
		return 0
	end

	local fishTarget = readScreenPlayData(pPlayer, "wodThemepark:fishing", "fishTarget")
	local targetCount = tonumber(readScreenPlayData(pPlayer, "wodThemepark:fishing", "fishTargetCount"))
	local targetGoal = tonumber(readScreenPlayData(pPlayer, "wodThemepark:fishing", "fishTargetGoal"))

	if (targetCount == nil) then
		printLuaError("wodFishing:notifyFishingSuccess, nil targetCount for player: " .. SceneObject(pPlayer):getCustomObjectName() .. " (player killed target: " .. SceneObject(pItem):getObjectName() .. "). Setting to 0.")
		writeScreenPlayData(pPlayer, "wodThemepark:fishing", "fishTargetCount", 0)
		targetCount = 0
	end

	if (targetGoal == nil) then
		printLuaError("wodFishing:notifyFishingSuccess, nil targetGoal for player: " .. SceneObject(pPlayer):getCustomObjectName() .. " (player killed target: " .. SceneObject(pItem):getObjectName() .. "). Setting to 5.") -- TODO: Magic numbe
		writeScreenPlayData(pPlayer, "wodThemepark:fishing", "fishTargetGoal", 5) -- TODO: Magic number
		targetGoal = 5 -- TODO: Magic number
	end

	if (fishTarget == nil or fishTarget == "") then
		local newTarget = ""
		writeScreenPlayData(pPlayer, "wodThemepark:fishing", "fishTarget", "blackfish;blowfish;bluefish;faa;laa;ray;striped") --TODO: Magic string
		newTarget = "blackfish;blowfish;bluefish;faa;laa;ray;striped" --TODO: Magic string
		printLuaError("wodFishing:notifyFishingSuccess, nil fishTarget for player: " .. SceneObject(pPlayer):getCustomObjectName() .. " (player killed target: " .. SceneObject(pItem):getObjectName() .. "). Setting to " .. newTarget .. ".")
		fishTarget = newTarget
	end

	local itemList = HelperFuncs:splitString(fishTarget, ";")

	if (fishTarget == SceneObject(pItem):getObjectName() or HelperFuncs:tableContainsValue(itemList, SceneObject(pItem):getObjectName())) then
		local n = getRandomNumber(1, 4) --TODO: Magic number
		if (n == 1) then
			return 0
		end
		
		targetCount = targetCount + 1
		writeScreenPlayData(pPlayer, "wodThemepark:fishing", "fishTargetCount", targetCount)
		
		local remaining = targetGoal - targetCount
		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_FISHING)) then
			if (remaining == 0) then
				CreatureObject(pPlayer):sendSystemMessage("You have caught all the necessary fish, return to Kais.")
			else
				CreatureObject(pPlayer):sendSystemMessage("You have caught a fish, " .. remaining .. " remaining.")
			end
		elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_FISHING)) then
			if (remaining == 0) then
				CreatureObject(pPlayer):sendSystemMessage("You have caught all the necessary fish, return to Vhaunda.")
			else
				CreatureObject(pPlayer):sendSystemMessage("You have caught a fish, " .. remaining .. " remaining.")
			end
		end

		if (targetCount >= targetGoal) then
			if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_FISHING)) then
				QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_NS_FISHING_01)
				QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_NS_FISHING_02)
				wodFishingNSReturnGoto:start(pPlayer)
			elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_FISHING)) then
				QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_SM_FISHING_01)
				QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_FISHING_02)
				wodFishingSMReturnGoto:start(pPlayer)
			end
			return 1
		end
	end

	return 0
end