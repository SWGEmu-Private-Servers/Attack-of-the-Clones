local QuestManager = require("managers.quest.quest_manager")
require("utils.helpers")

wodRubinaEpilogueGoto = GoToLocation:new {
	-- Task properties
	taskName = "wodRubinaEpilogueGoto",
	-- GoToLocation properties
	waypointDescription = "@theme_park_wod/wod_rubina_chest:waypoint_name",
	spawnPoint = {x = -3177, y = 3184},
	spawnPlanet = "dathomir",
	spawnRadius = 5,
}

-- Event handler for the enter active area event.
-- The event will complete the task.
-- @param pPlayer pointer to the creature object of the player.
function wodRubinaEpilogueGoto:onEnteredActiveArea(pPlayer)
	if (pPlayer == nil) then
		return 1
	end

	self:finish(pPlayer)
	return 1
end

-- Event handler for the onSuccessfulSpawn.
-- The event will activate the quest.
-- @param pPlayer pointer to the creature object of the player.
function wodRubinaEpilogueGoto:onSuccessfulSpawn(pPlayer)
	if (pPlayer == nil) then
		return
	end

	QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_RUBINA_CHEST)
end

function wodRubinaEpilogueGoto:onLoggedIn(pPlayer)
	if (self:hasTaskStarted(pPlayer)) then
		return 0
	end
	self:start(pPlayer)
	return 0
end

return wodRubinaEpilogueGoto
