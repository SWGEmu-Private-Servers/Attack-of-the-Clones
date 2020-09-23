wodSpiderclanVegetationMenuComponent = {}

local QuestManager = require("managers.quest.quest_manager")

function wodSpiderclanVegetationMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end
	
	if (not CreatureObject(pPlayer):isInRangeWithObject(pSceneObject, 5)) then
		return
	end
	
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	menuResponse:addRadialMenuItem(20, 3, "@theme_park_wod/messages:wod_lost_retrieve_test")
end

function wodSpiderclanVegetationMenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end

	if (selectedID == 20) then
		if (not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_LOST_E01_03) or not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_LOST_E01_03)) then
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/messages:wod_lost_not_sure_what_to_do")
			return
		end
		
		if (creatureObject(pPlayer):isRidingMount()) then
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/messages:wod_lost_not_while_mounted")
			return
		end
		
		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_LOST_E01_03)) then
			QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_NS_LOST_E01_03)
			QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_NS_LOST_E01_04)
		else
			QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_SM_LOST_E01_03)
			QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_LOST_E01_04)
		end
		wodSpiderclanArc:sendCommMessage(pPlayer)
	end
	return 0
end