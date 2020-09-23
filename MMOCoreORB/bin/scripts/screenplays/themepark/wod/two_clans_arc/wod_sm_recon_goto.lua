local QuestManager = require("managers.quest.quest_manager")
require("utils.helpers")

wodSMReconGoto = GoToLocation:new {
	-- Task properties
	taskName = "wodSMReconGoto",
	-- GoToLocation properties
	waypointDescription = "@theme_park_wod/wod_sm_recon:task01_waypoint_name",
	spawnPoint = {x = -6850, y = -4897},
	spawnPlanet = "dathomir",
	spawnRadius = 5,
}

-- Event handler for the enter active area event.
-- The event will complete the task.
-- @param pPlayer pointer to the creature object of the player.
function wodSMReconGoto:onEnteredActiveArea(pPlayer)
	if (pPlayer == nil) then
		return 1
	end

	QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_SM_RECON_01)
	QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_RECON_02)

	self:finish(pPlayer)
	return 1
end

-- Event handler for the onSuccessfulSpawn.
-- The event will activate the quest.
-- @param pPlayer pointer to the creature object of the player.
function wodSMReconGoto:onSuccessfulSpawn(pPlayer)
	if (pPlayer == nil) then
		return
	end

end

function wodSMReconGoto:onLoggedIn(pPlayer)
	if (self:hasTaskStarted(pPlayer)) then
		return 0
	end
	self:start(pPlayer)
	return 0
end

return wodSMReconGoto
