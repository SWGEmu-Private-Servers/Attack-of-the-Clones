local QuestManager = require("managers.quest.quest_manager")
require("utils.helpers")

wodWalkabout7Goto = GoToLocation:new {
	-- Task properties
	taskName = "wodWalkabout7Goto",
	-- GoToLocation properties
	waypointDescription = "@theme_park_wod/wod_prologue_walkabout:task07_waypoint_name",
	spawnPoint = {x = -4128, y = 115},
	spawnPlanet = "dathomir",
	spawnRadius = 5,
}

-- Event handler for the enter active area event.
-- The event will complete the task.
-- @param pPlayer pointer to the creature object of the player.
function wodWalkabout7Goto:onEnteredActiveArea(pPlayer)
	if (pPlayer == nil) then
		return 1
	end

	self:finish(pPlayer)
	self:sendCommMessage(pPlayer)
	QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_WALKABOUT_07)
	QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_WALKABOUT_08)
	wodWalkabout8Goto:start(pPlayer)
	return 1
end

-- Event handler for the onSuccessfulSpawn.
-- The event will activate the quest.
-- @param pPlayer pointer to the creature object of the player.
function wodWalkabout7Goto:onSuccessfulSpawn(pPlayer)
	if (pPlayer == nil) then
		return
	end

end

function wodWalkabout7Goto:onLoggedIn(pPlayer)
	if (self:hasTaskStarted(pPlayer)) then
		return 0
	end
	self:start(pPlayer)
	return 0
end

function wodWalkabout7Goto:sendCommMessage(pPlayer)
	local sui = SuiMessageBox.new("wodWalkabout7Goto", "noCallBack")
	sui.setTitle("@theme_park_wod/wod_prologue_walkabout:comm_message_title_02")
	sui.setPrompt("@theme_park_wod/wod_prologue_walkabout:task07_comm_message_text_02")
	sui.hideCancelButton()
	sui.sendTo(pPlayer)
end

function wodWalkabout7Goto:noCallBack(pPlayer, pSui, eventIndex, ...)
end

return wodWalkabout7Goto
