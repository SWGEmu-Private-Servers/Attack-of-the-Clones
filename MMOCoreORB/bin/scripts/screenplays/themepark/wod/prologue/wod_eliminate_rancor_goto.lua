local QuestManager = require("managers.quest.quest_manager")
require("utils.helpers")

wodEliminateRancorGoto = GoToLocation:new {
	-- Task properties
	taskName = "wodEliminateRancorGoto",
	-- GoToLocation properties
	waypointDescription = "@theme_park_wod/wod_prologue_kill_rancor:task01_waypoint_name",
	spawnPoint = {x = -5536, y = 3968},
	spawnPlanet = "dathomir",
	spawnRadius = 5,
}

-- Event handler for the enter active area event.
-- The event will complete the task.
-- @param pPlayer pointer to the creature object of the player.
function wodEliminateRancorGoto:onEnteredActiveArea(pPlayer)
	if (pPlayer == nil) then
		return 1
	end

	QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_RANCOR_01)
	QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_RANCOR_02)
	wodPrologueScreenplay:startEliminateQuest(pPlayer)
	self:finish(pPlayer)
	return 1
end

-- Event handler for the onSuccessfulSpawn.
-- The event will activate the quest.
-- @param pPlayer pointer to the creature object of the player.
function wodEliminateRancorGoto:onSuccessfulSpawn(pPlayer)
	if (pPlayer == nil) then
		return
	end

end

function wodEliminateRancorGoto:onLoggedIn(pPlayer)
	if (self:hasTaskStarted(pPlayer)) then
		return 0
	end
	self:start(pPlayer)
	return 0
end

return wodEliminateRancorGoto
