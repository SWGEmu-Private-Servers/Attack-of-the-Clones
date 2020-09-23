local QuestManager = require("managers.quest.quest_manager")
require("utils.helpers")

wodWalkabout3Goto = GoToLocation:new {
	-- Task properties
	taskName = "wodWalkabout3Goto",
	-- GoToLocation properties
	waypointDescription = "@theme_park_wod/wod_prologue_walkabout:task03_waypoint_name",
	spawnPoint = {x = 5702, y = 1937},
	spawnPlanet = "dathomir",
	spawnRadius = 5,
}

-- Event handler for the enter active area event.
-- The event will complete the task.
-- @param pPlayer pointer to the creature object of the player.
function wodWalkabout3Goto:onEnteredActiveArea(pPlayer)
	if (pPlayer == nil) then
		return 1
	end

	self:finish(pPlayer)
	self:sendCommMessage(pPlayer)
	QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_WALKABOUT_03)
	QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_PROLOGUE_WALKABOUT_04)
	wodWalkabout4Goto:start(pPlayer)
	return 1
end

-- Event handler for the onSuccessfulSpawn.
-- The event will activate the quest.
-- @param pPlayer pointer to the creature object of the player.
function wodWalkabout3Goto:onSuccessfulSpawn(pPlayer)
	if (pPlayer == nil) then
		return
	end

end

function wodWalkabout3Goto:onLoggedIn(pPlayer)
	if (self:hasTaskStarted(pPlayer)) then
		return 0
	end
	self:start(pPlayer)
	return 0
end

function wodWalkabout3Goto:sendCommMessage(pPlayer)
	local sui = SuiMessageBox.new("wodWalkabout3Goto", "noCallBack")
	sui.setTitle("@theme_park_wod/wod_prologue_walkabout:comm_message_title_02")
	sui.setPrompt("@theme_park_wod/wod_prologue_walkabout:task03_comm_message_text_02")
	sui.hideCancelButton()
	sui.sendTo(pPlayer)
end

function wodWalkabout3Goto:noCallBack(pPlayer, pSui, eventIndex, ...)
end

return wodWalkabout3Goto
