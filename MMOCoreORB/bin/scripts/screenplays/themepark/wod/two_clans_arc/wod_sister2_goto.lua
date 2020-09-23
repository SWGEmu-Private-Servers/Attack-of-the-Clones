local QuestManager = require("managers.quest.quest_manager")
require("utils.helpers")

wodSister2Goto = GoToLocation:new {
	-- Task properties
	taskName = "wodSister2Goto",
	-- GoToLocation properties
	waypointDescription = "@theme_park_wod/wod_sister2:task01_waypoint_name",
	spawnPoint = {x = -3572, y = -6017},
	spawnPlanet = "dathomir",
	spawnRadius = 5,
}

-- Event handler for the enter active area event.
-- The event will complete the task.
-- @param pPlayer pointer to the creature object of the player.
function wodSister2Goto:onEnteredActiveArea(pPlayer)
	if (pPlayer == nil) then
		return 1
	end

	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_SISTER2_01)) then
		QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_NS_SISTER2_01)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_NS_SISTER2_02)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_NS_SISTER2_03)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_NS_SISTER2_04)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_NS_SISTER2_05)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_NS_SISTER2_06)
	else
		QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_SM_SISTER2_01)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_SISTER2_02)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_SISTER2_03)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_SISTER2_04)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_SISTER2_05)
		QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_SISTER2_06)
	end

	self:finish(pPlayer)
	return 1
end

-- Event handler for the onSuccessfulSpawn.
-- The event will activate the quest.
-- @param pPlayer pointer to the creature object of the player.
function wodSister2Goto:onSuccessfulSpawn(pPlayer)
	if (pPlayer == nil) then
		return
	end

end

function wodSister2Goto:onLoggedIn(pPlayer)
	if (self:hasTaskStarted(pPlayer)) then
		return 0
	end
	self:start(pPlayer)
	return 0
end

return wodSister2Goto
