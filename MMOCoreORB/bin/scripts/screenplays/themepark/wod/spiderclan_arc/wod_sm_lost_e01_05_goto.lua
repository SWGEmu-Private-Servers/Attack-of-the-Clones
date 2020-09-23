local QuestManager = require("managers.quest.quest_manager")
require("utils.helpers")

wodSMLostE0105Goto = GoToLocation:new {
	-- Task properties
	taskName = "wodSMLostE0105Goto",
	-- GoToLocation properties
	waypointDescription = "@theme_park_wod/wod_sm_lost_e01:task05_waypoint_name",
	spawnPoint = {x = 149, y = 4500},
	spawnPlanet = "dathomir",
	spawnRadius = 5,
}

-- Event handler for the enter active area event.
-- The event will complete the task.
-- @param pPlayer pointer to the creature object of the player.
function wodSMLostE0105Goto:onEnteredActiveArea(pPlayer)
	if (pPlayer == nil) then
		return 1
	end

	self:finish(pPlayer)
	return 1
end

-- Event handler for the onSuccessfulSpawn.
-- The event will activate the quest.
-- @param pPlayer pointer to the creature object of the player.
function wodSMLostE0105Goto:onSuccessfulSpawn(pPlayer)
	if (pPlayer == nil) then
		return
	end

end

function wodSMLostE0105Goto:onLoggedIn(pPlayer)
	if (self:hasTaskStarted(pPlayer)) then
		return 0
	end
	self:start(pPlayer)
	return 0
end

return wodSMLostE0105Goto
