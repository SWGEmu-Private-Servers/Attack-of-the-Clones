eliteSpawns = ScreenPlay:new {
	scriptName = "eliteSpawns"
}

registerScreenPlay("eliteSpawns", true)

local ObjectManager = require("managers.object.object_manager")
local CombatHelper = require("screenplays.utils.combatHelper")

function eliteSpawns:start()
	for i = 1, #eliteSpawnMap do
		if (isZoneEnabled(eliteSpawnMap[i]['planet'])) then
			if (eliteSpawnMap[i]['spawnTheater']) then
				self:spawnMobileWithTheater(none, i)
			else
				self:spawnMobile(none, i)
			end
		end
	end
end

function eliteSpawns:spawnMobileWithTheater(none, num)
	if (eliteSpawnMap[tonumber(num)] == nil) then
		return
	end

	local eliteMobile = eliteSpawnMap[tonumber(num)]
	local n = getRandomNumber(1, #eliteMobile['spawnArea'])
	local spawnPoint = getSpawnPoint(eliteMobile['planet'], eliteMobile['spawnArea'][n]['x'], eliteMobile['spawnArea'][n]['y'], 0, eliteMobile['spawnArea'][n]['radius'])
	if (spawnPoint ~= nil) then
		local pTheater = spawnTheaterObject(eliteMobile['planet'], spawnPoint[1], spawnPoint[2], spawnPoint[3], eliteMobile['flattenLayer'])

		if (pTheater == nil) then
			return false
		end

		local pMobile = spawnMobile(eliteMobile['planet'], eliteMobile['mobile'], 0, SceneObject(pTheater):getWorldPositionX(), SceneObject(pTheater):getWorldPositionZ(), SceneObject(pTheater):getWorldPositionY(), getRandomNumber(360), 0)
		createObserver(OBJECTDESTRUCTION, self.scriptName, "notifyMobileDestroyed", pMobile)
		writeData("eliteSpawns:mobileID" .. num, SceneObject(pMobile):getObjectID())
		writeData("eliteSpawns:spawnArea" .. SceneObject(pMobile):getObjectID(), n)
		writeData("eliteSpawns:mobNumber" .. SceneObject(pMobile):getObjectID(), num)

		for i = 1, #eliteMobile['theater'] do
			local objectData = eliteMobile['theater'][i]
			local xLoc = spawnPoint[1] + objectData.xDiff
			local yLoc = spawnPoint[3] + objectData.yDiff
			local zLoc = getTerrainHeight(pTheater, xLoc, yLoc) + objectData.zDiff
			local pObject = spawnSceneObject(eliteMobile['planet'], objectData.template, xLoc, zLoc, yLoc, 0, math.rad(objectData.heading))

			if (pObject ~= nil) then
				self:storeTheaterData(pObject, num)
			end
		end

		if (eliteMobile['spawnAdds']) then
			for i = 1, #eliteMobile['adds'] do
				local objectData = eliteMobile['adds'][i]
				local xLoc = spawnPoint[1] + objectData.xDiff
				local yLoc = spawnPoint[3] + objectData.yDiff
				local zLoc = getTerrainHeight(pTheater, xLoc, yLoc)
				local pAdd = spawnMobile(eliteMobile['planet'], objectData.template, 0, xLoc, zLoc, yLoc, objectData.heading, 0)
				if (objectData.idleWander) then
					AiAgent(pAdd):setAiTemplate("idlewander")
				end
			end
		end
	end

	if (eliteMobile['idleWander']) then
		AiAgent(pMobile):setAiTemplate("idlewander")
	end
	if (eliteMobile['mechanics'] ~= nil) then
		self[eliteMobile['mechanics']['mechanic']](pMobile, eliteMobile)
	end
end

function eliteSpawns:spawnMobile(none, num)
	if (eliteSpawnMap[tonumber(num)] == nil) then
		return
	end

	local pMobile
	local eliteMobile = eliteSpawnMap[tonumber(num)]
	local n = getRandomNumber(1, #eliteMobile['spawnArea'])
	local spawnPoint = getSpawnPoint(eliteMobile['planet'], eliteMobile['spawnArea'][n]['x'], eliteMobile['spawnArea'][n]['y'], 0, eliteMobile['spawnArea'][n]['radius'])
	if (spawnPoint ~= nil) then
		pMobile = spawnMobile(eliteMobile['planet'], eliteMobile['mobile'], 0, spawnPoint[1], spawnPoint[2], spawnPoint[3], getRandomNumber(360), 0)
		createObserver(OBJECTDESTRUCTION, self.scriptName, "notifyMobileDestroyed", pMobile)
		writeData("eliteSpawns:mobileID" .. num, SceneObject(pMobile):getObjectID())
		writeData("eliteSpawns:spawnArea" .. SceneObject(pMobile):getObjectID(), n)
		writeData("eliteSpawns:mobNumber" .. SceneObject(pMobile):getObjectID(), num)
	end
	if (eliteMobile['idleWander']) then
		AiAgent(pMobile):setAiTemplate("idlewander")
	end
	if (eliteMobile['mechanics'] ~= nil) then
		self[eliteMobile['mechanics']['mechanic']](pMobile, eliteMobile)
	end
end

function eliteSpawns:notifyMobileDestroyed(pMobile, pAttacker)
	if (pMobile == nil or pAttacker == nil) then
		return 0
	end

	local num = readData("eliteSpawns:mobNumber" .. SceneObject(pMobile):getObjectID())
	local respawnTime = eliteSpawnMap[num]['respawnTime']
	createEvent(respawnTime * 60 * 1000, self.scriptName, "spawnMobile", nil, tostring(num))

	if (eliteSpawnMap[num]['spawnTheater']) then
		createEvent(2 * 60 * 1000, self.scripName, "removeTheater", nil, tostring(num))
	end
	if (eliteSpawnMap[num]['awardBadge']) then
		self:awardBadge(pMobile, pAttacker, num)
	end
	return 1
end

function eliteSpawns:storeTheaterData(pObject, num)
	if (pObject == nil) then
		return
	end
	local objectID = SceneObject(pObject):getObjectID()
	writeStringData("eliteSpawns:spawnedObjects" .. tonumber(num), readStringData("eliteSpawns:spawnedObjects" .. tonumber(num)) .. "," .. objectID)
end

function eliteSpawns:removeTheater(none, num)
	local spawnedObjects = readStringData("eliteSpawns:spawnedObjects" .. tonumber(num))
	local spawnedObjectsTable = HelperFuncs:splitString(spawnedObjects, ",")
	for i = 1, #spawnedObjectsTable, 1 do
		local pObject = getSceneObject(tonumber(spawnedObjectsTable[i]))
		if (pObject ~= nil) then
			SceneObject(pObject):destroyObjectFromWorld()
		end
	end

	deleteStringData("eliteSpawns:spawnedObjects" .. tonumber(num))
end

function eliteSpawns:destroyObject(pObject)
	if (pObject ~= nil) then
		if (SceneObject(pObject):isAiAgent()) then
			CreatureObject(pObject):setPvpStatusBitmask(0)
			forcePeace(pObject)
		end
		SceneObject(pObject):destroyObjectFromWorld()
	end
end

--Badge Mechanic
function eliteSpawns:awardBadge(pMobile, pAttacker, num)
	if (pMobile == nil) then
		return
	end

	local healerList = CreatureObject(pMobile):getHealingThreatList()
	if (healerList == nil or #healerList == 0) then
		return
	end

	for i = 1, #healerList do
		local pPlayer = healerList[i]
		if (pPlayer ~= nil and SceneObject(pPlayer):isPlayerCreature() and not PlayerObject(pGhost):hasBadge(eliteSpawnMap[num]['badgeToAward'])) then
			PlayerObject(pPlayer):awardBadge(eliteSpawnMap[num]['badgeToAward'])
		end
	end

	local attackerList = CreatureObject(pMobile):getDamageDealerList()
	if attackerList == nil or #attackerList == 0 then
		return
	end

	for i = 1, #attackerList, 1 do
		local pPlayer = attackerList[i]
		if (pPlayer ~= nil and SceneObject(pPlayer):isPlayerCreature() and not PlayerObject(pGhost):hasBadge(eliteSpawnMap[num]['badgeToAward'])) then
			PlayerObject(pPlayer):awardBadge(eliteSpawnMap[num]['badgeToAward'])
		end
	end
end

--Add Waves Mechanic
function eliteSpawns.addWaves(pBoss, eliteMobile)
	if (pBoss == nil) then
		return
	end
	writeData("eliteSpawns:bossState" .. SceneObject(pBoss):getObjectID(), 1)
	writeData("eliteSpawns:numberOfWaves" .. SceneObject(pBoss):getObjectID(), eliteMobile['mechanics']['numberOfWaves'])
	writeData("eliteSpawns:addsToSpawn" .. SceneObject(pBoss):getObjectID(), eliteMobile['mechanics']['addsToSpawn'])
	writeStringData("eliteSpawns:addMobile" .. SceneObject(pBoss):getObjectID(),  eliteMobile['mechanics']['addMobile'])
	createObserver(DAMAGERECEIVED, "eliteSpawns", "bossLogic", pBoss)

	if (eliteMobile['mechanics']['spawnAdds']) then
		for i = 1, eliteMobile['mechanics']['addsToSpawn'] do
			local spawnPoint = getSpawnPoint(eliteMobile['planet'], CreatureObject(pBoss):getWorldPositionX(), CreatureObject(pBoss):getWorldPositionY(), 2, 4)
			local pAdd = spawnMobile(eliteMobile['planet'], eliteMobile['mechanics']['initialAddMobile'], 0, spawnPoint[1], spawnPoint[2], spawnPoint[3], getRandomNumber(360), 0)
			if (eliteMobile['idleWander']) then
				AiAgent(pAdd):setAiTemplate("idlewander")
			end
		end
	end
end

function eliteSpawns:bossLogic(pBoss)
	if (pBoss == nil) then
		return 1
	end

	local n = 100 / (readData("eliteSpawns:numberOfWaves" .. SceneObject(pBoss):getObjectID()) + 1)

	for i = 1, readData("eliteSpawns:numberOfWaves" .. SceneObject(pBoss):getObjectID()) do
		if (CombatHelper:logicBossState(pBoss, (100 - n * i) / 100, "eliteSpawns:bossState", i) == true) then
			writeData("eliteSpawns:bossState", i + 1)
			self:spawnWave(pBoss)
		end
	end
	return 0
end

function eliteSpawns:spawnWave(pBoss)
	if (pBoss == nil) then
		return 0
	end

	for i = 1, readData("eliteSpawns:addsToSpawn" .. SceneObject(pBoss):getObjectID()) do
		local spawnPoint = getSpawnPoint(SceneObject(pBoss):getZoneName(), CreatureObject(pBoss):getWorldPositionX(), CreatureObject(pBoss):getWorldPositionY(), 10, 15)
		local pAdd = spawnMobile(SceneObject(pBoss):getZoneName(), 0, readStringData("eliteSpawns:addMobile" .. SceneObject(pBoss):getObjectID()), spawnPoint[1], spawnPoint[2], spawnPoint[3], getRandomNumber(360), 0)
		createEvent(30 * 60 * 1000, self.scriptName, "destroyObject", pAdd, "")
	end
end

--Patrol Mechanic
function eliteSpawns.patrolling(pMobile, eliteMobile)
	if (pMobile == nil) then
		return
	end

	AiAgent(pMobile):setAiTemplate("cantinacrackdown")
	AiAgent(pMobile):setFollowState(PATROLLING)
	createObserver(DESTINATIONREACHED, "eliteSpawns", "destinationReached", pMobile)

	local pActiveArea = spawnActiveArea(SceneObject(pMobile):getZoneName(), "object/active_area.iff", CreatureObject(pMobile):getWorldPositionX(), 0, CreatureObject(pMobile):getWorldPositionY(), 150, 0)
	createObserver(ENTEREDAREA, "eliteSpawns", "handleEnteredAreaEvent", pActiveArea)
	writeData("eliteSpawns:mobileIDinArea" .. SceneObject(pActiveArea):getObjectID(), SceneObject(pMobile):getObjectID())

	if (eliteMobile['mechanics']['spawnAdds']) then
		for i = 1, eliteMobile['mechanics']['addsToSpawn'] do
			local spawnPoint = getSpawnPoint(eliteMobile['planet'], CreatureObject(pMobile):getWorldPositionX(), CreatureObject(pMobile):getWorldPositionY(), 2, 4)
			local pAdd = spawnMobile(eliteMobile['planet'], eliteMobile['mechanics']['addMobile'], 0, spawnPoint[1], spawnPoint[2], spawnPoint[3], getRandomNumber(360), 0)
			AiAgent(pAdd):setFollowObject(pMobile)
			AiAgent(pAdd):setAiTemplate("cantinacrackdown")
		end
	end
end

function eliteSpawns:handleEnteredAreaEvent(pActiveArea, pPlayer)
	if (pActiveArea == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		return 0
	end
	local pMobile = getSceneObject(readData("eliteSpawns:mobileIDinArea" .. SceneObject(pActiveArea):getObjectID()))
	createEvent(2000, self.scriptName, "moveMobile", pMobile, "")
	SceneObject(pActiveArea):destroyObjectFromWorld()
	return 1
end

function eliteSpawns:destinationReached(pMobile)
	if (pMobile == nil or CreatureObject(pMobile):isDead()) then
		return 1
	end
	createEvent(10 * 1000, self.scriptName, "moveMobile", pMobile, "")
	return 0
end

function eliteSpawns:moveMobile(pMobile)
	if (pMobile == nil or CreatureObject(pMobile):isDead()) then
		return 1
	end
	if (not CreatureObject(pMobile):isInCombat()) then
		local movePoint = self:getMovePoint(pMobile)
		AiAgent(pMobile):stopWaiting()
		AiAgent(pMobile):setWait(0)
		AiAgent(pMobile):setNextPosition(movePoint[1], movePoint[2], movePoint[3], 0)
		AiAgent(pMobile):setHomeLocation(movePoint[1], movePoint[2], movePoint[3], 0)
		AiAgent(pMobile):executeBehavior()
	end
end

function eliteSpawns:getMovePoint(pMobile)
	local spawnArea = eliteSpawnMap[readData("eliteSpawns:mobNumber" .. SceneObject(pMobile):getObjectID())]['spawnArea'][readData("eliteSpawns:spawnArea" .. SceneObject(pMobile):getObjectID())]
	local movePoint = getSpawnPoint(SceneObject(pMobile):getZoneName(), CreatureObject(pMobile):getWorldPositionX(), CreatureObject(pMobile):getWorldPositionY(), 50, 75)

	local a = spawnArea['x'] - movePoint[1]
	local b = spawnArea['y'] - movePoint[3]
	local dist = math.sqrt(a*a + b*b)

	if (dist > spawnArea['radius']) then
		return eliteSpawns:getMovePoint(pMobile)
	else
		return movePoint
	end
end

--Staff status SUI.
--Credit: Tyclo @ SR for this idea.
function eliteSpawns:statusSui(pPlayer)
	if (pPlayer == nil) then
		return
	end

	local suiMsg = "\\#FFFFFF"
	for i = 1, #eliteSpawnMap do
		local pMobile = getSceneObject(readData("eliteSpawns:mobileID" .. i))
		local mobile = eliteSpawnMap[i]['mobile']
		local planet = eliteSpawnMap[i]['planet']
		local tailMsg
		if (pMobile == nil or CreatureObject(pMobile):isDead()) then
			tailMsg = " \\#FFFFFF- Status:\\#FF6961 Respawning"
		else
			local x = SceneObject(pMobile):getWorldPositionX()
			local y = SceneObject(pMobile):getWorldPositionY()
			tailMsg = " \\#FFFFFF- X:\\#E1D88E " .. math.floor(x) .. "\\#FFFFFF, Y:\\#E1D88E " .. math.floor(y)
			if (CreatureObject(pMobile):isInCombat()) then
				tailMsg = tailMsg .. " \\#FFFFFF- Status:\\#FFB347 In Combat"
			else
				tailMsg = tailMsg .. " \\#FFFFFF- Status:\\#77DD77 Idle"
			end
		end
		suiMsg = suiMsg .. i .. "\\#FFFFFF:\\#E1D88E " .. mobile .. " \\#FFFFFF- Planet:\\#E1D88E " .. planet:gsub("^%l", string.upper) .. tailMsg .. "\n\\#FFFFFF"
	end

	local sui = SuiMessageBox.new(self.scriptName, "notifyOkPressed")
	sui.setTitle("Elite Spawns Status")
	sui.setOtherButtonText("Open Teleport Menu")
	sui.setCancelButtonText("Close Window")
	sui.setOkButtonText("Refresh Status")
	sui.setPrompt(suiMsg)
	-- Other Button setup subscribe
	sui.setProperty("btnRevert", "OnPress", "RevertWasPressed=1\r\nparent.btnOk.press=t")
	sui.subscribeToPropertyForEvent(SuiEventType.SET_onClosedOk, "btnRevert", "RevertWasPressed")

	sui.sendTo(pPlayer)
end

function eliteSpawns:notifyOkPressed(pPlayer, pSui, eventIndex, ...)
	if (pPlayer == nil) then
		return
	end

	local cancelPressed = (eventIndex == 1)
	local args = {...}
	local teleport = args[1]

	if (cancelPressed) then
		return
	elseif (teleport ~= nil) then
		self:teleportSui(pPlayer)
	elseif (eventIndex == 0) then
		self:statusSui(pPlayer)
	end
end

function eliteSpawns:teleportSui(pPlayer)
	if (pPlayer == nil) then
		return
	end

	local sui = SuiListBox.new("eliteSpawns", "teleportCallback")
	sui.setTitle("Elite Spawns Teleport Menu")
	sui.setPrompt("Select an Elite Spawn to teleport to.")

	for i = 1, #eliteSpawnMap do
		local pMobile = getSceneObject(readData("eliteSpawns:mobileID" .. i))
		local planet = eliteSpawnMap[i]['planet']

		if (pMobile ~= nil and CreatureObject(pMobile) ~= nil and not CreatureObject(pMobile):isDead()) then
			sui.add(i .. ": " .. SceneObject(pMobile):getDisplayedName() .. ", " .. planet:gsub("^%l", string.upper), tostring(i))
		end
	end

	sui.sendTo(pPlayer)
end

function eliteSpawns:teleportCallback(pPlayer, pSui, eventIndex, args)
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed or args == nil or tonumber(args) < 0) then
		return
	end

	local pPageData = LuaSuiBoxPage(pSui):getSuiPageData()

	if (pPageData == nil) then
		return
	end

	local suiPageData = LuaSuiPageData(pPageData)
	local menuOption = suiPageData:getStoredData(args)

	local pMobile = getSceneObject(readData("eliteSpawns:mobileID" .. tonumber(menuOption)))

	if (pMobile == nil) then
		return
	end

	local zone = SceneObject(pMobile):getZoneName()
	local x = SceneObject(pMobile):getWorldPositionX()
	local z = SceneObject(pMobile):getWorldPositionZ()
	local y = SceneObject(pMobile):getWorldPositionY()
	SceneObject(pPlayer):switchZone(zone, x, z, y, 0)
	print("Admin " .. CreatureObject(pPlayer):getFirstName() .. " used the Elite Spawns teleport menu.")
end
