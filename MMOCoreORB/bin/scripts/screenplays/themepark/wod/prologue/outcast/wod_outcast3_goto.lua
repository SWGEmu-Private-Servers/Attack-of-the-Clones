local QuestManager = require("managers.quest.quest_manager")
require("utils.helpers")

wodOutcast3GoTo = GoToLocation:new {
	-- Task properties
	taskName = "wodOutcast3GoTo",
	-- GoToLocation properties
	waypointDescription = "@theme_park_wod/wod_outcast_3:task01_waypoint_name",
	spawnPoint = {x = -2597, y = 4952},
	spawnPlanet = "dathomir",
	spawnRadius = 16,
}

-- Event handler for the enter active area event.
-- The event will complete the task.
-- @param pPlayer pointer to the creature object of the player.
function wodOutcast3GoTo:onEnteredActiveArea(pPlayer)
	if (pPlayer == nil) then
		return 1
	end

	self:finish(pPlayer)
	return 1
end

-- Event handler for the onSuccessfulSpawn.
-- The event will activate the quest.
-- @param pPlayer pointer to the creature object of the player.
function wodOutcast3GoTo:onSuccessfulSpawn(pPlayer)
	if (pPlayer == nil) then
		return
	end
	
	QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_OUTCAST_3)
	QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_OUTCAST_3_01)
end

function wodOutcast3GoTo:onLoggedIn(pPlayer)
	if (self:hasTaskStarted(pPlayer)) then
		return 0
	end
	self:start(pPlayer)
	return 0
end

return wodOutcast3GoTo
