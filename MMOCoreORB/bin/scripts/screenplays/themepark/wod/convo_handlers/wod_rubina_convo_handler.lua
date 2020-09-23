wod_rubina_convo_handler = conv_handler:new{}

local QuestManager = require("managers.quest.quest_manager")

function wod_rubina_convo_handler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	local favor = wodPrologueScreenplay:getFavorStatus(pPlayer)
	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return
	end
	
	if (not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_MEET_MYSTERIOUS_WITCH) and not QuestManager.hasCompletedQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_MEET_MYSTERIOUS_WITCH)) then
		return convoTemplate:getScreen("not_elligible")
	end

	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_MEET_MYSTERIOUS_WITCH)) then
		return convoTemplate:getScreen("initial")
	end

	if (favor.count == 8) then
		if (favor.clan == "ns" and not (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_RUBINA_GOTO_NS) or QuestManager.hasCompletedQuest(pPlayer, QuestManager.quests.WOD_RUBINA_GOTO_NS))) then
			return convoTemplate:getScreen("ns_ready")
		elseif (favor.clan == "sm" and not (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_RUBINA_GOTO_SM) or QuestManager.hasCompletedQuest(pPlayer, QuestManager.quests.WOD_RUBINA_GOTO_SM))) then
			return convoTemplate:getScreen("sm_ready")
		end
	end

	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING_08)) then
		return convoTemplate:getScreen("return_herbs_sm")
	elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING_09)) then
		return convoTemplate:getScreen("return_herbs_ns")
	end

	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_RANCOR_05) or QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_SPIDER_CLAN_05)) then
		return convoTemplate:getScreen("return_eliminate_sm")
	elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_RANCOR_06) or QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_SPIDER_CLAN_06)) then
		return convoTemplate:getScreen("return_eliminate_ns")
	end

	for i = 1, 7 do
		if (QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_prologue_outcast_" .. i))) then
			if (QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_prologue_outcast_" .. i .. "_02"))) then
				return convoTemplate:getScreen("return_wisdom_ns")
			elseif (QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_prologue_outcast_" .. i .. "_03"))) then
				return convoTemplate:getScreen("return_wisdom_sm")
			end
		end
	end

	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_RUBINA_CHEST) and getContainerObjectByTemplate(pInventory, "object/tangible/theme_park/wod/wod_rubina_chest.iff", true)) then
		return convoTemplate:getScreen("cache_init")
	end

	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_RUBINA_LEFT_BEHIND_03) and getContainerObjectByTemplate(pInventory, "object/tangible/theme_park/wod/wod_crafting_alter_key.iff", true)) then
		return convoTemplate:getScreen("left_behind_return")
	elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_RUBINA_LEFT_BEHIND)) then
		return convoTemplate:getScreen("quest_in_progress")
	end

	return convoTemplate:getScreen("second_init")
end

function wod_rubina_convo_handler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
    local convoTemplate = LuaConversationTemplate(pConvTemplate)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local pConvScreen = screen:cloneScreen()
	local clonedConversation = LuaConversationScreen(pConvScreen)

	if (screenID == "complete_meet_witch") then
		QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_MEET_MYSTERIOUS_WITCH)
	end

	if (screenID == "task_herbs_start") then
		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING)) then
			return convoTemplate:getScreen("quest_in_progress")
		end
		if (QuestManager.hasCompletedQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING)) then
			QuestManager.resetQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING)
			QuestManager.resetQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING_01)
			QuestManager.resetQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING_02)
			QuestManager.resetQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING_03)
			QuestManager.resetQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING_04)
			QuestManager.resetQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING_05)
			QuestManager.resetQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING_06)
			QuestManager.resetQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING_07)
			QuestManager.resetQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING_08)
			QuestManager.resetQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING_09)
		end
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING_01)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING_02)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING_03)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING_04)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING_05)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING_06)
	end

	if (screenID == "return_herbs_complete_ns") then
		QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING)
		QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING_08)
		wodPrologueScreenplay:addToCollection(pPlayer, "herbsNS")
		wodPrologueScreenplay:addToFavor(pPlayer, "ns")
		wodPrologueScreenplay:handleReward(pPlayer, "herbs")
	elseif (screenID == "return_herbs_complete_sm") then
		QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING)
		QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_HERB_GATHERING_09)
		wodPrologueScreenplay:addToCollection(pPlayer, "herbsSM")
		wodPrologueScreenplay:addToFavor(pPlayer, "sm")
		wodPrologueScreenplay:handleReward(pPlayer, "herbs")
	end

	if (screenID == "task_enemies_start") then
		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_RANCOR) or QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_SPIDER_CLAN)) then
			return convoTemplate:getScreen("quest_in_progress")
		end
		local n = getRandomNumber(1, 2)
		if (n == 1) then
			if (QuestManager.hasCompletedQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_RANCOR)) then
				QuestManager.resetQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_RANCOR)
				QuestManager.resetQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_RANCOR_01)
				QuestManager.resetQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_RANCOR_02)
				QuestManager.resetQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_RANCOR_03)
				QuestManager.resetQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_RANCOR_04)
				QuestManager.resetQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_RANCOR_05)
			end
			QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_RANCOR)
			QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_RANCOR_01)
			wodEliminateRancorGoto:start(pPlayer)
		else
			if (QuestManager.hasCompletedQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_SPIDER_CLAN)) then
				QuestManager.resetQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_SPIDER_CLAN)
				QuestManager.resetQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_SPIDER_CLAN_01)
				QuestManager.resetQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_SPIDER_CLAN_02)
				QuestManager.resetQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_SPIDER_CLAN_03)
				QuestManager.resetQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_SPIDER_CLAN_04)
				QuestManager.resetQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_SPIDER_CLAN_05)
			end
			QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_SPIDER_CLAN)
			QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_SPIDER_CLAN_01)
			wodEliminateSpiderclanGoto:start(pPlayer)
		end
	end

	if (screenID == "return_eliminate_complete_ns") then
		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_RANCOR_05)) then
			QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_RANCOR)
			QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_RANCOR_05)
			wodPrologueScreenplay:addToCollection(pPlayer, "Rancor")
			wodPrologueScreenplay:handleReward(pPlayer, "enemiesRancor")
		elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_SPIDER_CLAN_05)) then
			QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_SPIDER_CLAN)
			QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_SPIDER_CLAN_05)
			wodPrologueScreenplay:addToCollection(pPlayer, "Spiderclan")
			wodPrologueScreenplay:handleReward(pPlayer, "enemiesSpiderclan")
		end
		wodPrologueScreenplay:addToFavor(pPlayer, "sm")
	elseif (screenID == "return_eliminate_complete_sm") then
		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_RANCOR_06)) then
			QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_RANCOR)
			QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_RANCOR_06)
			wodPrologueScreenplay:addToCollection(pPlayer, "Rancor")
			wodPrologueScreenplay:handleReward(pPlayer, "enemiesRancor")
		elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_SPIDER_CLAN_06)) then
			QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_SPIDER_CLAN)
			QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_SPIDER_CLAN_06)
			wodPrologueScreenplay:addToCollection(pPlayer, "Spiderclan")
			wodPrologueScreenplay:handleReward(pPlayer, "enemiesSpiderclan")
		end
		wodPrologueScreenplay:addToFavor(pPlayer, "ns")
	end

	if (screenID == "task_wisdom_start") then
		for i = 1, 7 do
			if (QuestManager.hasCompletedQuest(pPlayer, getPlayerQuestID("wod_prologue_outcast_" .. i))) then
				QuestManager.resetQuest(pPlayer, getPlayerQuestID("wod_prologue_outcast_" .. i))
				QuestManager.resetQuest(pPlayer, getPlayerQuestID("wod_prologue_outcast_" .. i .. "_01"))
				QuestManager.resetQuest(pPlayer, getPlayerQuestID("wod_prologue_outcast_" .. i .. "_02"))
				QuestManager.resetQuest(pPlayer, getPlayerQuestID("wod_prologue_outcast_" .. i .. "_03"))
				break
			end
			if (QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_prologue_outcast_" .. i))) then
				return convoTemplate:getScreen("quest_in_progress")
			end
			local questID = getPlayerQuestID("wod_prologue_outcast_" .. i)
		end
		local n = getRandomNumber(1, 7)
		if (n == 1) then
			wodOutcast1GoTo:start(pPlayer)
		elseif (n == 2) then
			wodOutcast2GoTo:start(pPlayer)
		elseif (n == 3) then
			wodOutcast3GoTo:start(pPlayer)
		elseif (n == 4) then
			wodOutcast4GoTo:start(pPlayer)
		elseif (n == 5) then
			wodOutcast5GoTo:start(pPlayer)
		elseif (n == 6) then
			wodOutcast6GoTo:start(pPlayer)
		else
			wodOutcast7GoTo:start(pPlayer)
		end
	end

	if (screenID == "return_eliminate_complete_ns") then
		wodPrologueScreenplay:addToCollection(pPlayer, "wisdomNS")
		wodPrologueScreenplay:addToFavor(pPlayer, "ns")
		wodPrologueScreenplay:handleReward(pPlayer, "wisdom")
		for i = 1, 7 do
			if (QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_prologue_outcast_" .. i .. "_03"))) then
				QuestManager.completeQuest(pPlayer, getPlayerQuestID("wod_prologue_outcast_" .. i))
				QuestManager.completeQuest(pPlayer, getPlayerQuestID("wod_prologue_outcast_" .. i .. "_03"))
				break
			end
		end
	elseif (screenID == "return_wisdom_complete_sm") then
		wodPrologueScreenplay:addToCollection(pPlayer, "wisdomSM")
		wodPrologueScreenplay:addToFavor(pPlayer, "sm")
		wodPrologueScreenplay:handleReward(pPlayer, "wisdom")
		for i = 1, 7 do
			if (QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_prologue_outcast_" .. i .. "_03"))) then
				QuestManager.completeQuest(pPlayer, getPlayerQuestID("wod_prologue_outcast_" .. i))
				QuestManager.completeQuest(pPlayer, getPlayerQuestID("wod_prologue_outcast_" .. i .. "_03"))
				break
			end
		end
	end

	if (screenID == "favor") then
		local favor = wodPrologueScreenplay:getFavorStatus(pPlayer)
		if (favor.count == 8) then
			if (favor.clan == "ns") then
				clonedConversation:setDialogTextStringId("@conversation/wod_rubina:s_156")
			elseif (favor.clan == "sm") then
				clonedConversation:setDialogTextStringId("@conversation/wod_rubina:s_202")
			end
		
		elseif (favor.count >= 5) then
			if (favor.clan == "ns") then
				clonedConversation:setDialogTextStringId("@conversation/wod_rubina:s_158")
			elseif (favor.clan == "sm") then
				clonedConversation:setDialogTextStringId("@conversation/wod_rubina:s_200")
			end
		elseif (favor.count >= 2) then
			if (favor.clan == "ns") then
				clonedConversation:setDialogTextStringId("@conversation/wod_rubina:s_164")
			elseif (favor.clan == "sm") then
				clonedConversation:setDialogTextStringId("@conversation/wod_rubina:s_198")
			end
		elseif (favor.count == 1) then
			clonedConversation:setDialogTextStringId("@conversation/wod_rubina:s_204")
		else
			clonedConversation:setDialogTextStringId("@conversation/wod_rubina:s_196")
		end
	end

	if (screenID == "ns_ready_go") then
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_RUBINA_GOTO_NS)
	end
	
	if (screenID == "ns_ready_waypoint") then
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_RUBINA_GOTO_NS)
		wodStrongholdNSGoto:start(pPlayer)
	end
	
	if (screenID == "sm_ready_go") then
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_RUBINA_GOTO_SM)
	end
	
	if (screenID == "sm_ready_waypoint") then
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_RUBINA_GOTO_SM)
		wodStrongholdSMGoto:start(pPlayer)
	end
	
	if (screenID == "left_behind_start") then
		QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_RUBINA_CHEST)
		wodLeftBehindGoto:start(pPlayer)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_LEFT_BEHIND)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_LEFT_BEHIND_01)
	end

	if (screenID == "left_behind_complete_quest") then
		local pItem = getContainerObjectByTemplate(pInventory, "object/tangible/theme_park/wod/wod_rubina_chest.iff", true)
		SceneObject(pItem):destroyObjectFromWorld()
		QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_LEFT_BEHIND_03)
		QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_LEFT_BEHIND)
		witchesOfDathomirScreenplay:handleReward(pPlayer, "leftBehind")
	end

    return pConvScreen
end
