wod_witch_food_convo_handler = conv_handler:new{}

local QuestManager = require("managers.quest.quest_manager")

function wod_witch_food_convo_handler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	local witchFoodType = self:getWitchFoodType(pPlayer, pNpc, pConvTemplate)
	local clan = readScreenPlayData(pPlayer, "witchesOfDathomir", "clanAlignment")
	
	if (clan == "" or clan == nil) then
		return convoTemplate:getScreen("not_elligible")
	elseif ((witchFoodType == "wod_ns_witch_food" and clan == "sm") or (witchFoodType == "wod_sm_witch_food" and clan == "ns")) then
		return convoTemplate:getScreen("wrong_alignment")
	end

	if (QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_hunting_02")) or QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_fishing_02"))) then
		return convoTemplate:getScreen("return_food")
	end
	
	return convoTemplate:getScreen("initial")
end

function wod_witch_food_convo_handler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local pConvScreen = screen:cloneScreen()
	local clonedConversation = LuaConversationScreen(pConvScreen)
	local witchFoodType = self:getWitchFoodType(pPlayer, pNpc, pConvTemplate)
	local clan = readScreenPlayData(pPlayer, "witchesOfDathomir", "clanAlignment")
	
	if (screenID == "bolma_start") then	
		if ((witchFoodType == "wod_ns_witch_food" and clan == QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_HUNTING)) or (witchFoodType == "wod_sm_witch_food" and QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_HUNTING))) then
			return convoTemplate:getScreen("other_faction_in_progress")
		elseif (QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_hunting"))) then
			return convoTemplate:getScreen("bolma_in_progress")
		else
			if (QuestManager.hasCompletedQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_hunting"))) then
				QuestManager.resetQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_hunting"))
				QuestManager.resetQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_hunting_01"))
				QuestManager.resetQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_hunting_02"))
			end
			QuestManager.activateQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_hunting"))
			QuestManager.activateQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_hunting_01"))
		end
	end
	
	if (screenID == "fish_start") then	
		if ((witchFoodType == "wod_ns_witch_food" and clan == QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_FISHING)) or (witchFoodType == "wod_sm_witch_food" and QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_FISHING))) then
			return convoTemplate:getScreen("other_faction_in_progress")
		elseif (QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_fishing"))) then
			return convoTemplate:getScreen("fish_in_progress")
		else
			if (QuestManager.hasCompletedQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_fishing"))) then
				QuestManager.resetQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_fishing"))
				QuestManager.resetQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_fishing_01"))
				QuestManager.resetQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_fishing_02"))
			end
			QuestManager.activateQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_fishing"))
			QuestManager.activateQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_fishing_01"))
		end
	end
	
	if (screenID == "return_food") then
		if (QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_hunting"))) then
			QuestManager.completeQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_hunting_02"))
			QuestManager.completeQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_hunting"))
			witchesOfDathomirScreenplay:addToCollection(pPlayer, "hunting" .. clan)
			witchesOfDathomirScreenplay:handleReward(pPlayer, "hunting")
		end
		if (QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_fishing"))) then
			QuestManager.completeQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_fishing_02"))
			QuestManager.completeQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_fishing"))
			witchesOfDathomirScreenplay:addToCollection(pPlayer, "fishing" .. clan)
			witchesOfDathomirScreenplay:handleReward(pPlayer, "fishing")
		end
	end

    return pConvScreen
end

function wod_witch_food_convo_handler:getWitchFoodType(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	local pScreen = convoTemplate:getScreen("witchFoodType")
	local screen = LuaConversationScreen(pScreen)

	return screen:getOptionLink(0)
end
