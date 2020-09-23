Versafunction88ScreenPlayString = "versafunction88"
Versafunction88ScreenPlayStates = { --Used to select what to display on the '/examine' side bar.
	{1, "tokenDisplay", "Display Tokens"},
	{2, "factionControlDisplay", "Display Faction Control"},
}

Versafunction88FactionZones = {
	"corellia",
	"dantooine",
	--"dathomir",
	--"endor",
	"lok",
	"naboo",
	"rori",
	"talus",
	"tatooine",
	--"yavin4",
}

Versafunction88TokenData = {--ScreenPlayData string, ScreenPlayData key, display string, full template string (without shared_)
	{"vendorToken", "event_token", "Event Tokens", "object/tangible/loot/misc/event_token.iff"},
	{"vendorToken", "event_token_restuss_rep", "Republic Restuss Commendations", "object/tangible/loot/misc/event_token_restuss_rep.iff"},
	--{"vendorToken", "event_token_restuss_cis", "Confederacy Restuss Commendations", "object/tangible/loot/misc/event_token_restuss_cis.iff"},
	--{"vendorToken", "test_token"},
}

Versafunction88AttributeListComponent = {}

function Versafunction88AttributeListComponent:fillAttributeList(pALM, pPlayer, pObject)
	local ALM = LuaAttributeListMessage(pALM)

	for i = 1, #Versafunction88ScreenPlayStates do
		if (CreatureObject(pPlayer):hasScreenPlayState(Versafunction88ScreenPlayStates[i][1], Versafunction88ScreenPlayString)) then
			self[Versafunction88ScreenPlayStates[i][2]](pALM, pPlayer, pObject)
			return
		end
	end

	ALM:insertNewAttribute("versafunction_display", "Information")
	ALM:insertNewAttribute("versafunction_instructions", "Please select a display to show information on your Versafunction88 Datapad.") -- the 2nd value has to derive from obj_attr_n.stf
end

function Versafunction88AttributeListComponent.tokenDisplay(pALM, pPlayer, pObject)
	local ALM = LuaAttributeListMessage(pALM)

	ALM:insertNewAttribute("versafunction_display", "Stored Tokens")

	for i = 1, #Versafunction88TokenData do
		local tokenData = tonumber(readScreenPlayData(pPlayer, Versafunction88TokenData[i][1], Versafunction88TokenData[i][2]))
		if (tokenData == "" or tokenData == nil) then
			tokenData = 0
		end

		ALM:insertNewAttribute("versafunction_token" .. i, tokenData)
	end
end

function Versafunction88AttributeListComponent.factionControlDisplay(pALM, pPlayer, pObject)
	local ALM = LuaAttributeListMessage(pALM)

	ALM:insertNewAttribute("versafunction_display", "Faction Control")

	local controllingFaction = ""
	for i = 1, #Versafunction88FactionZones do
		controllingFaction = getControllingFaction(Versafunction88FactionZones[i])

		if (controllingFaction == FACTIONNEUTRAL) then
			controllingFaction = "Neutral"
		elseif (controllingFaction == FACTIONIMPERIAL) then
			controllingFaction = "Republic"
		elseif (controllingFaction  == FACTIONREBEL) then
			controllingFaction  = "CIS"
		end

		ALM:insertNewAttribute(Versafunction88FactionZones[i], controllingFaction)
	end
end

Versafunction88MenuComponent = {}

function Versafunction88MenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)

	menuResponse:addRadialMenuItem(120, 3, "Set Display")
	menuResponse:addRadialMenuItem(121, 3, "Lot Information")
	menuResponse:addRadialMenuItem(122, 3, "Withdraw Tokens")
	--menuResponse:addRadialMenuItem(123, 3, "Read Patch Notes")
end

function Versafunction88MenuComponent:handleObjectMenuSelect(pObject, pPlayer, selectedID)
	if (pPlayer == nil or pObject == nil) then
		return 0
	end

	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return 0
	end

	if (selectedID == 120) then
		local sui = SuiListBox.new("Versafunction88MenuComponent", "displaySuiCallback")

		sui.setTargetNetworkId(SceneObject(pPlayer):getObjectID())

		sui.setTitle("Select Display")
		sui.setPrompt("Select which information to display on your Versafunction88 Datapad.")

		for i = 1, #Versafunction88ScreenPlayStates do
			sui.add(Versafunction88ScreenPlayStates[i][3], "")
		end

		sui.sendTo(pPlayer)
	end
	if (selectedID == 121) then
		local sui = SuiMessageBox.new("Versafunction88MenuComponent", "lotInformationCallback")
		sui.setTitle("Lot Information")
		sui.setOkButtonText("Close")
		sui.hideCancelButton()
		sui.setProperty("", "Size", "250,350")
		local prompt = ""

		for i = 1, PlayerObject(pGhost):getTotalOwnedStructureCount() do
			local pStructure = getSceneObject(PlayerObject(pGhost):getOwnedStructure(i - 1))

			prompt = prompt .. "Structure " .. i .. ": "

			if (pStructure == nil) then
				prompt = prompt .. "empty structure\n\n"
			else
				local structure = LuaSceneObject(pStructure)

				prompt = prompt .. structure:getCustomObjectName() .. "\n"
				prompt = prompt .. "Type: " .. structure:getObjectName() .. "\n"
				prompt = prompt .. "Location - Planet: " .. structure:getZoneName():gsub("^%l", string.upper) .. ", X: " .. math.floor(structure:getWorldPositionX()) .. ", Y: " .. math.floor(structure:getWorldPositionY()) .. "\n\n"
			end
		end
		sui.setPrompt(prompt)
		sui.sendTo(pPlayer)
	end
	if (selectedID == 122) then
		local sui = SuiListBox.new("Versafunction88MenuComponent", "withdrawTokenListCallback")

		sui.setTargetNetworkId(SceneObject(pPlayer):getObjectID())

		sui.setTitle("Token Withdrawal")
		sui.setPrompt("Select which token to withdraw from your Versafunction88 datapad.")

		for i = 1, #Versafunction88TokenData do
			local tokenData = tonumber(readScreenPlayData(pPlayer, Versafunction88TokenData[i][1], Versafunction88TokenData[i][2]))
			if (tokenData == nil or tokenData == "") then
				tokenData = 0
			end

			if (tokenData >= 1) then
				sui.add(Versafunction88TokenData[i][3], "")
			end
		end

		sui.sendTo(pPlayer)
	end
	if (selectedID == 123) then
		NewsnetMenuComponent:handleObjectMenuSelect(pObject, pPlayer, 20)
	end
end

function Versafunction88MenuComponent:storeToken(pPlayer, pObject)
	if (pPlayer == nil or pObject == nil) then
		return
	end

	for i = 1, #Versafunction88TokenData do
		if (SceneObject(pObject):getTemplateObjectPath() == Versafunction88TokenData[i][4]) then
			local tokenData = tonumber(readScreenPlayData(pPlayer, Versafunction88TokenData[i][1], Versafunction88TokenData[i][2]))
			if (tokenData == "" or tokenData == nil) then
				tokenData = 0
			end
			writeScreenPlayData(pPlayer, Versafunction88TokenData[i][1], Versafunction88TokenData[i][2], tokenData + TangibleObject(pObject):getUseCount())

			SceneObject(pObject):destroyObjectFromWorld()
			SceneObject(pObject):destroyObjectFromDatabase()
		end
	end
end

function Versafunction88MenuComponent:displaySuiCallback(pPlayer, pSui, eventIndex, args)
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end

	local chosenDisplay = args + 1

	for i = 1, #Versafunction88ScreenPlayStates do
		CreatureObject(pPlayer):removeScreenPlayState(Versafunction88ScreenPlayStates[i][1], Versafunction88ScreenPlayString)
	end

	CreatureObject(pPlayer):setScreenPlayState(Versafunction88ScreenPlayStates[chosenDisplay][1], Versafunction88ScreenPlayString)
end

function Versafunction88MenuComponent:lotInformationCallback(pPlayer, pSui, eventIndex)
end

function Versafunction88MenuComponent:withdrawTokenListCallback(pPlayer, pSui, eventIndex, args)
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end

	local chosenToken = args + 1
	writeData(SceneObject(pPlayer):getObjectID() .. "Versafunction88:tokenToWithdraw", chosenToken)
	local tokenData = tonumber(readScreenPlayData(pPlayer, Versafunction88TokenData[chosenToken][1], Versafunction88TokenData[chosenToken][2]))

	local sui = SuiTransferBox.new("Versafunction88MenuComponent", "withdrawTokenTransferCallback")

	sui.setTargetNetworkId(SceneObject(pPlayer):getObjectID())
	sui.setTitle("Withdraw " .. Versafunction88TokenData[chosenToken][3])
	sui.setPrompt("How many tokens do you wish to withdraw from your Versafunction88 datapad?")
	sui.setTransferFromText("Stored Tokens")
	sui.setTransferFromValue(tokenData)
	sui.setTransferFromInputValue(tokenData)
	sui.setConversionFromRatio(1)
	sui.setTransferToText("Withdraw")
	sui.setTransferToValue(0)
	sui.setTransferToValue(0)
	sui.setConversionToRatio(1)

	sui.sendTo(pPlayer)
end

function Versafunction88MenuComponent:withdrawTokenTransferCallback(pPlayer, pSui, eventIndex, transferInputFromValue, transferInputToValue)
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end

	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return
	end

	if (SceneObject(pInventory):isContainerFullRecursive()) then
		CreatureObject(pPlayer):sendSystemMessage("You do not have enough inventory space.")
		deleteData(SceneObject(pPlayer):getObjectID() .. "Versafunction88:tokenToWithdraw")
		return
	end

	local chosenToken = readData(SceneObject(pPlayer):getObjectID() .. "Versafunction88:tokenToWithdraw")

	writeScreenPlayData(pPlayer, Versafunction88TokenData[chosenToken][1], Versafunction88TokenData[chosenToken][2], tonumber(transferInputFromValue))

	local pItem = giveItem(pInventory, Versafunction88TokenData[chosenToken][4], -1)
	TangibleObject(pItem):setUseCount(tonumber(transferInputToValue))

	deleteData(SceneObject(pPlayer):getObjectID() .. "Versafunction88:tokenToWithdraw")
end
