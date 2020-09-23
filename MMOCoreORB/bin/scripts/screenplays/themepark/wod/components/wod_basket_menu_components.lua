local QuestManager = require("managers.quest.quest_manager")

wodProSMBasketMenuComponent = {}

function wodProSMBasketMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end
	
	if (not CreatureObject(pPlayer):isInRangeWithObject(pSceneObject, 5)) then
		return
	end
	
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	
	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_ELIMINATE_SPIDER_CLAN_04)) then
		menuResponse:addRadialMenuItem(20, 3, "@theme_park_wod/messages:store_spider")
		return
	end
	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_ELIMINATE_RANCOR_04)) then
		menuResponse:addRadialMenuItem(20, 3, "@theme_park_wod/messages:store_teeth")
		return
	end
	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING_07)) then
		menuResponse:addRadialMenuItem(20, 3, "@theme_park_wod/messages:store_herb")
		return
	end
end

function wodProSMBasketMenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
	if (pSceneObject == nil or pPlayer == nil) then
		return 0
	end

	if (selectedID == 20) then
		if (CreatureObject(pPlayer):isRidingMount()) then
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/messages:store_herb_not_while_mounted")
			return 0
		end
		
		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_ELIMINATE_SPIDER_CLAN_04)) then
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/messages:store_spider_singing")
			QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_ELIMINATE_SPIDER_CLAN_04)
			QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_ELIMINATE_SPIDER_CLAN_05)
			return 0
		end
		
		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_ELIMINATE_RANCOR_04)) then
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/messages:store_rancor_singing")
			QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_ELIMINATE_RANCOR_04)
			QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_ELIMINATE_RANCOR_05)
			return 0
		end

		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING_07)) then
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/messages:store_herb_singing")
			QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING_07)
			QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING_08)
			return 0
		end
	end
	return 0
end

wodProNSBasketMenuComponent = {}

function wodProNSBasketMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end
	
	if (not CreatureObject(pPlayer):isInRangeWithObject(pSceneObject, 5)) then
		return
	end
	
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	
	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_ELIMINATE_SPIDER_CLAN_04)) then
		menuResponse:addRadialMenuItem(20, 3, "@theme_park_wod/messages:store_spider")
		return
	end
	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_ELIMINATE_RANCOR_04)) then
		menuResponse:addRadialMenuItem(20, 3, "@theme_park_wod/messages:store_teeth")
		return
	end
	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING_07)) then
		menuResponse:addRadialMenuItem(20, 3, "@theme_park_wod/messages:store_herb")
		return
	end
end

function wodProNSBasketMenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
	if (pSceneObject == nil or pPlayer == nil) then
		return 0
	end

	if (selectedID == 20) then
		if (CreatureObject(pPlayer):isRidingMount()) then
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/messages:store_herb_not_while_mounted")
			return 0
		end
		
		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_ELIMINATE_SPIDER_CLAN_04)) then
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/messages:store_spider_nightsister")
			QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_ELIMINATE_SPIDER_CLAN_04)
			QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_ELIMINATE_SPIDER_CLAN_06)
			return 0
		end
		
		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_ELIMINATE_RANCOR_04)) then
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/messages:store_rancor_nightsister")
			QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_ELIMINATE_RANCOR_04)
			QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_ELIMINATE_RANCOR_06)
			return 0
		end

		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING_07)) then
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/messages:store_herb_nightsister")
			QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING_07)
			QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING_09)
			return 0
		end
	end
	return 0
end

wodSMBasketMenuComponent = {}

function wodSMBasketMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end
	
	if (not CreatureObject(pPlayer):isInRangeWithObject(pSceneObject, 5)) then
		return
	end
	
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	
	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_HERB_GATHERING_07)) then
		menuResponse:addRadialMenuItem(20, 3, "@theme_park_wod/messages:store_herb")
		return
	end
end

function wodSMBasketMenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
	if (pSceneObject == nil or pPlayer == nil) then
		return 0
	end

	if (selectedID == 20) then
		if (not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_HERB_GATHERING_07) and not QuestManager.hasCompletedQuest(pPlayer, QuestManager.quests.WOD_SM_HERB_GATHERING_07)) then
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/messages:You aren't sure what to do with this.")
			return 0
		end
		
		if (CreatureObject(pPlayer):isRidingMount()) then
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/messages:store_herb_not_while_mounted")
			return 0
		end
		
		if (QuestManager.hasCompletedQuest(pPlayer, QuestManager.quests.WOD_SM_HERB_GATHERING_07)) then
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/messages:store_herb_already_completed_quest")
			return 0
		end

		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_HERB_GATHERING_07)) then
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/messages:store_herb_zip_bar")
			QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_SM_HERB_GATHERING_07)
			QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_HERB_GATHERING_08)
			return 0
		end
	end
	return 0
end

wodNSBasketMenuComponent = {}

function wodNSBasketMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end
	
	if (not CreatureObject(pPlayer):isInRangeWithObject(pSceneObject, 5)) then
		return
	end
	
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	
	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_HERB_GATHERING_07)) then
		menuResponse:addRadialMenuItem(20, 3, "@theme_park_wod/messages:store_herb")
		return
	end
end

function wodNSBasketMenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
	if (pSceneObject == nil or pPlayer == nil) then
		return 0
	end

	if (selectedID == 20) then
		if (not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_HERB_GATHERING_07) and not QuestManager.hasCompletedQuest(pPlayer, QuestManager.quests.WOD_NS_HERB_GATHERING_07)) then
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/messages:You aren't sure what to do with this.")
			return 0
		end
		
		if (CreatureObject(pPlayer):isRidingMount()) then
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/messages:store_herb_not_while_mounted")
			return 0
		end
		
		if (QuestManager.hasCompletedQuest(pPlayer, QuestManager.quests.WOD_NS_HERB_GATHERING_07)) then
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/messages:store_herb_already_completed_quest")
			return 0
		end

		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_HERB_GATHERING_07)) then
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/messages:store_herb_zip_bar")
			QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_NS_HERB_GATHERING_07)
			QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_NS_HERB_GATHERING_08)
			return 0
		end
	end
	return 0
end
