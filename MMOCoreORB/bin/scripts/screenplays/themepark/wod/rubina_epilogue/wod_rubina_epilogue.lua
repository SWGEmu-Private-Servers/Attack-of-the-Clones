wodRubinaEpilogue = ScreenPlay:new {

}

registerScreenPlay("wodRubinaEpilogue", true)

--TODO: Spawn mobile

local QuestManager = require("managers.quest.quest_manager")

function wodRubinaEpilogue:sendCommMessage(pPlayer)
	if (pPlayer == nil) then
		return
	end

	wodRubinaEpilogueGoto:start(pPlayer)

	local sui = SuiMessageBox.new("wodRubinaEpilogue", "noCallBack")
	sui.setTitle("@theme_park_wod/wod_rubina_chest:comm_message_title")
	sui.setPrompt("@theme_park_wod/wod_rubina_chest:comm_message_text")
	sui.hideCancelButton()
	sui.sendTo(pPlayer)
end

function wodRubinaEpilogue:noCallback(pPlayer, pSui, eventIndex, ...)
end

function wodRubinaEpilogue:startEncounter(pPlayer)
	if (pPlayer == nil) then
		return
	end

	CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod_left_behind:task02_start_message")
	--spawnMobile() wod_giant_whuffa_worm
end