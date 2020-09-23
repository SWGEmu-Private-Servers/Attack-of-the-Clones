wod_gethzerion_convo_handler = conv_handler:new{}

local QuestManager = require("managers.quest.quest_manager")

function wod_gethzerion_convo_handler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	local clan = readScreenPlayData(pPlayer, "witchesOfDathomir", "clanAlignment")

	if (clan == "" or clan == nil) then
		return convoTemplate:getScreen("not_elligible")
	elseif (clan == "sm") then
		return convoTemplate:getScreen("wrong_alignment")
	end

	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_KILL_SPIDERCLAN) or QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_KILL_CLAN) or QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_RECON)) then
		return convoTemplate:getScreen("quest_in_progress")
	end
	
	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_KILL_SPIDERCLAN_02)) then
		return convoTemplate:getScreen("spiderclan_return")
	elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_KILL_CLAN_02)) then
		return convoTemplate:getScreen("other_clan_return")
	elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_GHOST_REWARD)) then
		return convoTemplate:getScreen("two_clans_return")
	end
	
	if (QuestManager.hasCompletedQuest(pPlayer, QuestManager.quests.WOD_NS_RECON) and (not QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_RUBINA_CHEST) or QuestManager.hasCompletedQuest(pPlayer, QuestManager.quests.WOD_RUBINA_CHEST))) then
		return convoTemplate:getScreen("init_recon_complete")
	end
	
	return convoTemplate:getScreen("initial")
end

function wod_gethzerion_convo_handler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local pConvScreen = screen:cloneScreen()
	local clonedConversation = LuaConversationScreen(pConvScreen)
	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return
	end

	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return pConvScreen
	end

	if (screenID == "initial" or screenID == "init_alt") then
		if (QuestManager.hasCompletedQuest(pPlayer, QuestManager.quests.WOD_NS_RECON)) then
			clonedConversation:addOption("@conversation/wod_gethzerion:s_53", "other")
		end
	end

	if (screenID == "spiderclan_start") then
		if (QuestManager.hasCompletedQuest(pPlayer, QuestManager.quests.WOD_NS_KILL_SPIDERCLAN)) then
			QuestManager.resetQuest(pPlayer, QuestManager.quests.WOD_NS_KILL_SPIDERCLAN)
			QuestManager.resetQuest(pPlayer, QuestManager.quests.WOD_NS_KILL_SPIDERCLAN_01)
			QuestManager.resetQuest(pPlayer, QuestManager.quests.WOD_NS_KILL_SPIDERCLAN_02)
		end
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_NS_KILL_SPIDERCLAN)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_NS_KILL_SPIDERCLAN_01)
	end

	if (screenID == "other_clan_start") then
		if (QuestManager.hasCompletedQuest(pPlayer, QuestManager.quests.WOD_NS_KILL_CLAN)) then
			QuestManager.resetQuest(pPlayer, QuestManager.quests.WOD_NS_KILL_CLAN)
			QuestManager.resetQuest(pPlayer, QuestManager.quests.WOD_NS_KILL_CLAN_01)
			QuestManager.resetQuest(pPlayer, QuestManager.quests.WOD_NS_KILL_CLAN_02)
		end
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_NS_KILL_CLAN)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_NS_KILL_CLAN_01)
	end

	if (screenID == "two_clans_start") then
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_NS_RECON)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_NS_RECON_01)
	end
	
	if (screenID == "cache_start") then
		if (SceneObject(pInventory):isContainerFullRecursive()) then
			return convoTemplate:getScreen("initial")
		else
			giveItem(pInventory, "object/tangible/theme_park/wod/wod_rubina_chest.iff", -1)
			createEvent(5 * 1000, "wodRubinaEpilogue", "sendCommMessage", pPlayer, "")
		end
	end

	if (screenID == "spiderclan_return") then
		QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_NS_KILL_SPIDERCLAN_02)
		QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_NS_KILL_SPIDERCLAN)
		witchesOfDathomirScreenplay:handleReward(pPlayer, "enemiesSpiderclan")
		witchesOfDathomirScreenplay:addToCollection(pPlayer, "SpiderclanNS")
	end
	
	if (screenID == "other_clan_return") then
		QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_NS_KILL_CLAN_02)
		QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_NS_KILL_CLAN)
		witchesOfDathomirScreenplay:handleReward(pPlayer, "enemiesOtherclan")
		witchesOfDathomirScreenplay:addToCollection(pPlayer, "OtherclanNS")
	end

	if (screenID == "two_clans_return") then
		QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_NS_GHOST_REWARD)
		witchesOfDathomirScreenplay:handleReward(pPlayer, "ghostReward")
		if (not PlayerObject(pGhost):hasBadge(153)) then
			PlayerObject(pGhost):awardBadge(153)
		end
	end

    return pConvScreen
end
