wod_kyrisa_convo_handler = conv_handler:new{}

local QuestManager = require("managers.quest.quest_manager")

function wod_kyrisa_convo_handler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	local clan = readScreenPlayData(pPlayer, "witchesOfDathomir", "clanAlignment")

	if (QuestManager.hasCompletedQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_kyrisa_boss_fight"))) then
		return convoTemplate:getScreen("quest_complete")
	end
	
	if (QuestManager.hasCompletedQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_whole_truth"))) then
		return convoTemplate:getScreen("greater_good_init")
	end
	
	if (QuestManager.hasActiveQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_whole_truth_05"))) then
		return convoTemplate:getScreen("initial")
	end
	
	return convoTemplate:getScreen("not_elligible")
end

function wod_kyrisa_convo_handler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local pConvScreen = screen:cloneScreen()
	local clonedConversation = LuaConversationScreen(pConvScreen)
	local clan = readScreenPlayData(pPlayer, "witchesOfDathomir", "clanAlignment")

	if (screenID == "complete_quest") then
		QuestManager.completeQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_whole_truth_05"))
		QuestManager.activateQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_whole_truth_06"))
		if (clan == "ns") then
			wodNSWholeTruth06Goto:start(pPlayer)
		else
			wodSMWholeTruth06Goto:start(pPlayer)
		end
	end

	if (screenID == "greater_good_start_quest") then
		if (readData("wodThemepark:kyrisaBossFight:active") == 1) then
			return convoTemplate:getScreen("busy")
		elseif (self:checkGroupStatus(pPlayer)) then
			QuestManager.completeQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_kyrisa_boss_fight_02"))
			QuestManager.activateQuest(pPlayer, getPlayerQuestID("wod_" .. clan .. "_kyrisa_boss_fight_03"))
			wodWholeTruthArc:startBossFight()
			writeData("wodThemepark:rancorBossFightOwnerID", SceneObject(pPlayer):getObjectID())
		else
			return convoTemplate:getScreen("not_in_group")
		end
	end

    return pConvScreen
end

function wod_kyrisa_convo_handler:checkGroupStatus(pPlayer)
	if (pPlayer == nil) then
		return false
	end
	
	if (CreatureObject(pPlayer):isGrouped()) then
		local groupSize = CreatureObject(pPlayer):getGroupSize()

		for i = 0, groupSize - 1, 1 do
			local pMember = CreatureObject(pPlayer):getGroupMember(i)
			if (pMember ~= nil and pMember ~= pPlayer and CreatureObject(pPlayer):isInRangeWithObject(pMember, 50) and not SceneObject(pMember):isAiAgent()) then
				return true
			end
		end
	end
	return false
end
