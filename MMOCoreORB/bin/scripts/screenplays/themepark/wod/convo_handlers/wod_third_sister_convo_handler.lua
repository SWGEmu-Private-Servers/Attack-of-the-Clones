wod_third_sister_convo_handler = conv_handler:new{}

local QuestManager = require("managers.quest.quest_manager")

-- TODO: Start encounter

function wod_third_sister_convo_handler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	local clan = readScreenPlayData(pPlayer, "witchesOfDathomir", "clanAlignment")
	
	if (clan == "" or clan == nil) then
		return convoTemplate:getScreen("not_elligible")
	end
	
	if (QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_sister3_04"))) then
		return convoTemplate:getScreen("initial")
	end
	
	return convoTemplate:getScreen("not_elligible")
end

function wod_third_sister_convo_handler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local pConvScreen = screen:cloneScreen()

	if (screenID == "start_fight") then
		writeData("wodThemepark:thirdSisterOwnerID", SceneObject(pPlayer):getObjectID())
		wodTwoClansArc:startThirdSisterEncounter(pNpc)
	end

    return pConvScreen
end
