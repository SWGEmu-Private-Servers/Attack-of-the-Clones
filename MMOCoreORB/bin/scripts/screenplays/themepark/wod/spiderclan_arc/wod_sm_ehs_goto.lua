local QuestManager = require("managers.quest.quest_manager")
require("utils.helpers")

wodSMEHSGoto = GoToLocation:new {
	-- Task properties
	taskName = "wodSMEHSGoto",
	-- GoToLocation properties
	waypointDescription = "@theme_park_wod/wod_sm_ehs:task01_waypoint_name",
	spawnPoint = {x = -190, y = 308},
	spawnPlanet = "dathomir",
	spawnRadius = 5,
}

-- Event handler for the enter active area event.
-- The event will complete the task.
-- @param pPlayer pointer to the creature object of the player.
function wodSMEHSGoto:onEnteredActiveArea(pPlayer)
	if (pPlayer == nil) then
		return 1
	end

	self:sendCommMessage(pPlayer)
	self:finish(pPlayer)
	QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_SM_EHS_01)
	QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_EHS_02)
	wodSpiderclanArc:startEliminateQuest(pPlayer)
	return 1
end

-- Event handler for the onSuccessfulSpawn.
-- The event will activate the quest.
-- @param pPlayer pointer to the creature object of the player.
function wodSMEHSGoto:onSuccessfulSpawn(pPlayer)
	if (pPlayer == nil) then
		return
	end

end

function wodSMEHSGoto:onLoggedIn(pPlayer)
	if (self:hasTaskStarted(pPlayer)) then
		return 0
	end
	self:start(pPlayer)
	return 0
end

function wodSMEHSGoto:sendCommMessage(pPlayer)
	if (pPlayer == nil) then
		return
	end

	local sui = SuiMessageBox.new("wodSMEHSGoto", "noCallback")
	sui.hideCancelButton()
	sui.setTitle("@theme_park_wod/wod_sm_ehs:comm_message_title")
	sui.setPrompt("@theme_park_wod/wod_sm_ehs:task01_comm_message_text")
	sui.sendTo(pPlayer)
end

function wodSMEHSGoto:noCallback(pPlayer, pSui, eventIndex, ...)
end

return wodSMEHSGoto
