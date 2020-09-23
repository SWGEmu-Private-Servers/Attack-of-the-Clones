wod_rancor_tamer_ent_convo_handler = conv_handler:new{}

local QuestManager = require("managers.quest.quest_manager")

function wod_rancor_tamer_ent_convo_handler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	local rancorTamer = self:getRancorTamer(pPlayer, pNpc, pConvTemplate)
	local clan = readScreenPlayData(pPlayer, "witchesOfDathomir", "clanAlignment")
	
	if (clan == "" or clan == nil) then
		return convoTemplate:getScreen("not_elligible")
	elseif ((rancorTamer == "wod_ns_rancor_tamer_diax" and clan == "sm") or (rancorTamer == "wod_sm_rancor_tamer_zideera" and clan == "ns")) then
		return convoTemplate:getScreen("wrong_alignment")
	end

	if (QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_rancor_tamer_01")) or QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_rancor_tamer_02"))) then
		return convoTemplate:getScreen("quest_in_progress")
	end
	
	if (not CreatureObject(pPlayer):hasSkill("social_entertainer_novice")) then
		return convoTemplate:getScreen("not_entertainer")
	end
	
	if (QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_rancor_tamer_03")) or QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_rancor_tamer_04"))) then
		return convoTemplate:getScreen("return_init")
	end

	return convoTemplate:getScreen("initial")
end

function wod_rancor_tamer_ent_convo_handler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local pConvScreen = screen:cloneScreen()
	local clonedConversation = LuaConversationScreen(pConvScreen)
	local clan = readScreenPlayData(pPlayer, "witchesOfDathomir", "clanAlignment")
	
	if (screenID == "return_init") then
		if (QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_rancor_tamer_03"))) then
			QuestManager.completeQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_rancor_tamer_03"))
			witchesOfDathomirScreenplay:handleReward(pPlayer, "rancorTamer")
			witchesOfDathomirScreenplay:addToCollection(pPlayer, "enemiesSpiderclan" .. clan)
		else
			QuestManager.completeQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_rancor_tamer_04"))
		end
		QuestManager.completeQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_rancor_tamer"))
		local rancorID = readData("wodThemepark:rancorTamerRancorID:" .. SceneObject(pPlayer):getObjectID())
		if (rancorID ~= nil and rancorID ~= "") then
			deleteData("wodThemepark:rancorEntState:" .. rancorID)
			deleteData("wodThemepark:rancorEntTamed:" .. rancorID)
		end		
		deleteData("wodThemepark:rancorTamingActive:" .. SceneObject(pPlayer):getObjectID())
		deleteData("wodThemepark:rancorTamerRancorID:" .. SceneObject(pPlayer):getObjectID())
	end
	
	if (screenID == "quest_start") then
		if (QuestManager.hasCompletedQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_rancor_tamer"))) then
			QuestManager.resetQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_rancor_tamer"))
			QuestManager.resetQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_rancor_tamer_01"))
			QuestManager.resetQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_rancor_tamer_02"))
			QuestManager.resetQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_rancor_tamer_03"))
			QuestManager.resetQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_rancor_tamer_04"))
		end
		QuestManager.activateQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_rancor_tamer"))
		QuestManager.activateQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_rancor_tamer_01"))
		writeData("wodThemepark:rancorTamingActive:" .. SceneObject(pPlayer):getObjectID(), 1)
		createEvent(60 * 60 * 1000, "wodEnterTainerQuest", "failQuest", pPlayer, "")
		wodEntertainerQuest:beginQuest(pPlayer)
	end

    return pConvScreen
end

function wod_rancor_tamer_ent_convo_handler:getRancorTamer(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	local pScreen = convoTemplate:getScreen("rancorTamer")
	local screen = LuaConversationScreen(pScreen)

	return screen:getOptionLink(0)
end
