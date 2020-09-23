local QuestManager = require("managers.quest.quest_manager")
require("utils.helpers")

wodNSWholeTruth06Goto = GoToLocation:new {
	-- Task properties
	taskName = "wodNSWholeTruth06Goto",
	-- GoToLocation properties
	waypointDescription = "@theme_park_wod/wod_ns_whole_truth:task04_waypoint_name",
	spawnPoint = {x = -4119, y = -155},
	spawnPlanet = "dathomir",
	spawnRadius = 5,
}

-- Event handler for the enter active area event.
-- The event will complete the task.
-- @param pPlayer pointer to the creature object of the player.
function wodNSWholeTruth06Goto:onEnteredActiveArea(pPlayer)
	if (pPlayer == nil) then
		return 1
	end

	self:finish(pPlayer)
	return 1
end

-- Event handler for the onSuccessfulSpawn.
-- The event will activate the quest.
-- @param pPlayer pointer to the creature object of the player.
function wodNSWholeTruth06Goto:onSuccessfulSpawn(pPlayer)
	if (pPlayer == nil) then
		return
	end

end

function wodNSWholeTruth06Goto:onLoggedIn(pPlayer)
	if (self:hasTaskStarted(pPlayer)) then
		return 0
	end
	self:start(pPlayer)
	return 0
end

return wodNSWholeTruth06Goto
