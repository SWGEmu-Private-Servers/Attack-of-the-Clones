local QuestManager = require("managers.quest.quest_manager")

--TODO: Add fire effect

wodSecondSisterFire1MenuComponent = {}

function wodSecondSisterFire1MenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end

	if (not CreatureObject(pPlayer):isInRangeWithObject(pSceneObject, 5)) then
		return
	end

	local menuResponse = LuaObjectMenuResponse(pMenuResponse)

	if (not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_SISTER2_02) or not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_SISTER2_02) and not CreatureObject(pPlayer):isRidingMount()) then
		menuResponse:addRadialMenuItem(20, 3, "@theme_park_wod/wod:second_sister_start_fire")
	end
end

function wodSecondSisterFire1MenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
	if (pSceneObject == nil or pPlayer == nil) then
		return 0
	end

	if (selectedID == 20) then
		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_SISTER2_02)) then
			QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_NS_SISTER2_02)
		else
			QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_SM_SISTER2_02)
		end

		--Fire effect
		CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:second_sister_item_used")
		wodTwoClansArc:spawnSecondSisterFireAdds("firstLocation")
		wodTwoClansArc:checkSecondSisterFireStatus(pPlayer)
	end
	return 0
end

wodSecondSisterFire2MenuComponent = {}

function wodSecondSisterFire2MenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end

	if (not CreatureObject(pPlayer):isInRangeWithObject(pSceneObject, 5)) then
		return
	end

	local menuResponse = LuaObjectMenuResponse(pMenuResponse)

	if (not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_SISTER2_03) or not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_SISTER2_03) and not CreatureObject(pPlayer):isRidingMount()) then
		menuResponse:addRadialMenuItem(20, 3, "@theme_park_wod/wod:second_sister_start_fire")
	end
end

function wodSecondSisterFire2MenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
	if (pSceneObject == nil or pPlayer == nil) then
		return 0
	end

	if (selectedID == 20) then
		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_SISTER2_03)) then
			QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_NS_SISTER2_03)
		else
			QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_SM_SISTER2_03)
		end

		--Fire effect
		CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:second_sister_item_used")
		wodTwoClansArc:spawnSecondSisterFireAdds("secondLocation")
		wodTwoClansArc:checkSecondSisterFireStatus(pPlayer)
	end
	return 0
end

wodSecondSisterFire3MenuComponent = {}

function wodSecondSisterFire3MenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end

	if (not CreatureObject(pPlayer):isInRangeWithObject(pSceneObject, 5)) then
		return
	end

	local menuResponse = LuaObjectMenuResponse(pMenuResponse)

	if (not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_SISTER2_04) or not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_SISTER2_04) and not CreatureObject(pPlayer):isRidingMount()) then
		menuResponse:addRadialMenuItem(20, 3, "@theme_park_wod/wod:second_sister_start_fire")
	end
end

function wodSecondSisterFire3MenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
	if (pSceneObject == nil or pPlayer == nil) then
		return 0
	end

	if (selectedID == 20) then
		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_SISTER2_04)) then
			QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_NS_SISTER2_04)
		else
			QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_SM_SISTER2_04)
		end

		--Fire effect
		CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:second_sister_item_used")
		wodTwoClansArc:spawnSecondSisterFireAdds("thirdLocation")
		wodTwoClansArc:checkSecondSisterFireStatus(pPlayer)
	end
	return 0
end

wodSecondSisterFire4MenuComponent = {}

function wodSecondSisterFire4MenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end

	if (not CreatureObject(pPlayer):isInRangeWithObject(pSceneObject, 5)) then
		return
	end

	local menuResponse = LuaObjectMenuResponse(pMenuResponse)

	if (not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_SISTER2_05) or not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_SISTER2_05) and not CreatureObject(pPlayer):isRidingMount()) then
		menuResponse:addRadialMenuItem(20, 3, "@theme_park_wod/wod:second_sister_start_fire")
	end
end

function wodSecondSisterFire4MenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
	if (pSceneObject == nil or pPlayer == nil) then
		return 0
	end

	if (selectedID == 20) then
		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_SISTER2_05)) then
			QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_NS_SISTER2_05)
		else
			QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_SM_SISTER2_05)
		end

		--Fire effect
		CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:second_sister_item_used")
		wodTwoClansArc:spawnSecondSisterFireAdds("fourthLocation")
		wodTwoClansArc:checkSecondSisterFireStatus(pPlayer)
	end
	return 0
end