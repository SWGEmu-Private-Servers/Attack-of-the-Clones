local QuestManager = require("managers.quest.quest_manager")
require("utils.helpers")

wodEliminateReturnGoto = GoToLocation:new {
	-- Task properties
	taskName = "wodEliminateReturnGoto",
	-- GoToLocation properties
	waypointDescription = "@theme_park_wod/messages:rubina_return_waypoint_name",
	spawnPoint = {x = -3177, y = 3184},
	spawnPlanet = "dathomir",
	spawnRadius = 5,
}

-- Event handler for the enter active area event.
-- The event will complete the task.
-- @param pPlayer pointer to the creature object of the player.
function wodEliminateReturnGoto:onEnteredActiveArea(pPlayer)
	if (pPlayer == nil) then
		return 1
	end
	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_RANCOR)) then
		QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_RANCOR_03)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_RANCOR_04)
	else
		QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_SPIDER_CLAN_03)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_KILL_SPIDER_CLAN_04)
	end
	self:finish(pPlayer)
	return 1
end

-- Event handler for the onSuccessfulSpawn.
-- The event will activate the quest.
-- @param pPlayer pointer to the creature object of the player.
function wodEliminateReturnGoto:onSuccessfulSpawn(pPlayer)
	if (pPlayer == nil) then
		return
	end

end

function wodEliminateReturnGoto:onLoggedIn(pPlayer)
	if (self:hasTaskStarted(pPlayer)) then
		return 0
	end
	self:start(pPlayer)
	return 0
end

return wodEliminateReturnGoto
