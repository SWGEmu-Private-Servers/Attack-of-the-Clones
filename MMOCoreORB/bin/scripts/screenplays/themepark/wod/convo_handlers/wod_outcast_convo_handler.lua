wod_outcast_convo_handler = conv_handler:new{}

local QuestManager = require("managers.quest.quest_manager")

function wod_outcast_convo_handler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	local outcast = self:getOutcast(pPlayer, pNpc, pConvTemplate)

	if (QuestManager.hasCompletedQuest(pPlayer, getPlayerQuestID(outcast .. "_01"))) then
		return convoTemplate:getScreen("supported_clan")
	end

	if (QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID(outcast))) then
		return convoTemplate:getScreen("initial")
	end

	return convoTemplate:getScreen("not_elligible")
end

function wod_outcast_convo_handler:getNextConversationScreen(pConvTemplate, pPlayer, selectedOption, pNpc)
	local convoSession = CreatureObject(pPlayer):getConversationSession()
	lastConversation = nil
	local conversation = LuaConversationTemplate(pConvTemplate)
	local nextConversationScreen
	if (conversation ~= nil) then
		if (convoSession ~= nil) then
			local session = LuaConversationSession(convoSession)
			if (session ~= nil) then
				lastConversationScreen = session:getLastConversationScreen()
			end
		end
		if (lastConversationScreen == nil) then
			nextConversationScreen = conversation:getInitialScreen()
		else
			local luaLastConvScreen = LuaConversationScreen(lastConversationScreen)
			local optionLink = luaLastConvScreen:getOptionLink(selectedOption)

			if (optionLink == "dilemma_one_sm") then
				self:addSMPoint(pPlayer)
				nextConversationScreen = conversation:getScreen("dilemma_two")
			elseif (optionLink == "dilemma_one_ns") then
				self:addNSPoint(pPlayer)
				nextConversationScreen = conversation:getScreen("dilemma_two")
			elseif (optionLink == "dilemma_two_sm") then
				self:addSMPoint(pPlayer)
				nextConversationScreen = conversation:getScreen("dilemma_three")
			elseif (optionLink == "dilemma_two_ns") then
				self:addNSPoint(pPlayer)
				nextConversationScreen = conversation:getScreen("dilemma_three")
			elseif (optionLink == "dilemma_three_sm") then
				self:addSMPoint(pPlayer)
				nextConversationScreen = conversation:getScreen("supported_clan")
			elseif (optionLink == "dilemma_three_ns") then
				self:addNSPoint(pPlayer)
				nextConversationScreen = conversation:getScreen("supported_clan")
			else
				nextConversationScreen = conversation:getScreen(optionLink)
			end
		end
	end
	return nextConversationScreen
end

function wod_outcast_convo_handler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local pConvScreen = screen:cloneScreen()
	local clonedScreen = LuaConversationScreen(pConvScreen)
	local outcast = self:getOutcast(pPlayer, pNpc, pConvTemplate)

	if (screenID == "initial") then
		deleteScreenPlayData(pPlayer, "wodThemepark:prologue", "outcastSM")
		deleteScreenPlayData(pPlayer, "wodThemepark:prologue", "outcastNS")
	end

	local supportedClan = self:getClanAlignment(pPlayer)
	if (screenID == "supported_clan_confirm") then
		if (supportedClan == "ns") then
			clonedScreen:setDialogTextStringId("@conversation/" .. outcast .. ":s_110")
			clonedScreen:addOption("@conversation/" .. outcast .. ":s_112", "end_screen")
		elseif (supportedClan == "sm") then
			clonedScreen:setDialogTextStringId("@conversation/" .. outcast .. ":s_104")
			clonedScreen:addOption("@conversation/" .. outcast .. ":s_106", "end_screen")
		end
	end

	if (screenID == "end_screen") then
		QuestManager.completeQuest(pPlayer, getPlayerQuestID(outcast .. "_01"))
		if (supportedClan == "ns") then
			QuestManager.activateQuest(pPlayer, getPlayerQuestID(outcast .. "_02"))
			clonedScreen:setDialogTextStringId("@conversation/" .. outcast .. ":s_114")
		elseif (supportedClan == "sm") then
			QuestManager.activateQuest(pPlayer, getPlayerQuestID(outcast .. "_03"))
			clonedScreen:setDialogTextStringId("@conversation/" .. outcast .. ":s_108")
		end
		wodRubinaReturnGoto:start(pPlayer)
	end

    return pConvScreen
end

function wod_outcast_convo_handler:getOutcast(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	local pScreen = convoTemplate:getScreen("outcast")
	local screen = LuaConversationScreen(pScreen)

	return screen:getOptionLink(0)
end

function wod_outcast_convo_handler:addNSPoint(pPlayer)
	local curPoints = tonumber(readScreenPlayData(pPlayer, "wodThemepark:prologue", "outcastNS"))

	if (curPoints == nil) then
		curPoints = 0
	end

	writeScreenPlayData(pPlayer, "wodThemepark:prologue", "outcastNS", curPoints + 1)
end

function wod_outcast_convo_handler:addSMPoint(pPlayer)
	local curPoints = tonumber(readScreenPlayData(pPlayer, "wodThemepark:prologue", "outcastSM"))

	if (curPoints == nil) then
		curPoints = 0
	end

	writeScreenPlayData(pPlayer, "wodThemepark:prologue", "outcastSM", curPoints + 1)
end

function wod_outcast_convo_handler:getClanAlignment(pPlayer)
	local NSPoints = tonumber(readScreenPlayData(pPlayer, "wodThemepark:prologue", "outcastNS"))
	
	if (NSPoints == nil) then
		NSPoints = 0
	end

	local SMPoints = tonumber(readScreenPlayData(pPlayer, "wodThemepark:prologue", "outcastSM"))

	if (SMPoints == nil) then
		SMPoints = 0
	end

	if (NSPoints > SMPoints) then
		return "ns"
	else
		return "sm"
	end
end
