local QuestManager = require("managers.quest.quest_manager")
require("utils.helpers")

wodOutcast1GoTo = GoToLocation:new {
	-- Task properties
	taskName = "wodOutcast1GoTo",
	-- GoToLocation properties
	waypointDescription = "@theme_park_wod/wod_outcast_1:task01_waypoint_name",
	spawnPoint = {x = 866, y = 1095},
	spawnPlanet = "dathomir",
	spawnRadius = 16,
}

-- Event handler for the enter active area event.
-- The event will complete the task.
-- @param pPlayer pointer to the creature object of the player.
function wodOutcast1GoTo:onEnteredActiveArea(pPlayer)
	if (pPlayer == nil) then
		return 1
	end

	self:finish(pPlayer)
	return 1
end

-- Event handler for the onSuccessfulSpawn.
-- The event will activate the quest.
-- @param pPlayer pointer to the creature object of the player.
function wodOutcast1GoTo:onSuccessfulSpawn(pPlayer)
	if (pPlayer == nil) then
		return
	end
	
	QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_OUTCAST_1)
	QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_OUTCAST_1_01)
end

function wodOutcast1GoTo:onLoggedIn(pPlayer)
	if (self:hasTaskStarted(pPlayer)) then
		return 0
	end
	self:start(pPlayer)
	return 0
end

return wodOutcast1GoTo
