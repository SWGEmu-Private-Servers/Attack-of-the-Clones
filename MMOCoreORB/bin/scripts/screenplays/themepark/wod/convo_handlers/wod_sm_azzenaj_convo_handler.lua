wod_sm_azzenaj_convo_handler = conv_handler:new{}

local QuestManager = require("managers.quest.quest_manager")

function wod_sm_azzenaj_convo_handler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	local clan = readScreenPlayData(pPlayer, "witchesOfDathomir", "clanAlignment")

	if (clan == "" or clan == nil) then
		return convoTemplate:getScreen("not_elligible")
	elseif (clan == "ns") then
		return convoTemplate:getScreen("wrong_alignment")
	end
	
	if (QuestManager.hasCompletedQuest(pPlayer, QuestManager.quests.WOD_SM_QUEEN_MOTHER_FIGHT)) then
		return convoTemplate:getScreen("quest_complete")
	end
	
	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_QUEEN_MOTHER_FIGHT)) then
		return convoTemplate:getScreen("quest_challenge_in_progress")
	elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_EHS) and not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_EHS_04)) then
		return convoTemplate:getScreen("quest_hate_in_progress")
	elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_LOST_E02) and not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_LOST_E02_04)) then
		return convoTemplate:getScreen("quest_investigation_in_progress")
	elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_LOST_E01) and not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_LOST_E01_05)) then
		return convoTemplate:getScreen("quest_lost_in_progress")
	end
	
	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_EHS_04)) then
		return convoTemplate:getScreen("quest_hate_return")
	elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_LOST_E02_04)) then
		return convoTemplate:getScreen("quest_found_return")
	elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_LOST_E01_05)) then
		return convoTemplate:getScreen("quest_lost_return")
	end
	
	return convoTemplate:getScreen("initial")
end

function wod_sm_azzenaj_convo_handler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local pConvScreen = screen:cloneScreen()
	local clonedConversation = LuaConversationScreen(pConvScreen)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	
	if (pGhost == nil) then
		return pConvScreen
	end

	if (screenID == "start_quest_lost") then
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_LOST_E01)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_LOST_E01_01)
		wodSMLostE0101Goto:start(pPlayer)
	end
	
	if (screenID == "start_quest_found") then
		PlayerObject(pGhost):addWaypoint("dathomir", "@theme_park_wod/wod_sm_lost_e02:task01_waypoint_name", "", -1217, 6261, WAYPOINTYELLOW, true, true, 0)
		wodSpiderclanArc:startEliminateQuest(pPlayer)
		QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_SM_LOST_E01_05)
		QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_SM_LOST_E01)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_LOST_E02)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_LOST_E02_01)
		witchesOfDathomirScreenplay:handleReward(pPlayer, "lostE01")
	end
	
	if (screenID == "start_quest_hate") then
		wodSMEHSGoto:start(pPlayer)
		QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_SM_LOST_E01_05)
		QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_SM_LOST_E01)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_LOST_E02)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_LOST_E02_01)
		witchesOfDathomirScreenplay:handleReward(pPlayer, "lostE02")
	end
	
	if (screenID == "start_quest_challenge") then
		wodSMQueenMotherGoto:start(pPlayer)
		QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_SM_LOST_E02_04)
		QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_SM_LOST_E02)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_EHS)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_EHS_01)
		witchesOfDathomirScreenplay:handleReward(pPlayer, "ehs")
	end

    return pConvScreen
end
