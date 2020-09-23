-- Original code by SWGEmu.

EventTools = {
	toolsMenu = {
		{ "Start / Stop Screenplay", "startStopScreenplay" },
		{ "Spawn Loot Bags in 32m Radius", "spawnLootBoxes" },
		{ "Shuttle Dropoff", "openShuttleConfig" }, --SWGEmu Code
		{ "Firework Event", "openFireworkConfig" }, --SWGEmu Code
		{ "Elite Spawns Satus", "openEliteSpawnStatus" },
		{ "Test ODST", "openOdstConfig" },
		{ "Test Event Spawn Manager", "testESM" },
	}
}

function EventTools:openToolsSUI(pCreature)
	if (pCreature == nil) then
		return
	end

	self:openSUI(pCreature)
end

function EventTools:openSUI(pCreature)
	local sui = SuiListBox.new("EventTools", "mainSuiCallback")

	sui.setTargetNetworkId(SceneObject(pCreature):getObjectID())

	sui.setTitle("Staff Tools")
	sui.setPrompt("Select a tool below to open it.")

	for i = 1, #self.toolsMenu, 1 do
		sui.add(self.toolsMenu[i][1], "")
	end

	sui.sendTo(pCreature)
end

function EventTools:mainSuiCallback(pPlayer, pSui, eventIndex, args)
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end

	local chosenTool = args + 1

	self[self.toolsMenu[chosenTool][2]](pPlayer)
end

function EventTools.openShuttleConfig(pPlayer)
	ShuttleDropoff:showMainUI(pPlayer)
end

function EventTools.openFireworkConfig(pPlayer)
	FireworkEvent:showMainUI(pPlayer)
end

function EventTools.startStopScreenplay(pPlayer)
	ScreenplayStarter:showMainUI(pPlayer)
end

function EventTools.spawnLootBoxes(pPlayer)
	LootBoxesScreenplay:spawnLoot(pPlayer)
end

function EventTools.openEliteSpawnStatus(pPlayer)
	eliteSpawns:statusSui(pPlayer)
end

function EventTools.openOdstConfig(pPlayer)
	callODST:showMainUI(pPlayer)
end

function EventTools.testESM(pPlayer)
	eventSpawnManager:openSUI(pPlayer)
end

function EventTools:suiShuttleDropoffCallback(pPlayer, pSui, eventIndex, args)
end

return EventTools
