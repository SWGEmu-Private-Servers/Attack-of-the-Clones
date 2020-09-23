local QuestManager = require("managers.quest.quest_manager")
require("utils.helpers")

wodSMWholeTruth01Goto = GoToLocation:new {
	-- Task properties
	taskName = "wodSMWholeTruth01Goto",
	-- GoToLocation properties
	waypointDescription = "@theme_park_wod/wod_sm_whole_truth:task01_waypoint_name",
	spawnPoint = {x = -4227, y = -2089},
	spawnPlanet = "dathomir",
	spawnRadius = 5,
}

-- Event handler for the enter active area event.
-- The event will complete the task.
-- @param pPlayer pointer to the creature object of the player.
function wodSMWholeTruth01Goto:onEnteredActiveArea(pPlayer)
	if (pPlayer == nil) then
		return 1
	end

	self:finish(pPlayer)
	QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_SM_WHOLE_TRUTH_01)
	QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_WHOLE_TRUTH_02)
	wodWholeTruthArc:startEliminateQuest(pPlayer)
	return 1
end

-- Event handler for the onSuccessfulSpawn.
-- The event will activate the quest.
-- @param pPlayer pointer to the creature object of the player.
function wodSMWholeTruth01Goto:onSuccessfulSpawn(pPlayer)
	if (pPlayer == nil) then
		return
	end

end

function wodSMWholeTruth01Goto:onLoggedIn(pPlayer)
	if (self:hasTaskStarted(pPlayer)) then
		return 0
	end
	self:start(pPlayer)
	return 0
end

return wodSMWholeTruth01Goto
