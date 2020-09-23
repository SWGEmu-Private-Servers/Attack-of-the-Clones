eventSpawnManager = ScreenPlay:new {
    scriptName = "eventSpawnManager",
	options = {
		{"Mobile Manager", "mobileManager"},
		{"Setup Events", "setupEvent"},
		{"Delete Event Setup", "deleteEvent"},
	},
}

registerScreenPlay("eventSpawnManager", false)

eventTotalMobiles = 5
eventMobileDataString = "MobileManager"

function eventSpawnManager:openSUI(pPlayer)
	if (pPlayer == nil) then
		return
	end
	
	local sui = SuiListBox.new(self.scriptName, "mainSuiCallback")

	sui.setTargetNetworkId(SceneObject(pPlayer):getObjectID())

	sui.setTitle("Event Spawn Manager")
	sui.setPrompt("Select a function below to proceed.")

	for i = 1, #self.options, 1 do
		sui.add(self.options[i][1], "")
	end

	sui.sendTo(pPlayer)
end

function eventSpawnManager:mainSuiCallback(pPlayer, pSui, eventIndex, args)
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end

	local chosenTool = args + 1
	
	self[self.options[chosenTool][2]](pPlayer)
end

function eventSpawnManager.mobileManager(pPlayer)
	if (pPlayer == nil) then
		return
	end
	
	local sui = SuiListBox.new(eventSpawnManager.scriptName, "mobileManagerCallback")

	sui.setTargetNetworkId(SceneObject(pPlayer):getObjectID())

	sui.setTitle("Mobile Manager")
	sui.setPrompt("Select a mobile slot below to proceed.")
	sui.setCancelButtonText("Delete Mobile")
	sui.setOkButtonText("Setup Mobile")

	for i = 1, 5 do
		local MobileTemplate = readScreenPlayData(pPlayer, eventMobileDataString, "mobile_template_" .. i)
		if (MobileTemplate == "" or MobileTemplate == nil) then
			sui.add("Empty Mobile Data", "")
		else
			local MobileLevel = readScreenPlayData(pPlayer, eventMobileDataString, "mobile_level_" .. i)
			if (MobileLevel == "" or MobileLevel == nil) then
				MobileLevel = "unaltered"
			end
			sui.add(MobileTemplate .. ". clvl: " .. MobileLevel, "mobile")
		end
	end

	sui.sendTo(pPlayer)
end

function eventSpawnManager:mobileManagerCallback(pPlayer, pSui, eventIndex, args)
	local deletePressed = (eventIndex == 1)	
	local pPageData = LuaSuiBoxPage(pSui):getSuiPageData()
	
	if (deletePressed) then
		--self:deleteMobileData(pPlayer)
		return
	end

	if (pPageData == nil) then
		return
	end

	local suiPageData = LuaSuiPageData(pPageData)
	local menuOption = suiPageData:getStoredData(args)
	local chosenMobileSlot = args + 1
	writeData("eventMobileManager:chosenMobileSlot" .. SceneObject(pPlayer):getObjectID(), chosenMobileSlot)
	
	if (menuOption == "mobile") then
		self:setupMobileDataConfirmSui(pPlayer)
	else
		self:setupMobileData(pPlayer)
	end
end

function eventSpawnManager:setupMobileDataConfirmSui(pPlayer)
	local suiManager = LuaSuiManager()
	suiManager:sendMessageBox(pPlayer, pPlayer, "Confirm Mobile Creation", "This will delete the current mobile set up in this slot, are you sure you want to continue?", "Continue", self.scriptName, "setupMobileDataConfirmCallback")
end

function eventSpawnManager:setupMobileDataConfirmCallback(pPlayer, pSui, eventIndex)
	local cancelPressed = (eventIndex == 1)
	
	if (cancelPressed) then
		self.mobileManager(pPlayer)
		return
	end
	
	self:setupMobileData(pPlayer)
end

function eventSpawnManager:setupMobileData(pPlayer)
	if (pPlayer == nil) then
		return
	end
	
	local sui = SuiInputBox.new(self.scriptName, "mobileTemplateCallback")

	sui.setTargetNetworkId(SceneObject(pPlayer):getObjectID())

	local suiBody = "Enter the spawn template (example: 'nightsister_elder') to proceed."
	sui.setTitle("Mobile Spawn Template")
	sui.setPrompt(suiBody)

	sui.sendTo(pPlayer)
end

function eventSpawnManager:mobileTemplateCallback(pPlayer, pSui, eventIndex, args)
	local cancelPressed = (eventIndex == 1)
	
	if (cancelPressed) then
		self.mobileManager(pPlayer)
		return
	end
	
	local chosenMobileSlot = readData("eventMobileManager:chosenMobileSlot" .. SceneObject(pPlayer):getObjectID())
	writeScreenPlayData(pPlayer, eventMobileDataString, "mobile_template_" .. chosenMobileSlot, args)
	
	local sui = SuiInputBox.new(self.scriptName, "mobileLevelCallback")
	sui.setTargetNetworkId(SceneObject(pPlayer):getObjectID())
	
	local suiBody = "Enter the desired level of the mobile. Press cancel to leave default."
	sui.setTitle("Mobile Spawn Level")
	sui.setPrompt(suiBody)

	sui.sendTo(pPlayer)
end

function eventSpawnManager:mobileLevelCallback(pPlayer, pSui, eventIndex, args)
	local cancelPressed = (eventIndex == 1)
	
	if (cancelPressed) then
		self.mobileManager(pPlayer)
		return
	end
	
	local chosenMobileSlot = readData("eventMobileManager:chosenMobileSlot" .. SceneObject(pPlayer):getObjectID())
	writeScreenPlayData(pPlayer, eventMobileDataString, "mobile_level_" .. chosenMobileSlot, tonumber(args))
	
	self.mobileManager(pPlayer)
end

function eventSpawnManager.setupEvent(pPlayer)

end

function eventSpawnManager.deleteEvent(pPlayer)

end
