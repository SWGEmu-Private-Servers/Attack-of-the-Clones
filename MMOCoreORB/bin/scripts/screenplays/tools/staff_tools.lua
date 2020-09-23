-- Original code by SWGEmu.

StaffTools = {
	toolsMenu = {
		{ "Jedi Progress", "snoopJedi" },
		{ "Jedi Reset", "resetJedi" },
		{ "Lookup CRC", "lookupCRC" },
		--{ "Place Test Vendor", "placeVendor" },
		{ "Troubleshoot Holocron Trials", "holocronTroubleshoot" },
		{ "Fix Jedi", "fixJedi" },
		{ "Start Nightsister Shapeshifter", "startNSWB" },
		{ "End NS Shapeshifter", "endNSWB" },
		{ "Test WOD convo", "testWODConvo" },
	}
}

function StaffTools:openToolsSUI(pCreature)
	if (pCreature == nil) then
		return
	end

	self:openSUI(pCreature)
end

function StaffTools:openSUI(pCreature)
	local sui = SuiListBox.new("StaffTools", "mainSuiCallback")

	sui.setTargetNetworkId(SceneObject(pCreature):getObjectID())

	sui.setTitle("Staff Tools")
	sui.setPrompt("Select a tool below to open it.")

	for i = 1, #self.toolsMenu, 1 do
		sui.add(self.toolsMenu[i][1], "")
	end

	sui.sendTo(pCreature)
end

function StaffTools:mainSuiCallback(pPlayer, pSui, eventIndex, args)
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end

	local chosenTool = args + 1

	self[self.toolsMenu[chosenTool][2]](pPlayer)
end

-- debug for now to just reset the player's jedi progress
function StaffTools.resetJedi(pPlayer)
	local targetID = CreatureObject(pPlayer):getTargetID()

	if (targetID == nil) then
		return
	end

	local pTarget = getSceneObject(targetID)

	if (pTarget == nil) then
		CreatureObject(pPlayer):sendSystemMessage("You need a target for this option.")
		return
	end

	if (not SceneObject(pTarget):isPlayerCreature()) then
		CreatureObject(pPlayer):sendSystemMessage("You need to target a player.")
		return
	end

	-- Show data ON the target, TO the admin player (pPlayer)
	CreatureData:resetAll(pTarget)
	-- Show data ON the target, TO the admin player (pPlayer)
	CreatureData:showProgressGUI(pTarget, pPlayer)

end

function StaffTools.snoopJedi(pPlayer)
	local targetID = CreatureObject(pPlayer):getTargetID()

	if (targetID == nil) then
		return
	end

	local pTarget = getSceneObject(targetID)

	if (pTarget == nil) then
		CreatureObject(pPlayer):sendSystemMessage("You need a target for this option.")
		return
	end

	if (not SceneObject(pTarget):isPlayerCreature()) then
		CreatureObject(pPlayer):sendSystemMessage("You need to target a player.")
		return
	end

	-- Show data ON the target, TO the admin player (pPlayer)
	CreatureData:showProgressGUI(pTarget, pPlayer)

end

function StaffTools.lookupCRC(pPlayer)
	StaffTools:sendCrcSui(pPlayer)
end

function StaffTools:sendCrcSui(pPlayer)
	if (pPlayer == nil) then
		return
	end

	local sui = SuiInputBox.new("StaffTools", "lookupCrcCallback")

	sui.setTargetNetworkId(SceneObject(pPlayer):getObjectID())

	local suiBody = "Enter a CRC to lookup."
	sui.setTitle("Lookup CRC")
	sui.setPrompt(suiBody)

	sui.sendTo(pPlayer)
end

function StaffTools:lookupCrcCallback(pPlayer, pSui, eventIndex, args)
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end

	local crc = tonumber(args)

	if (crc) then
		local pCrc = getSceneObject(crc)
		if (pCrc == nil) then
			CreatureObject(pPlayer):sendSystemMessage("The object you are trying to look up does not exist.")
		end
		local crcName = SceneObject(pCrc):getCustomObjectName()
		local zone = SceneObject(pCrc):getZoneName()
		local x = math.floor(SceneObject(pCrc):getWorldPositionX())
		local y = math.floor(SceneObject(pCrc):getWorldPositionY())
		CreatureObject(pPlayer):sendSystemMessage("The name of the object you looked up: " .. crcName)
		CreatureObject(pPlayer):sendSystemMessage("Location: " .. zone .. ", co-ords: " .. x .. ", " .. y)
	else
		CreatureObject(pPlayer):sendSystemMessage("You need to input a hex or a decimal number.")
	end
end

function StaffTools.placeVendor(pPlayer)
	local pMobile = spawnMobile("naboo", "commoner", 300, -4910, 6, 4150, 0, 0)
	CreatureObject(pMobile):setOptionBit(CONVERSABLE)
	AiAgent(pMobile):setConvoTemplate("eventVendorConvoTemplate")
end

function StaffTools.holocronTroubleshoot(pPlayer)
	local targetID = CreatureObject(pPlayer):getTargetID()

	if (targetID == nil) then
		return
	end

	local pTarget = getSceneObject(targetID)

	if (pTarget == nil) then
		CreatureObject(pPlayer):sendSystemMessage("You need a target for this option.")
		return
	end

	if (not SceneObject(pTarget):isPlayerCreature()) then
		CreatureObject(pPlayer):sendSystemMessage("You need to target a player.")
		return
	end

	local pTargetGhost = CreatureObject(pTarget):getPlayerObject()

	if (pTargetGhost == nil) then
		return
	end

	local unlockStepIndex = {
		"OLDMANWAIT",
		"OLDMANMEET",
		"SITHWAIT",
		"SITHATTACK",
		"USEDATAPADONE",
		"SITHTHEATER",
		"USEDATAPADTWO",
		"MELLICHAETHEATER",
		"HOLOCRONTASKS",
	}

	local name = SceneObject(pTarget):getCustomObjectName()

	local melState = tostring(CustomJediManagerCommon.hasJediProgressionScreenPlayState(pTarget, CUSTOM_JEDI_PROGRESSION_DEFEATED_MELLICHAE))
	local hasActiveTask = tostring(CustomJediManagerHolocron:hasTheaterTask(pTarget))
	local activeHolocronTask = readScreenPlayData(pTarget, "CustomJediProgression", "ActiveHolocronTask")

	if (activeHolocronTask == "" or activeHolocronTask == nil) then
		activeHolocronTask = "none active"
	end

	local holocronStep = readScreenPlayData(pTarget, "CustomJediProgression", "HolocronStep")

	if (holocronStep == "" or holocronStep == nil) then
		holocronStep = 0
	end

	local unlockStep = readScreenPlayData(pTarget, "CustomJediProgression", "CustomUnlockStep")

	if (unlockStep == "" or unlockStep == nil) then
		unlockStep = 0
	end

	local unlockStepString = unlockStepIndex[tonumber(unlockStep)]
	print(unlockStepString)
	if (unlockStepString == "" or unlockStepString == nil) then
		unlockStepString = "Not glowing yet.\n"
	else
		unlockStepString = unlockStepString .. " (" .. unlockStep .. ")\n"
	end

	local message = "Jedi Unlock Troubleshoot for: " .. name .. "\n\n"
	message = message .. "Is on the following unlockstep: " .. unlockStepString
	message = message .. "Has completed Mellichae: " .. melState .. "\n"
	message = message .. "Has active holocron theater: " .. hasActiveTask .. "\n"
	message = message .. "Active holocron trial: " .. activeHolocronTask .. "\n"
	message = message .. "Holocron trials completed: " .. holocronStep .. "\n"
	message = message .. "Jedi State: " .. PlayerObject(pTargetGhost):getJediState()

	local suiManager = LuaSuiManager()
	suiManager:sendConfirmSui(pPlayer, pPlayer, "StaffTools", "HolocronTroubleshootCallback", message, "Ok")
	return
end


function StaffTools.fixJedi(pPlayer)
	local targetID = CreatureObject(pPlayer):getTargetID()

	if (targetID == nil) then
		return
	end

	local pTarget = getSceneObject(targetID)

	if (pTarget == nil) then
		CreatureObject(pPlayer):sendSystemMessage("You need a target for this option.")
		return
	end

	if (not SceneObject(pTarget):isPlayerCreature()) then
		CreatureObject(pPlayer):sendSystemMessage("You need to target a player.")
		return
	end

	local pTargetGhost = CreatureObject(pTarget):getPlayerObject()

	if (pTargetGhost == nil) then
		return
	end

	if (CustomJediManagerCommon.hasJediProgressionScreenPlayState(pPlayer, CUSTOM_JEDI_PROGRESSION_COMPLETED_HOLOCRON_TASKS)) then
		PlayerObject(pTargetGhost):setJediState(2)
		awardSkill(pTarget, "force_title_jedi_rank_01")
	end
	return
end

function StaffTools:HolocronTroubleshootCallback()
end

function StaffTools.startNSWB()
	nightsisterShapeshifter:startEncounter()
end

function StaffTools.endNSWB()
	nightsisterShapeshifter:cleanupScene()
end

function StaffTools.testWODConvo()
	local pMobile = spawnMobile("naboo", "commoner", 300, -4900, 6, 4150, 0, 0)
	CreatureObject(pMobile):setOptionBit(CONVERSABLE)
	AiAgent(pMobile):setConvoTemplate("wod_ns_witch_food")
end

return StaffTools
