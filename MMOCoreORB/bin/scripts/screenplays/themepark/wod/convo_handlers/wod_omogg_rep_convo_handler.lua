wod_omogg_rep_convo_handler = conv_handler:new{}

local QuestManager = require("managers.quest.quest_manager")

function wod_omogg_rep_convo_handler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)

	if (QuestManager.hasCompletedQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_WALKABOUT_04) and not (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_WALKABOUT_05) or QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_WALKABOUT_06) or QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_WALKABOUT_07) or QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_WALKABOUT_08))) then
		return convoTemplate:getScreen("walkabout_two_init_alt")
	end

	if (QuestManager.hasCompletedQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_WALKABOUT)) then
		return convoTemplate:getScreen("quest_completed")
	end

	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_WALKABOUT) and not (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_WALKABOUT_04) or QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_WALKABOUT_08))) then
		return convoTemplate:getScreen("quest_in_progress")
	end

	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_WALKABOUT_04)) then
		return convoTemplate:getScreen("walkabout_return_init")
	end

	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_WALKABOUT_08)) then
		return convoTemplate:getScreen("walkabout_two_return_init")
	end

	return convoTemplate:getScreen("initial")
end

function wod_omogg_rep_convo_handler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
    local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local pConvScreen = screen:cloneScreen()
	local clonedConversation = LuaConversationScreen(pConvScreen)

	if (screenID == "walkabout_start") then
		wodWalkabout1Goto:start(pPlayer)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_WALKABOUT)
	QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_WALKABOUT_01)
	end

	if (screenID == "walkabout_complete") then
		QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_WALKABOUT_04)
	end

	if (screenID == "walkabout_two_start") then
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_WALKABOUT_05)
		wodWalkabout5Goto:start(pPlayer)
	end

	if (screenID == "walkabout_two_complete") then
		QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_WALKABOUT_08)
		QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_WALKABOUT)
		createEvent(10 * 1000, "wodPrologueScreenplay", "startMysteriousWitchQuest", pPlayer, "")
	end

    return pConvScreen
end
