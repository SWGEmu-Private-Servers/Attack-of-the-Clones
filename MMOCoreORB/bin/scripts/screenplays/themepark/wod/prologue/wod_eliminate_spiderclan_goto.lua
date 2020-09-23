local QuestManager = require("managers.quest.quest_manager")
require("utils.helpers")

wodEliminateSpiderclanGoto = GoToLocation:new {
	-- Task properties
	taskName = "wodEliminateSpiderclanGoto",
	-- GoToLocation properties
	waypointDescription = "@theme_park_wod/wod_prologue_kill_spider_clan:task01_waypoint_name",
	spawnPoint = {x = -1887, y = 5723},
	spawnPlanet = "dathomir",
	spawnRadius = 5,
}

-- Event handler for the enter active area event.
-- The event will complete the task.
-- @param pPlayer pointer to the creature object of the player.
function wodEliminateSpiderclanGoto:onEnteredActiveArea(pPlayer)
	if (pPlayer == nil) then
		return 1
	end

	QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_SPIDER_CLAN_01)
	QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_SPIDER_CLAN_02)
	wodPrologueScreenplay:startEliminateQuest(pPlayer)
	self:finish(pPlayer)
	return 1
end

-- Event handler for the onSuccessfulSpawn.
-- The event will activate the quest.
-- @param pPlayer pointer to the creature object of the player.
function wodEliminateSpiderclanGoto:onSuccessfulSpawn(pPlayer)
	if (pPlayer == nil) then
		return
	end

end

function wodEliminateSpiderclanGoto:onLoggedIn(pPlayer)
	if (self:hasTaskStarted(pPlayer)) then
		return 0
	end
	self:start(pPlayer)
	return 0
end

return wodEliminateSpiderclanGoto
