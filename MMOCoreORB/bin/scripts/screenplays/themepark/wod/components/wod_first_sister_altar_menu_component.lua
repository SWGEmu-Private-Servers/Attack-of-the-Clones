wodFirstSisterAltarMenuComponent = {}

local QuestManager = require("managers.quest.quest_manager")

function wodFirstSisterAltarMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end

	if (not CreatureObject(pPlayer):isInRangeWithObject(pSceneObject, 5)) then
		return
	end

	local menuResponse = LuaObjectMenuResponse(pMenuResponse)

	menuResponse:addRadialMenuItem(20, 3, "@theme_park_wod/wod:first_sister_place_meat")
end

function wodFirstSisterAltarMenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
	if (pSceneObject == nil or pPlayer == nil) then
		return 0
	end

	if (selectedID == 20) then
		if (not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_SISTER1_03) or not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_SISTER1_03)) then
			creatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:first_sister_no_interest")
			return 0
		end

		if (CreatureObject(pPlayer):isRidingMount()) then
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:first_sister_not_while_mounted")
			return 0
		end

		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_SISTER1_03)) then
			QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_NS_SISTER1_03)
			QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_NS_SISTER1_04)
		else
			QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_SM_SISTER1_03)
			QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_SISTER1_04)
		end

		CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:first_sister_item_used")
		wodTwoClansArc:spawnFirstSister(pPlayer)
	end
	return 0
end