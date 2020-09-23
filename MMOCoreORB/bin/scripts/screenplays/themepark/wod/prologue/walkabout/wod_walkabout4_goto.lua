local QuestManager = require("managers.quest.quest_manager")
require("utils.helpers")

wodWalkabout4Goto = GoToLocation:new {
	-- Task properties
	taskName = "wodWalkabout4Goto",
	-- GoToLocation properties
	waypointDescription = "@theme_park_wod/wod_prologue_walkabout:task04_waypoint_name",
	spawnPoint = {x = 558, y = 3073},
	spawnPlanet = "dathomir",
	spawnRadius = 5,
}

-- Event handler for the enter active area event.
-- The event will complete the task.
-- @param pPlayer pointer to the creature object of the player.
function wodWalkabout4Goto:onEnteredActiveArea(pPlayer)
	if (pPlayer == nil) then
		return 1
	end
	
	self:finish(pPlayer)
	return 1
end

-- Event handler for the onSuccessfulSpawn.
-- The event will activate the quest.
-- @param pPlayer pointer to the creature object of the player.
function wodWalkabout4Goto:onSuccessfulSpawn(pPlayer)
	if (pPlayer == nil) then
		return
	end

end

function wodWalkabout4Goto:onLoggedIn(pPlayer)
	if (self:hasTaskStarted(pPlayer)) then
		return 0
	end
	self:start(pPlayer)
	return 0
end

return wodWalkabout4Goto
