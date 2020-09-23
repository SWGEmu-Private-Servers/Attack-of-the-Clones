ScreenplayStarter = {
	promptBody = {
		"Press 's' to start it, press 'x' to stop it (if ongoing). Selected SP: ",
	},

	promptTitle = { "Action Type", "Screenplay Name"},

	actionNames = { "start", "stop" },
}

function ScreenplayStarter:resetDefaults(pPlayer)
	local playerID = SceneObject(pPlayer):getObjectID()

	deleteData(playerID .. ":ScreenplayStarter:action")
	deleteData(playerID .. ":ScreenplayStarter:screenplayName")


	deleteStringData(playerID .. ":ScreenplayStarter:action")
	deleteStringData(playerID .. ":ScreenplayStarter:screenplanName")
end


function ScreenplayStarter:showMainUI(pPlayer)
	local sui = SuiInputBox.new("ScreenplayStarter", "suiScreenplayStarterMainCallback")

	sui.setTargetNetworkId(SceneObject(pPlayer):getObjectID())

	local suiBody = "Enter the name of the screenplay. Screenplays should have a Start and Stop function in their LUA"
	sui.setTitle("Information")
	sui.setPrompt(suiBody)

	sui.sendTo(pPlayer)
end

function ScreenplayStarter:suiScreenplayStarterMainCallback(pPlayer, pSui, eventIndex, args)
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end

	local playerID = SceneObject(pPlayer):getObjectID()

	if(args ~= "s" and args ~= "x" and args ~= "") then -- 1
		-- Screenplay name
		self:resetDefaults(pPlayer)
		writeStringData(playerID .. ":ScreenplayStarter:spName", args)
		writeData(playerID .. ":ScreenplayStarter:setupStep", 1)
		writeData(playerID .. ":ScreenplayStarter:setupCompleted", 0)
		self:showSetupUI(pPlayer)
		return
	else
		self:showSetupUI(pPlayer)
		return
	end -- 1

	self:showMainUI(pPlayer)
end

function ScreenplayStarter:showSetupUI(pPlayer)
	local playerID = SceneObject(pPlayer):getObjectID()
	local curStep = readData(playerID .. ":ScreenplayStarter:setupStep")

	if (readData(playerID .. ":ScreenplayStarter:setupCompleted") == 1 or curStep == 0) then
		self:showMainUI(pPlayer)
		return
	end

	local sui = SuiInputBox.new("ScreenplayStarter", "suiScreenplayStarterSetupCallback")

	sui.setTargetNetworkId(SceneObject(pPlayer):getObjectID())

	sui.setTitle(self.promptTitle[curStep])
	local body = self.promptBody[curStep]
	if(curStep == 1) then
		body = body .. readStringData(playerID .. ":ScreenplayStarter:spName")
	end

	sui.setPrompt(body)

	sui.sendTo(pPlayer)
end

function ScreenplayStarter:suiScreenplayStarterSetupCallback(pPlayer, pSui, eventIndex, args)
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end

	local playerID = SceneObject(pPlayer):getObjectID()
	local curStep = readData(playerID .. ":ScreenplayStarter:setupStep")

	if (curStep == 1) then -- 1
		if(args == "x") then
			local spName = readStringData(playerID .. ":ScreenplayStarter:spName")
			local action = "stop"
			startStopScreenplayFromLua(action, spName);
			writeData(playerID .. ":ScreenplayStarter:setupCompleted", 1)
			writeData(playerID .. ":ScreenplayStarter:setupStep", 0)
		elseif(args == "s") then
			local spName = readStringData(playerID .. ":ScreenplayStarter:spName")
			local action = "start"
			startStopScreenplayFromLua(action, spName);
			writeData(playerID .. ":ScreenplayStarter:setupCompleted", 1)
			writeData(playerID .. ":ScreenplayStarter:setupStep", 0)
		end -- 2
	end -- 1



	self:showSetupUI(pPlayer)
end
