local QuestManager = require("managers.quest.quest_manager")
require("utils.helpers")

wodSister2ReturnGoto = GoToLocation:new {
	-- Task properties
	taskName = "wodSister2ReturnGoto",
	-- GoToLocation properties
	waypointDescription = "@theme_park_wod/wod_sister2:task08_waypoint_name",
	spawnPoint = {x = -6895, y = -4853},
	spawnPlanet = "dathomir",
	spawnRadius = 5,
}

-- Event handler for the enter active area event.
-- The event will complete the task.
-- @param pPlayer pointer to the creature object of the player.
function wodSister2ReturnGoto:onEnteredActiveArea(pPlayer)
	if (pPlayer == nil) then
		return 1
	end

	self:finish(pPlayer)
	return 1
end

-- Event handler for the onSuccessfulSpawn.
-- The event will activate the quest.
-- @param pPlayer pointer to the creature object of the player.
function wodSister2ReturnGoto:onSuccessfulSpawn(pPlayer)
	if (pPlayer == nil) then
		return
	end

end

function wodSister2ReturnGoto:onLoggedIn(pPlayer)
	if (self:hasTaskStarted(pPlayer)) then
		return 0
	end
	self:start(pPlayer)
	return 0
end

return wodSister2ReturnGoto
