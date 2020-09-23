wodHerbalPlantMenuComponent = {}

local QuestManager = require("managers.quest.quest_manager")

function wodHerbalPlantMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end
	
	if (not CreatureObject(pPlayer):isInRangeWithObject(pSceneObject, 5)) then
		return
	end
	
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	menuResponse:addRadialMenuItem(20, 3, "@theme_park_wod/messages:gather_herb")
end

function wodHerbalPlantMenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end

	if (selectedID == 20) then
		if (not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING) and not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_HERB_GATHERING) and not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_HERB_GATHERING)) then
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/messages:herb_not_sure_what_to_do")
			return
		end
		
		if (QuestManager.hasCompletedQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING_06) or QuestManager.hasCompletedQuest(pPlayer, QuestManager.quests.WOD_NS_HERB_GATHERING_06) or QuestManager.hasCompletedQuest(pPlayer, QuestManager.quests.WOD_SM_HERB_GATHERING_06)) then
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/messages:herb_already_completed_quest")
			return
		end
		
		if (CreatureObject(pPlayer):isRidingMount()) then
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/messages:gather_herb_not_while_mounted")
			return
		end
		
		for i = 1, #wodHerbalPlants.plantTemplates do
			if (SceneObject(pSceneObject):getObjectName() == wodHerbalPlants.plantTemplates[i]) then
				CreatureObject(pPlayer):sendSystemMessage(wodHerbalPlants.gatherMessage[i])
				break
			end
		end
		
		wodHerbalPlants:gatherHerbalPlant(pPlayer, pSceneObject)
	end
	return 0
end
