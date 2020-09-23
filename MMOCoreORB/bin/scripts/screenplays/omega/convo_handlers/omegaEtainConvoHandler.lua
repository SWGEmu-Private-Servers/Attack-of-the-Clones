local ObjectManager = require("managers.object.object_manager")
local QuestManager = require("managers.quest.quest_manager")

omegaEtainConvoHandler = conv_handler:new {}

function omegaEtainConvoHandler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)

	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.OMEGA_INITIAL_OP_TASK)) then
		return convoTemplate:getScreen("quest_in_progress")
	end

	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.OMEGA_INITIAL_OP_RETURN)) then
		return convoTemplate:getScreen("return_quest")
	end

	if (QuestManager.hasCompletedQuest(pPlayer, QuestManager.quests.OMEGA_INITIAL_OP)) then
		return convoTemplate:getScreen("quest_completed")
	end

	return convoTemplate:getScreen("init")
end

function omegaEtainConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local pConvScreen = screen:cloneScreen()
	local clonedConversation = LuaConversationScreen(pConvScreen)

	if (screenID == "start_quest") then
		QuestManager.activateQuest(pPlayer, QuestManager.quests.OMEGA_INITIAL_OP)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.OMEGA_INITIAL_OP_TASK)
	end

	if (screenID == "complete_quest") then
		QuestManager.completeQuest(pPlayer, QuestManager.quests.OMEGA_INITIAL_OP)
		QuestManager.completeQuest(pPlayer, QuestManager.quests.OMEGA_INITIAL_OP_RETURN)
		omegaOperations:handleReward(pPlayer)
	end

	return pConvScreen
end
