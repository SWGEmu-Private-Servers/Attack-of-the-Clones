wod_sm_rancor_tamer_convo_handler = conv_handler:new{}

local QuestManager = require("managers.quest.quest_manager")

function wod_sm_rancor_tamer_convo_handler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	local clan = readScreenPlayData(pPlayer, "witchesOfDathomir", "clanAlignment")

	if (clan == "" or clan == nil) then
		return convoTemplate:getScreen("not_elligible")
	elseif (clan == "ns") then
		return convoTemplate:getScreen("wrong_alignment")
	end

	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_WHOLE_TRUTH_03)) then
		return convoTemplate:getScreen("return_whole_truth")
	elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_WHOLE_TRUTH) and QuestManager.hasCompletedQuest(pPlayer, QuestManager.quests.WOD_SM_WHOLE_TRUTH_03) and not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_WHOLE_TRUTH_04)) then
		return convoTemplate:getScreen("whole_truth_two_init")
	elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_KYRISA_BOSS_06) or (QuestManager.hasCompletedQuest(pPlayer, QuestManager.quests.WOD_SM_WHOLE_TRUTH) and not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_KYRISA_BOSS_FIGHT))) then
		return convoTemplate:getScreen("return_whole_truth_two")
	end

	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_WHOLE_TRUTH) and not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_WHOLE_TRUTH_03)) then
		return convoTemplate:getScreen("quest_whole_truth_in_progress")
	elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_WHOLE_TRUTH) and not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_WHOLE_TRUTH_06)) then
		return convoTemplate:getScreen("quest_whole_truth_two_in_progress")
	elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_KYRISA_BOSS_FIGHT)) then
		return convoTemplate:getScreen("quest_greater_good_in_progress")
	end

	return convoTemplate:getScreen("initial")
end

function wod_sm_rancor_tamer_convo_handler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local pConvScreen = screen:cloneScreen()
	local clonedConversation = LuaConversationScreen(pConvScreen)

	if (screenID == "start_quest_whole_truth") then
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_WHOLE_TRUTH)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_WHOLE_TRUTH_01)
		wodSMWholeTruth01Goto:start(pPlayer)
	end

	if (screenID == "complete_quest_whole_truth") then
		QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_SM_WHOLE_TRUTH_03)
		witchesOfDathomirScreenplay:handleReward(pPlayer, "wholeTruth1")
	end

	if (screenID == "start_quest_whole_truth_two") then
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_WHOLE_TRUTH_04)
		wodSMWholeTruth04Goto:start(pPlayer)
	end

	if (screenID == "return_whole_truth_two") then
		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_WHOLE_TRUTH)) then
			QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_SM_WHOLE_TRUTH_06)
			QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_SM_WHOLE_TRUTH)
			witchesOfDathomirScreenplay:handleReward(pPlayer, "wholeTruth2")
		end
	end

	if (screenID == "quest_greater_good_start") then
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_KYRISA_BOSS_FIGHT)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_KYRISA_BOSS_FIGHT_01)
	end

    return pConvScreen
end
