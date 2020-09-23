local ObjectManager = require("managers.object.object_manager")
local QuestManager = require("managers.quest.quest_manager")

omega01ConvoHandler = conv_handler:new {}

function omega01ConvoHandler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)

	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.OMEGA_INITIAL_OP_TASK)) then
		return convoTemplate:getScreen("quest")
	end

	if (QuestManager.hasCompletedQuest(pPlayer, QuestManager.quests.OMEGA_INITIAL_OP)) then
		return convoTemplate:getScreen("quest_completed")
	end

	return convoTemplate:getScreen("reject")
end

function omega01ConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local pConvScreen = screen:cloneScreen()
	local clonedConversation = LuaConversationScreen(pConvScreen)

	if (screenID == "complete_quest") then
		QuestManager.completeQuest(pPlayer, QuestManager.quests.OMEGA_INITIAL_OP_TASK)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.OMEGA_INITIAL_OP_RETURN)
	end

	return pConvScreen
end
