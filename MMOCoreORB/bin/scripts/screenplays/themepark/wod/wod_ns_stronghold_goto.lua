local QuestManager = require("managers.quest.quest_manager")
require("utils.helpers")

--NS Stronghold
wodStrongholdNSGoto = GoToLocation:new {
	-- Task properties
	taskName = "wodStrongholdNSGoto",
	-- GoToLocation properties
	waypointDescription = "@theme_park_wod/wod_rubina_goto_ns:waypoint_name",
	spawnPoint = {x = -4085, y = -137},
	spawnPlanet = "dathomir",
	spawnRadius = 5,
}

-- Event handler for the enter active area event.
-- The event will complete the task.
-- @param pPlayer pointer to the creature object of the player.
function wodStrongholdNSGoto:onEnteredActiveArea(pPlayer)
	if (pPlayer == nil) then
		return 1
	end

	self:finish(pPlayer)
	return 1
end

-- Event handler for the onSuccessfulSpawn.
-- The event will activate the quest.
-- @param pPlayer pointer to the creature object of the player.
function wodStrongholdNSGoto:onSuccessfulSpawn(pPlayer)
	if (pPlayer == nil) then
		return
	end
end

function wodStrongholdNSGoto:onLoggedIn(pPlayer)
	if (self:hasTaskStarted(pPlayer)) then
		return 0
	end
	self:start(pPlayer)
	return 0
end

return wodStrongholdNSGoto
