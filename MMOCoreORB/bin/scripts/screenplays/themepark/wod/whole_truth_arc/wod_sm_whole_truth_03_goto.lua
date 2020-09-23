local QuestManager = require("managers.quest.quest_manager")
require("utils.helpers")

wodSMWholeTruth03Goto = GoToLocation:new {
	-- Task properties
	taskName = "wodSMWholeTruth03Goto",
	-- GoToLocation properties
	waypointDescription = "@theme_park_wod/wod_sm_whole_truth:task03_waypoint_name",
	spawnPoint = {x = 151, y = 4482},
	spawnPlanet = "dathomir",
	spawnRadius = 5,
}

-- Event handler for the enter active area event.
-- The event will complete the task.
-- @param pPlayer pointer to the creature object of the player.
function wodSMWholeTruth03Goto:onEnteredActiveArea(pPlayer)
	if (pPlayer == nil) then
		return 1
	end

	self:finish(pPlayer)
	return 1
end

-- Event handler for the onSuccessfulSpawn.
-- The event will activate the quest.
-- @param pPlayer pointer to the creature object of the player.
function wodSMWholeTruth03Goto:onSuccessfulSpawn(pPlayer)
	if (pPlayer == nil) then
		return
	end

end

function wodSMWholeTruth03Goto:onLoggedIn(pPlayer)
	if (self:hasTaskStarted(pPlayer)) then
		return 0
	end
	self:start(pPlayer)
	return 0
end

return wodSMWholeTruth03Goto
