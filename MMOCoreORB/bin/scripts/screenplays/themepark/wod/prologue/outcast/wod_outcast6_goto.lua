local QuestManager = require("managers.quest.quest_manager")
require("utils.helpers")

wodOutcast6GoTo = GoToLocation:new {
	-- Task properties
	taskName = "wodOutcast6GoTo",
	-- GoToLocation properties
	waypointDescription = "@theme_park_wod/wod_outcast_6:task01_waypoint_name",
	spawnPoint = {x = -856, y = 2788},
	spawnPlanet = "dathomir",
	spawnRadius = 16,
}

-- Event handler for the enter active area event.
-- The event will complete the task.
-- @param pPlayer pointer to the creature object of the player.
function wodOutcast6GoTo:onEnteredActiveArea(pPlayer)
	if (pPlayer == nil) then
		return 1
	end

	self:finish(pPlayer)
	return 1
end

-- Event handler for the onSuccessfulSpawn.
-- The event will activate the quest.
-- @param pPlayer pointer to the creature object of the player.
function wodOutcast6GoTo:onSuccessfulSpawn(pPlayer)
	if (pPlayer == nil) then
		return
	end
	
	QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_OUTCAST_6)
	QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_OUTCAST_6_01)
end

function wodOutcast6GoTo:onLoggedIn(pPlayer)
	if (self:hasTaskStarted(pPlayer)) then
		return 0
	end
	self:start(pPlayer)
	return 0
end

return wodOutcast6GoTo
