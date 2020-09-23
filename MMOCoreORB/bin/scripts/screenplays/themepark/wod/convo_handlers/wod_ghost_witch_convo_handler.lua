wod_ghost_witch_convo_handler = conv_handler:new{}

local QuestManager = require("managers.quest.quest_manager")

-- TODO: Start encounter

function wod_ghost_witch_convo_handler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	local clan = readScreenPlayData(pPlayer, "witchesOfDathomir", "clanAlignment")
	
	if (clan == "" or clan == nil) then
		return convoTemplate:getScreen("not_elligible")
	end
	
	if (QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_sister3"))) then
		return convoTemplate:getScreen("quest_completed")
	end
	
	if (QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_sister3")) and not QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_sister3_05"))) then
		return convoTemplate:getScreen("third_sister_in_progress")
	elseif (QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_sister2")) and not QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_sister2_05"))) then
		return convoTemplate:getScreen("second_sister_in_progress")
	elseif (QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_sister1")) and not QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_sister1_05"))) then
		return convoTemplate:getScreen("first_sister_in_progress")
	end
	
	if (QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_sister3_05"))) then
		return convoTemplate:getScreen("third_sister_return")
	elseif (QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_sister2_05"))) then
		return convoTemplate:getScreen("second_sister_return")
	elseif (QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_sister1_05"))) then
		return convoTemplate:getScreen("first_sister_return")
	elseif (QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_recon_02"))) then
		return convoTemplate:getScreen("initial")
	end
	
	return convoTemplate:getScreen("not_elligible")
end

function wod_ghost_witch_convo_handler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
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

	if (screenID == "quest_start") then
		QuestManager.completeQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_recon_02"))
		QuestManager.completeQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_recon"))
		QuestManager.activateQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_sister1"))
		QuestManager.activateQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_sister1_01"))
	end
	
	if (screenID == "first_sister_complete_quest") then
		QuestManager.completeQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_sister1_05"))
		QuestManager.completeQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_sister1"))
		witchesOfDathomirScreenplay:handleReward(pPlayer, "firstSister")
		if (not PlayerObject(pGhost):hasBadge(150)) then
			PlayerObject(pGhost):awardBadge(150)
		end
	end
	
	if (screenID == "second_sister_start") then
		QuestManager.activateQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_sister2"))
		QuestManager.activateQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_sister2_01"))
	end
	
	if (screenID == "second_sister_complete_quest") then
		QuestManager.completeQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_sister2_05"))
		QuestManager.completeQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_sister2"))
		witchesOfDathomirScreenplay:handleReward(pPlayer, "secondSister")
		if (not PlayerObject(pGhost):hasBadge(151)) then
			PlayerObject(pGhost):awardBadge(151)
		end
	end
	
	if (screenID == "third_sister_start") then
		QuestManager.activateQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_sister2"))
		QuestManager.activateQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_sister2_01"))
	end
	
	if (screenID == "third_sister_complete_quest") then
		if (clan == "ns") then 
			clonedConversation:setDialogTextStringId("@conversation/wod_ghost_witch:s_40")
		else
			clonedConversation:setDialogTextStringId("@conversation/wod_ghost_witch:s_97")
		end
		QuestManager.completeQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_sister3_05"))
		QuestManager.completeQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_sister3"))
		QuestManager.activateQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_ghost_reward"))
		witchesOfDathomirScreenplay:handleReward(pPlayer, "thirdSister")
		if (not PlayerObject(pGhost):hasBadge(152)) then
			PlayerObject(pGhost):awardBadge(152)
		end
	end

    return pConvScreen
end
