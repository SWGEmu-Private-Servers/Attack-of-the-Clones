local QuestManager = require("managers.quest.quest_manager")
require("utils.helpers")

wodNSLostE0102Goto = GoToLocation:new {
	-- Task properties
	taskName = "wodNSLostE0102Goto",
	-- GoToLocation properties
	waypointDescription = "@theme_park_wod/wod_ns_lost_e01:task02_waypoint_name",
	spawnPoint = {x = -1316, y = 6163},
	spawnPlanet = "dathomir",
	spawnRadius = 5,
}

-- Event handler for the enter active area event.
-- The event will complete the task.
-- @param pPlayer pointer to the creature object of the player.
function wodNSLostE0102Goto:onEnteredActiveArea(pPlayer)
	if (pPlayer == nil) then
		return 1
	end
	
	QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_NS_LOST_E01_02)
	QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_NS_LOST_E01_03)
	self:finish(pPlayer)
	return 1
end

-- Event handler for the onSuccessfulSpawn.
-- The event will activate the quest.
-- @param pPlayer pointer to the creature object of the player.
function wodNSLostE0102Goto:onSuccessfulSpawn(pPlayer)
	if (pPlayer == nil) then
		return
	end

end

function wodNSLostE0102Goto:onLoggedIn(pPlayer)
	if (self:hasTaskStarted(pPlayer)) then
		return 0
	end
	self:start(pPlayer)
	return 0
end

return wodNSLostE0102Goto
