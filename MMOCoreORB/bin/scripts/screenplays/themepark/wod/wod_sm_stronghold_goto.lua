local QuestManager = require("managers.quest.quest_manager")
require("utils.helpers")

--SM Mountain
wodStrongholdSMGoto = GoToLocation:new {
	-- Task properties
	taskName = "wodStrongholdSMGoto",
	-- GoToLocation properties
	waypointDescription = "@theme_park_wod/wod_rubina_goto_sm:waypoint_name",
	spawnPoint = {x = 150, y = 4495},
	spawnPlanet = "dathomir",
	spawnRadius = 5,
}

-- Event handler for the enter active area event.
-- The event will complete the task.
-- @param pPlayer pointer to the creature object of the player.
function wodStrongholdSMGoto:onEnteredActiveArea(pPlayer)
	if (pPlayer == nil) then
		return 1
	end

	self:finish(pPlayer)
	return 1
end

-- Event handler for the onSuccessfulSpawn.
-- The event will activate the quest.
-- @param pPlayer pointer to the creature object of the player.
function wodStrongholdSMGoto:onSuccessfulSpawn(pPlayer)
	if (pPlayer == nil) then
		return
	end
end

function wodStrongholdSMGoto:onLoggedIn(pPlayer)
	if (self:hasTaskStarted(pPlayer)) then
		return 0
	end
	self:start(pPlayer)
	return 0
end

return wodStrongholdSMGoto
