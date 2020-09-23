local ObjectManager = require("managers.object.object_manager")
local QuestManager = require("managers.quest.quest_manager")

restuss01ConvoHandler = conv_handler:new {}

function restuss01ConvoHandler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)

	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.REPUBLIC_RESTUSS_OP_TASK)) then
		return convoTemplate:getScreen("quest")
	end

	if (QuestManager.hasCompletedQuest(pPlayer, QuestManager.quests.REPUBLIC_RESTUSS_OP)) then
		return convoTemplate:getScreen("quest_completed")
	end

	return convoTemplate:getScreen("reject")
end

function restuss01ConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local pConvScreen = screen:cloneScreen()
	local clonedConversation = LuaConversationScreen(pConvScreen)

	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (screenID == "complete_quest") then
		QuestManager.completeQuest(pPlayer, QuestManager.quests.REPUBLIC_RESTUSS_OP_TASK)
		PlayerObject(pGhost):removeWaypointBySpecialType(WAYPOINTRESTUSSTASK)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.REPUBLIC_RESTUSS_OP_RETURN)
		PlayerObject(pGhost):addWaypoint("rori", "@theme_park_wod/wod_prologue_walkabout:task09_waypoint_name", "", 5233, 5830, WAYPOINTGREEN, true, true, WAYPOINTRESTUSSTASK)
	end

	return pConvScreen
end
