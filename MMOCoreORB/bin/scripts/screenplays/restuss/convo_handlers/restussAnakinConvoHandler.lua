local ObjectManager = require("managers.object.object_manager")
local QuestManager = require("managers.quest.quest_manager")

restussAnakinConvoHandler = conv_handler:new {}

function restussAnakinConvoHandler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)

	if (not CreatureObject(pPlayer):isImperial()) then
		return convoTemplate:getScreen("traitor")
	end

	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.REPUBLIC_RESTUSS_OP_TASK)) then
		return convoTemplate:getScreen("quest_in_progress")
	end

	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.REPUBLIC_RESTUSS_OP_RETURN)) then
		return convoTemplate:getScreen("return_quest")
	end

	if (QuestManager.hasCompletedQuest(pPlayer, QuestManager.quests.REPUBLIC_RESTUSS_OP)) then
		return convoTemplate:getScreen("quest_completed")
	end

	return convoTemplate:getScreen("init")
end

function restussAnakinConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local pConvScreen = screen:cloneScreen()
	local clonedConversation = LuaConversationScreen(pConvScreen)

	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (screenID == "start_quest") then
		QuestManager.activateQuest(pPlayer, QuestManager.quests.REPUBLIC_RESTUSS_OP)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.REPUBLIC_RESTUSS_OP_TASK)
		PlayerObject(pGhost):addWaypoint("rori", "@theme_park_wod/wod_prologue_walkabout:task09_waypoint_name", "", 5448, 5515, WAYPOINTGREEN, true, true, WAYPOINTRESTUSSTASK)
	end

	if (screenID == "complete_quest") then
		QuestManager.completeQuest(pPlayer, QuestManager.quests.REPUBLIC_RESTUSS_OP)
		QuestManager.completeQuest(pPlayer, QuestManager.quests.REPUBLIC_RESTUSS_OP_RETURN)
		restussRepublic:handleReward(pPlayer)
	end

	return pConvScreen
end
