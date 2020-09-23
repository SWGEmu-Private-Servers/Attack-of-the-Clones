local QuestManager = require("managers.quest.quest_manager")
require("utils.helpers")

wodNSQueenMotherGoto = GoToLocation:new {
	-- Task properties
	taskName = "wodNSQueenMotherGoto",
	-- GoToLocation properties
	waypointDescription = "@theme_park_wod/wod_ns_queen_mother_boss_fight:task01_waypoint_name",
	spawnPoint = {x = 323, y = -268},
	spawnPlanet = "dathomir",
	spawnRadius = 5,
}

-- Event handler for the enter active area event.
-- The event will complete the task.
-- @param pPlayer pointer to the creature object of the player.
function wodNSQueenMotherGoto:onEnteredActiveArea(pPlayer)
	if (pPlayer == nil) then
		return 1
	end
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	
	if (pGhost == nil) then
		return
	end
	
	self:finish(pPlayer)
	QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_NS_QUEEN_MOTHER_FIGHT_01)
	QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_NS_QUEEN_MOTHER_FIGHT_02)
	PlayerObject(pGhost):addWaypoint("dathomir", "@theme_park_wod/wod_ns_queen_mother_boss_fight:task02_waypoint_name", "", -137, 227, WAYPOINTYELLOW, true, true, 0)
	return 1
end

-- Event handler for the onSuccessfulSpawn.
-- The event will activate the quest.
-- @param pPlayer pointer to the creature object of the player.
function wodNSQueenMotherGoto:onSuccessfulSpawn(pPlayer)
	if (pPlayer == nil) then
		return
	end

end

function wodNSQueenMotherGoto:onLoggedIn(pPlayer)
	if (self:hasTaskStarted(pPlayer)) then
		return 0
	end
	self:start(pPlayer)
	return 0
end

return wodNSQueenMotherGoto
