wod_witch_herbs_convo_handler = conv_handler:new{}

local QuestManager = require("managers.quest.quest_manager")

function wod_witch_herbs_convo_handler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	local witchHerbsType = self:getWitchHerbsType(pPlayer, pNpc, pConvTemplate)
	local clan = readScreenPlayData(pPlayer, "witchesOfDathomir", "clanAlignment")
	
	if (clan == "" or clan == nil) then
		return convoTemplate:getScreen("not_elligible")
	elseif ((witchHerbsType == "wod_ns_witch_herbs" and clan == "sm") or (witchHerbsType == "wod_sm_witch_herbs" and clan == "ns")) then
		return convoTemplate:getScreen("wrong_alignment")
	end

	if (QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_herb_gathering")) and not QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_herb_gathering_08"))) then
		return convoTemplate:getScreen("quest_in_progress")
	end
	
	if (QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_herb_gathering_08"))) then
		return convoTemplate:getScreen("return_complete_quest")
	end
	
	return convoTemplate:getScreen("initial")
end

function wod_witch_herbs_convo_handler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local pConvScreen = screen:cloneScreen()
	local clonedConversation = LuaConversationScreen(pConvScreen)
	local clan = readScreenPlayData(pPlayer, "witchesOfDathomir", "clanAlignment")
	
	if (screenID == "quest_start" or screenID == "quest_start_alt") then
		if (QuestManager.hasCompletedQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_herb_gathering"))) then
			QuestManager.resetQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_herb_gathering"))
			QuestManager.resetQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_herb_gathering_01"))
			QuestManager.resetQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_herb_gathering_02"))
			QuestManager.resetQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_herb_gathering_03"))
			QuestManager.resetQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_herb_gathering_04"))
			QuestManager.resetQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_herb_gathering_05"))
			QuestManager.resetQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_herb_gathering_06"))
			QuestManager.resetQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_herb_gathering_07"))
			QuestManager.resetQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_herb_gathering_08"))
		end
		QuestManager.activateQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_herb_gathering"))
		QuestManager.activateQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_herb_gathering_01"))
	end
	
	if (screenID == "return_complete_quest") then
		QuestManager.completeQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_herb_gathering_08"))
		QuestManager.completeQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_herb_gathering"))
		witchesOfDathomirScreenplay:handleReward(pPlayer, "herbs")
		witchesOfDathomirScreenplay:addToCollection(pPlayer, "herbs" .. clan)
	end

    return pConvScreen
end

function wod_witch_herbs_convo_handler:getWitchFoodType(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	local pScreen = convoTemplate:getScreen("witchHerbsType")
	local screen = LuaConversationScreen(pScreen)

	return screen:getOptionLink(0)
end
