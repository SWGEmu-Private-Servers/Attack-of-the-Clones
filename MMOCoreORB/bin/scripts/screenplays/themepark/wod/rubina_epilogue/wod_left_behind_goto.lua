local QuestManager = require("managers.quest.quest_manager")
require("utils.helpers")

wodLeftBehindGoto = GoToLocation:new {
	-- Task properties
	taskName = "wodLeftBehindGoto",
	-- GoToLocation properties
	waypointDescription = "@theme_park_wod/wod_left_behind:task01_waypoint_name",
	spawnPoint = {x = 5269, y = 165},
	spawnPlanet = "dathomir",
	spawnRadius = 5,
}

-- Event handler for the enter active area event.
-- The event will complete the task.
-- @param pPlayer pointer to the creature object of the player.
function wodLeftBehindGoto:onEnteredActiveArea(pPlayer)
	if (pPlayer == nil) then
		return 1
	end

	self:finish(pPlayer)
	QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_LEFT_BEHIND_01)
	QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_LEFT_BEHIND_02)
	return 1
end

-- Event handler for the onSuccessfulSpawn.
-- The event will activate the quest.
-- @param pPlayer pointer to the creature object of the player.
function wodLeftBehindGoto:onSuccessfulSpawn(pPlayer)
	if (pPlayer == nil) then
		return
	end

end

function wodLeftBehindGoto:onLoggedIn(pPlayer)
	if (self:hasTaskStarted(pPlayer)) then
		return 0
	end
	self:start(pPlayer)
	return 0
end

return wodLeftBehindGoto
