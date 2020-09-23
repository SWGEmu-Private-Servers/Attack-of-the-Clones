local QuestManager = require("managers.quest.quest_manager")
require("utils.helpers")

wodOutcast4GoTo = GoToLocation:new {
	-- Task properties
	taskName = "wodOutcast4GoTo",
	-- GoToLocation properties
	waypointDescription = "@theme_park_wod/wod_outcast_4:task01_waypoint_name",
	spawnPoint = {x = 1482, y = 3515},
	spawnPlanet = "dathomir",
	spawnRadius = 16,
}

-- Event handler for the enter active area event.
-- The event will complete the task.
-- @param pPlayer pointer to the creature object of the player.
function wodOutcast4GoTo:onEnteredActiveArea(pPlayer)
	if (pPlayer == nil) then
		return 1
	end

	self:finish(pPlayer)
	return 1
end

-- Event handler for the onSuccessfulSpawn.
-- The event will activate the quest.
-- @param pPlayer pointer to the creature object of the player.
function wodOutcast4GoTo:onSuccessfulSpawn(pPlayer)
	if (pPlayer == nil) then
		return
	end
	
	QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_OUTCAST_4)
	QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_OUTCAST_4_01)
end

function wodOutcast4GoTo:onLoggedIn(pPlayer)
	if (self:hasTaskStarted(pPlayer)) then
		return 0
	end
	self:start(pPlayer)
	return 0
end

return wodOutcast4GoTo
