local QuestManager = require("managers.quest.quest_manager")
require("utils.helpers")

wodNSHerbsReturnGoto = GoToLocation:new {
	-- Task properties
	taskName = "wodNSHerbsReturnGoto",
	-- GoToLocation properties
	waypointDescription = "@theme_park_wod/wod_ns_herb_gathering:task07_waypoint_name",
	spawnPoint = {x = -4114, y = -151},
	spawnPlanet = "dathomir",
	spawnRadius = 5,
}

-- Event handler for the enter active area event.
-- The event will complete the task.
-- @param pPlayer pointer to the creature object of the player.
function wodNSHerbsReturnGoto:onEnteredActiveArea(pPlayer)
	if (pPlayer == nil) then
		return 1
	end

	self:finish(pPlayer)
	return 1
end

-- Event handler for the onSuccessfulSpawn.
-- The event will activate the quest.
-- @param pPlayer pointer to the creature object of the player.
function wodNSHerbsReturnGoto:onSuccessfulSpawn(pPlayer)
	if (pPlayer == nil) then
		return
	end

end

function wodNSHerbsReturnGoto:onLoggedIn(pPlayer)
	if (self:hasTaskStarted(pPlayer)) then
		return 0
	end
	self:start(pPlayer)
	return 0
end

return wodNSHerbsReturnGoto
