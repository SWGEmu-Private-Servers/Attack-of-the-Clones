local QuestManager = require("managers.quest.quest_manager")
require("utils.helpers")

wodSMEHSReturnGoto = GoToLocation:new {
	-- Task properties
	taskName = "wodSMEHSReturnGoto",
	-- GoToLocation properties
	waypointDescription = "@theme_park_wod/wod_sm_ehs:task04_waypoint_name",
	spawnPoint = {x = 149, y = 4500},
	spawnPlanet = "dathomir",
	spawnRadius = 5,
}

-- Event handler for the enter active area event.
-- The event will complete the task.
-- @param pPlayer pointer to the creature object of the player.
function wodSMEHSReturnGoto:onEnteredActiveArea(pPlayer)
	if (pPlayer == nil) then
		return 1
	end

	self:finish(pPlayer)
	return 1
end

-- Event handler for the onSuccessfulSpawn.
-- The event will activate the quest.
-- @param pPlayer pointer to the creature object of the player.
function wodSMEHSReturnGoto:onSuccessfulSpawn(pPlayer)
	if (pPlayer == nil) then
		return
	end

end

function wodSMEHSReturnGoto:onLoggedIn(pPlayer)
	if (self:hasTaskStarted(pPlayer)) then
		return 0
	end
	self:start(pPlayer)
	return 0
end

return wodSMEHSReturnGoto
