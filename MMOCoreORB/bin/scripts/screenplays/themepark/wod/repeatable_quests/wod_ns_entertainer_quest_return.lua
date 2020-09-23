local QuestManager = require("managers.quest.quest_manager")
require("utils.helpers")

wodEntNSReturnEscort = Escort:new {
	-- Task properties
	taskName = "wodEntNSReturnEscort",
	-- GoToLocation properties
	waypointDescription = "@theme_park_wod/wod_ns_rancor_tamer:task02_waypoint_name",
	returnPoint = {x = -4153, y = -96},
	returnPlanet = "dathomir",
	areaRadius = 16,
}

-- Event handler for the enter active area event.
-- The event will complete the task.
-- @param pPlayer pointer to the creature object of the player.
function wodEntNSReturnEscort:onEnteredActiveArea(pPlayer)
	QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_NS_RANCOR_TAMER_02)
	QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_NS_RANCOR_TAMER_03)
	dropObserver(STARTENTERTAIN, pPlayer)
	CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:rancor_returned_ns")
end

-- Event handler for the onSuccessfulSpawn.
-- The event will activate the quest.
-- @param pPlayer pointer to the creature object of the player.
function wodEntNSReturnEscort:onSuccessfulSpawn(pPlayer)
	if (pPlayer == nil) then
		return
	end

end

return wodEntNSReturnEscort
