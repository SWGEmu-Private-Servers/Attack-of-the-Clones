local QuestManager = require("managers.quest.quest_manager")
require("utils.helpers")

wodWalkabout1Goto = GoToLocation:new {
	-- Task properties
	taskName = "wodWalkabout1Goto",
	-- GoToLocation properties
	waypointDescription = "@theme_park_wod/wod_prologue_walkabout:task01_waypoint_name",
	spawnPoint = {x = 3055, y = 1366},
	spawnPlanet = "dathomir",
	spawnRadius = 5,
}

-- Event handler for the enter active area event.
-- The event will complete the task.
-- @param pPlayer pointer to the creature object of the player.
function wodWalkabout1Goto:onEnteredActiveArea(pPlayer)
	if (pPlayer == nil) then
		return 1
	end

	self:finish(pPlayer)
	self:sendCommMessage1(pPlayer)
	QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_WALKABOUT_01)
	QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_WALKABOUT_02)
	wodWalkabout2Goto:start(pPlayer)
	return 1
end

-- Event handler for the onSuccessfulSpawn.
-- The event will activate the quest.
-- @param pPlayer pointer to the creature object of the player.
function wodWalkabout1Goto:onSuccessfulSpawn(pPlayer)
	if (pPlayer == nil) then
		return
	end

end

function wodWalkabout1Goto:onLoggedIn(pPlayer)
	if (self:hasTaskStarted(pPlayer)) then
		return 0
	end
	self:start(pPlayer)
	return 0
end

function wodWalkabout1Goto:sendCommMessage1(pPlayer)
	local sui = SuiMessageBox.new("wodWalkabout1Goto", "defaultCallBack")
	sui.setTitle("@theme_park_wod/wod_prologue_walkabout:comm_message_title_01")
	sui.setPrompt("@theme_park_wod/wod_prologue_walkabout:task01_comm_message_text_01")
	sui.hideCancelButton()
	sui.sendTo(pPlayer)
end

function wodWalkabout1Goto:defaultCallBack(pPlayer, pSui, eventIndex, ...)
	createEvent(10 * 1000, "wodWalkabout1Goto", "sendCommMessage2", pPlayer, "")
end

function wodWalkabout1Goto:sendCommMessage2(pPlayer)
	local sui = SuiMessageBox.new("wodWalkabout1Goto", "noCallBack")
	sui.setTitle("@theme_park_wod/wod_prologue_walkabout:comm_message_title_02")
	sui.setPrompt("@theme_park_wod/wod_prologue_walkabout:task01_comm_message_text_02")
	sui.hideCancelButton()
	sui.sendTo(pPlayer)
end

function wodWalkabout1Goto:noCallBack(pPlayer, pSui, eventIndex, ...)
end

return wodWalkabout1Goto
