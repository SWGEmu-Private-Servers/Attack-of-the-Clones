local QuestManager = require("managers.quest.quest_manager")
require("utils.helpers")

wodNSEHSGoto = GoToLocation:new {
	-- Task properties
	taskName = "wodNSEHSGoto",
	-- GoToLocation properties
	waypointDescription = "@theme_park_wod/wod_ns_ehs:task01_waypoint_name",
	spawnPoint = {x = 308, y = -190},
	spawnPlanet = "dathomir",
	spawnRadius = 5,
}

-- Event handler for the enter active area event.
-- The event will complete the task.
-- @param pPlayer pointer to the creature object of the player.
function wodNSEHSGoto:onEnteredActiveArea(pPlayer)
	if (pPlayer == nil) then
		return 1
	end

	self:sendCommMessage(pPlayer)
	self:finish(pPlayer)
	QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_NS_EHS_01)
	QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_NS_EHS_02)
	wodSpiderclanArc:startEliminateQuest(pPlayer)
	return 1
end

-- Event handler for the onSuccessfulSpawn.
-- The event will activate the quest.
-- @param pPlayer pointer to the creature object of the player.
function wodNSEHSGoto:onSuccessfulSpawn(pPlayer)
	if (pPlayer == nil) then
		return
	end

end

function wodNSEHSGoto:onLoggedIn(pPlayer)
	if (self:hasTaskStarted(pPlayer)) then
		return 0
	end
	self:start(pPlayer)
	return 0
end

function wodNSEHSGoto:sendCommMessage(pPlayer)
	if (pPlayer == nil) then
		return
	end

	local sui = SuiMessageBox.new("wodNSEHSGoto", "noCallback")
	sui.hideCancelButton()
	sui.setTitle("@theme_park_wod/wod_ns_ehs:comm_message_title")
	sui.setPrompt("@theme_park_wod/wod_ns_ehs:task01_comm_message_text")
	sui.sendTo(pPlayer)
end

function wodNSEHSGoto:noCallback(pPlayer, pSui, eventIndex, ...)
end

return wodNSEHSGoto
