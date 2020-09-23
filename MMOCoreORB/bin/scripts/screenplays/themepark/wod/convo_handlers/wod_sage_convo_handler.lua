wod_sage_convo_handler = conv_handler:new{}

local QuestManager = require("managers.quest.quest_manager")

function wod_sage_convo_handler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	local sage = self:getSageType(pPlayer, pNpc, pConvTemplate)
	local clan = readScreenPlayData(pPlayer, "witchesOfDathomir", "clanAlignment")
	
	if (clan == "" or clan == nil) then
		return convoTemplate:getScreen("not_elligible")
	elseif ((sage == "wod_ns_sage" and clan == "sm") or (sage == "wod_sm_sage" and clan == "ns")) then
		return convoTemplate:getScreen("wrong_alignment")
	end
	
	if (QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_repair_altar_01")) or QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_repair_altar_02")) or QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_repair_altar_03")) or QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_repair_altar_04"))) then
		return convoTemplate:getScreen("quest_in_progress")
	elseif (QuestManager.hasCompletedQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_repair_altar_04"))) then
		return convoTemplate:getScreen("quest_completed")
	end
	
	if (not CreatureObject(pPlayer):hasSkill("crafting_artisan_novice")) then
		return convoTemplate:getScreen("not_crafter")
	end
	
	if (QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_repair_altar_04_04"))) then
		return convoTemplate:getScreen("init_fifth")
	elseif (QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_repair_altar_03_04")) or QuestManager.hasCompletedQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_repair_altar_03_04"))) then
		return convoTemplate:getScreen("init_fourth")
	elseif (QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_repair_altar_02_04")) or QuestManager.hasCompletedQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_repair_altar_02_04"))) then
		return convoTemplate:getScreen("init_third")
	elseif (QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_repair_altar_01_04")) or QuestManager.hasCompletedQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_repair_altar_01_04"))) then
		return convoTemplate:getScreen("init_second")
	end

	return convoTemplate:getScreen("initial")
end

function wod_sage_convo_handler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local pConvScreen = screen:cloneScreen()
	local clonedConversation = LuaConversationScreen(pConvScreen)
	local clan = readScreenPlayData(pPlayer, "witchesOfDathomir", "clanAlignment")
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return pConvScreen
	end

	if (screenID == "quest_start_first") then
		PlayerObject(pGhost):addWaypoint("dathomir", "@theme_park_wod/wod_" .. clan .. "_repair_altar_01:task01_waypoint_name", "", -1510, 1281, WAYPOINTYELLOW, true, true, 0)
		QuestManager.activateQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_repair_altar_01_01"))
	elseif (screenID == "quest_start_second") then
		PlayerObject(pGhost):addWaypoint("dathomir", "@theme_park_wod/wod_" .. clan .. "_repair_altar_02:task01_waypoint_name", "", 1455, 1387, WAYPOINTYELLOW, true, true, 0)
		QuestManager.activateQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_repair_altar_02_01"))
	elseif (screenID == "quest_start_third") then
		PlayerObject(pGhost):addWaypoint("dathomir", "@theme_park_wod/wod_" .. clan .. "_repair_altar_03:task01_waypoint_name", "", -6703, 3087, WAYPOINTYELLOW, true, true, 0)
		QuestManager.activateQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_repair_altar_03_01"))
	elseif (screenID == "quest_start_fourth") then
		PlayerObject(pGhost):addWaypoint("dathomir", "@theme_park_wod/wod_" .. clan .. "_repair_altar_04:task01_waypoint_name", "", 2774, 6466, WAYPOINTYELLOW, true, true, 0)
		QuestManager.activateQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_repair_altar_04_01"))
	end

	if (screenID == "init_second") then
		QuestManager.completeQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_repair_altar_01_04"))
		QuestManager.completeQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_repair_altar_01"))
		witchesOfDathomirScreenplay:handleReward(pPlayer, "repairAltar1")
	elseif (screenID == "init_third") then
		QuestManager.completeQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_repair_altar_02_04"))
		QuestManager.completeQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_repair_altar_02"))
		witchesOfDathomirScreenplay:handleReward(pPlayer, "repairAltar2")
	elseif (screenID == "init_fourth") then
		QuestManager.completeQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_repair_altar_03_04"))
		QuestManager.completeQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_repair_altar_03"))
		witchesOfDathomirScreenplay:handleReward(pPlayer, "repairAltar3")
	elseif (screenID == "init_fifth") then
		QuestManager.completeQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_repair_altar_04_04"))
		QuestManager.completeQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_repair_altar_04"))
		witchesOfDathomirScreenplay:handleReward(pPlayer, "repairAltar4")
		if (clan == "ns") then
			PlayerObject(pGhost):awardBadge(164)
		else
			PlayerObject(pGhost):awardBadge(157)
		end
	end

    return pConvScreen
end

function wod_sage_convo_handler:getSageType(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	local pScreen = convoTemplate:getScreen("sageType")
	local screen = LuaConversationScreen(pScreen)

	return screen:getOptionLink(0)
end
