local QuestManager = require("managers.quest.quest_manager")
require("utils.helpers")

wodSister1Goto = GoToLocation:new {
	-- Task properties
	taskName = "wodSister1Goto",
	-- GoToLocation properties
	waypointDescription = "@theme_park_wod/wod_sister1:task01_waypoint_name",
	spawnPoint = {x = -5039, y = -2768},
	spawnPlanet = "dathomir",
	spawnRadius = 5,
}

-- Event handler for the enter active area event.
-- The event will complete the task.
-- @param pPlayer pointer to the creature object of the player.
function wodSister1Goto:onEnteredActiveArea(pPlayer)
	if (pPlayer == nil) then
		return 1
	end

	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_SISTER1_01)) then
		QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_NS_SISTER1_01)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_NS_SISTER1_02)
	else
		QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_SM_SISTER1_01)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_SISTER1_02)
	end

	wodTwoClansArc:startEliminateQuest(pPlayer)
	self:finish(pPlayer)
	return 1
end

-- Event handler for the onSuccessfulSpawn.
-- The event will activate the quest.
-- @param pPlayer pointer to the creature object of the player.
function wodSister1Goto:onSuccessfulSpawn(pPlayer)
	if (pPlayer == nil) then
		return
	end

end

function wodSister1Goto:onLoggedIn(pPlayer)
	if (self:hasTaskStarted(pPlayer)) then
		return 0
	end
	self:start(pPlayer)
	return 0
end

return wodSister1Goto
