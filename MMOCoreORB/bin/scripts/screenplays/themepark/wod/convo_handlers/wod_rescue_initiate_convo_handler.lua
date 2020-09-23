wod_rescue_initiate_convo_handler = conv_handler:new{}

local QuestManager = require("managers.quest.quest_manager")

function wod_rescue_initiate_convo_handler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	local clan = readScreenPlayData(pPlayer, "witchesOfDathomir", "clanAlignment")

	if (QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_lost_e02_03"))) then
		return convoTemplate:getScreen("initial_" .. clan)
	end
	
	return convoTemplate:getScreen("not_elligible_" .. clan)
end

function wod_rescue_initiate_convo_handler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local pConvScreen = screen:cloneScreen()
	local clonedConversation = LuaConversationScreen(pConvScreen)

	if (screenID == "complete_quest_" .. clan) then
		QuestManager.completeQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_lost_e02_02"))
		QuestManager.activateQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_lost_e02_03"))
		wodSpiderclanArc:sendCommMessage(pPlayer)
		wodSpiderclanArc:startEliminateQuest(pPlayer)
	end

    return pConvScreen
end
