-- Written by: TheTinyPebble

-- Boss States
-- 1: Unshifted
-- 2: Rancor
-- 3: Flier
-- 4: Spider
-- 5: Crystals destroyed

--[[TODO:
	Mechanics indicators: Screech, gust of wind, drain life, poison clouds
	Add timer
	Add broadcast messages
	Add start encounter mechanic
	Add crystal objects
	Add boss mobiles
	Add theater [Not done server side]
	Add player scaling
	Add finish encounter function
		Delete data bytes on completion
		Handle rewards
]]

nightsisterShapeshifter = ScreenPlay:new {
	scriptName = "nightsisterShapeshifter",
	planetName = "naboo",
	x = -4900,
	z = 6,
	y = 4150,

	bossShapes = { --Temporary
		"nightsister_elder",
		"mutant_rancor",
		"peko_peko_albatross",
		"cavern_spider",
	},

	screechCone = 60,
	poisonCloudRadius = 5,

	crystalRed = "object/tangible/jedi/power_shrine.iff",
	crystalGreen = "object/tangible/jedi/power_shrine.iff",
	crystalBlue = "object/tangible/jedi/power_shrine.iff",
	radius = 25,
	crystalCount = 9, -- Gotta be dividable by 3
}

registerScreenPlay("nightsisterShapeshifter", false)

function nightsisterShapeshifter:start()
	-- Clear it out first
	self:cleanupScene()
	self:startEncounter()
end

function nightsisterShapeshifter:stop()
	self:cleanupScene()
end

function nightsisterShapeshifter:startEncounter()
	-- Clear it out first
	self:cleanupScene()
	if (self.crystalCount % 3 ~= 0) then
		printLuaError("crystalCount in nightsisterShapeshifter screenplay was not dividable by 3")
	end

	local pBoss = spawnMobile(self.planetName, self.bossShapes[1], 0, self.x, self.z, self.y, math.random(1, 360), 0)
	writeData("nightsisterShapeshifter:bossID", SceneObject(pBoss):getObjectID())
	writeData("nightsisterShapeshifter:bossState", 1)
	createObserver(DAMAGERECEIVED, self.scriptName, "notifyDamageReceived", pBoss)
	createObserver(OBJECTDESTRUCTION, self.scriptName, "notifyBossDestroyed", pBoss)

	self:storeObjectID(pBoss)

	writeData("nightsisterShapeshifter:bossShape:rancor", 1)
	writeData("nightsisterShapeshifter:bossShape:flier", 1)
	writeData("nightsisterShapeshifter:bossShape:spider", 1)

	local crystalSpawnPoints = self:getCircleSpawnPoints(self.x, self.y, self.radius, self.crystalCount)
	local shuffledSpawnPoints = self:shuffleTable(crystalSpawnPoints)

	for i = 1, #shuffledSpawnPoints do
		local xPos = shuffledSpawnPoints[i].x
		local yPos = shuffledSpawnPoints[i].y
		local zPos = getTerrainHeight(pBoss, xPos, yPos)
		local pCrystal
		if (i <= #crystalSpawnPoints / 3) then
			pCrystal = spawnSceneObject(self.planetName, self.crystalRed, xPos, zPos, yPos, 0, math.rad(math.random(360)))
			writeData("nightsisterShapeshifter:crystalCount:red", readData("nightsisterShapeshifter:crystalCount:red") + 1)
			writeStringData("nightsisterShapeshifter:crystalColor" .. SceneObject(pCrystal):getObjectID(), "red")
			SceneObject(pCrystal):setCustomObjectName("Pretend this is a red crystal") -- Temporary
		elseif (i <= #crystalSpawnPoints / 3 * 2) then
			pCrystal = spawnSceneObject(self.planetName, self.crystalGreen, xPos, zPos, yPos, 0, math.rad(math.random(360)))
			writeData("nightsisterShapeshifter:crystalCount:green", readData("nightsisterShapeshifter:crystalCount:green") + 1)
			writeStringData("nightsisterShapeshifter:crystalColor" .. SceneObject(pCrystal):getObjectID(), "green")
			SceneObject(pCrystal):setCustomObjectName("Pretend this is a green crystal") -- Temporary
		else
			pCrystal = spawnSceneObject(self.planetName, self.crystalBlue, xPos, zPos, yPos, 0, math.rad(math.random(360)))
			writeData("nightsisterShapeshifter:crystalCount:blue", readData("nightsisterShapeshifter:crystalCount:blue") + 1)
			writeStringData("nightsisterShapeshifter:crystalColor" .. SceneObject(pCrystal):getObjectID(), "blue")
			SceneObject(pCrystal):setCustomObjectName("Pretend this is a blue crystal") -- Temporary
		end
		writeData("nightsisterShapeshifter:crystalID" .. i, SceneObject(pCrystal):getObjectID())
		TangibleObject(pCrystal):setMaxCondition("200000")
		createObserver(OBJECTDESTRUCTION, self.scriptName, "notifyCrystalDestroyed", pCrystal)

		self:storeObjectID(pCrystal)
	end

	createEvent(2 * 60 * 60 * 1000, self.scriptName, "finishEncounter", nil, "")
	createEvent(10 * 1000, self.scriptName, "doHealingPulse", nil, "")
	createEvent(math.random(45, 60) * 1000, self.scriptName, "doBossMechanic", nil, "")
end

---- Shapeshift Mechanic
function nightsisterShapeshifter:shapeshift(pBoss, num)
	if (pBoss == nil) then
		return
	end

	local count = 0
	if (num ~= nil and num > 0) then
		count = num
	end

	if (count == 15) then
		printLuaError("nightsisterShapeshifter could not find a new shape to shift into")
		return
	end

	local bossState = readData("nightsisterShapeshifter:bossState")
	local rancorState = readData("nightsisterShapeshifter:bossShape:rancor")
	local flierState = readData("nightsisterShapeshifter:bossShape:flier")
	local spiderState = readData("nightsisterShapeshifter:bossShape:spider")

	if (bossState == 1) then
		local shape = math.random(1, 3) + 1
		if (shape == 2) then
			if (rancorState == 1) then
				writeData("nightsisterShapeshifter:bossState", 2)
				self:doChange(pBoss, self.bossShapes[shape])
			else
				count = count + 1
				return self:shapeshift(pBoss, count)
			end
		elseif (shape == 3) then
			if (flierState == 1) then
				writeData("nightsisterShapeshifter:bossState", 3)
				self:doChange(pBoss, self.bossShapes[shape])
			else
				count = count + 1
				return self:shapeshift(pBoss, count)
			end
		elseif (shape == 4) then
			if (spiderState == 1) then
				writeData("nightsisterShapeshifter:bossState", 4)
				self:doChange(pBoss, self.bossShapes[shape])
			else
				count = count + 1
				return self:shapeshift(pBoss, count)
			end
		end
	elseif (bossState > 1 and bossState ~= 5) then
		if (rancorState == 0 and flierState == 0 and spiderState == 0) then
			writeData("nightsisterShapeshifter:bossState", 5)
		else
			writeData("nightsisterShapeshifter:bossState", 1)
		end
		self:doChange(pBoss, self.bossShapes[1])
	end
end

function nightsisterShapeshifter:doChange(pMobile, template)
	local xPos = SceneObject(pMobile):getWorldPositionX()
	local zPos = SceneObject(pMobile):getWorldPositionZ()
	local yPos = SceneObject(pMobile):getWorldPositionY()

	self:destroyObject(pMobile)

	local pBoss = spawnMobile(self.planetName, template, 0, xPos, zPos, yPos, math.random(1, 360), 0)
	CreatureObject(pBoss):playEffect("clienteffect/entertainer_smoke_bomb_level_1.cef", "")
	writeData("nightsisterShapeshifter:bossID", SceneObject(pBoss):getObjectID())
	createObserver(DAMAGERECEIVED, self.scriptName, "notifyDamageReceived", pBoss)
	createObserver(OBJECTDESTRUCTION, self.scriptName, "notifyBossDestroyed", pBoss)

	self:storeObjectID(pBoss)
end

---- Boss Mechanics
function nightsisterShapeshifter:doBossMechanic()
	local pBoss = getSceneObject(readData("nightsisterShapeshifter:bossID"))
	local bossState = readData("nightsisterShapeshifter:bossState")

	if (pBoss == nil or CreatureObject(pBoss):isDead()) then
		return
	end

	if (bossState == 1 or bossState == 5) then
		self:doDrainMechanic(pBoss)
	elseif (bossState == 3) then
		local n = math.random(1, 2)
		if (n == 1) then
			self:doGustMechanic(pBoss)
		else
			self:doScreechMechanic(pBoss)
		end
	elseif (bossState == 4) then
		self:doCloudMechanic(pBoss)
	end

	createEvent(math.random(45, 60) * 1000, self.scriptName, "doBossMechanic", nil, "")
end

function nightsisterShapeshifter:doDrainMechanic(pBoss)
	if (pBoss == nil or CreatureObject(pBoss):isDead()) then
		return
	end

	local playerTable = SceneObject(pBoss):getPlayersInRange(25)

	if (playerTable == nil) then
		return
	end

	local pPlayer = playerTable[math.random(1, #playerTable)]
	local playerName = CreatureObject(pPlayer):getFirstName()

	CreatureObject(pBoss):doCombatAnimation(pPlayer, "force_drain_1")

	for i = 0, 6, 3 do
		CreatureObject(pPlayer):inflictDamage(pBoss, i, CreatureObject(pPlayer):getMaxHAM(i) * 0.5, 1)

		local newHAM = CreatureObject(pBoss):getHAM(i) + CreatureObject(pPlayer):getMaxHAM(i) * 2
		if (newHAM > CreatureObject(pBoss):getMaxHAM(i)) then
			newHAM = CreatureObject(pBoss):getMaxHAM(i)
		end

		CreatureObject(pBoss):setHAM(i, newHAM)
	end
end

function nightsisterShapeshifter:doGustMechanic(pBoss)
	if (pBoss == nil or CreatureObject(pBoss):isDead()) then
		return
	end

	local playerTable = SceneObject(pBoss):getPlayersInRange(40)

	if (playerTable == nil) then
		return
	end

	for i = 1, #playerTable, 1 do
		local pPlayer = playerTable[i]

		if (pPlayer ~= nil) then
			if (not CreatureObject(pPlayer):isDead()) then
				CreatureObject(pPlayer):setPosture(KNOCKEDDOWN)
			end
		end
		for j = 0, 6, 3 do
			CreatureObject(pPlayer):inflictDamage(pBoss, j, CreatureObject(pPlayer):getMaxHAM(j) * 0.1, 1)
		end
	end
end

function nightsisterShapeshifter:doScreechMechanic(pBoss)
	if (pBoss == nil or CreatureObject(pBoss):isDead()) then
		return
	end

	local angleStart = SceneObject(pBoss):getDirectionAngle() - self.screechCone / 2

	if (angleStart < 0) then
		angleStart = 360 + angleStart
	end

	local angleEnd = angleStart + self.screechCone

	if (angleEnd > 360) then
		angleEnd = self.screechCone - (360 - angleStart)
	end

	local playerTable = SceneObject(pBoss):getPlayersInRange(30)

	if (playerTable == nil) then
		return
	end

	for i = 1, #playerTable, 1 do
		local pPlayer = playerTable[i]
		local x1 = CreatureObject(pBoss):getWorldPositionX()
		local y1 = CreatureObject(pBoss):getWorldPositionY()
		local x2 = CreatureObject(pPlayer):getWorldPositionX()
		local y2 = CreatureObject(pPlayer):getWorldPositionY()

		local angle = math.atan2(x2 - x1, y2 - y1) * 180 / math.pi

		if (angle < 0) then
			angle = 360 + angle
		end

		if (angle >= angleStart and angle <= angleEnd) then
			for j = 0, 6, 3 do
				CreatureObject(pPlayer):inflictDamage(pBoss, j, CreatureObject(pPlayer):getMaxHAM(j) * 0.2, 1)
			end
			CreatureObject(pPlayer):addDotState(pBoss, BLEEDING, 150, HEALTH, 60, 100, SceneObject(pBoss):getObjectID(), 0)
			CreatureObject(pPlayer):addDotState(pBoss, BLEEDING, 150, ACTION, 60, 100, SceneObject(pBoss):getObjectID(), 0)
			CreatureObject(pPlayer):addDotState(pBoss, BLEEDING, 150, MIND, 60, 100, SceneObject(pBoss):getObjectID(), 0)
		end
	end
end

function nightsisterShapeshifter:doCloudMechanic(pBoss)
	if (pBoss == nil or CreatureObject(pBoss):isDead()) then
		return
	end

	local playerTable = SceneObject(pBoss):getPlayersInRange(40)

	if (playerTable == nil) then
		return
	end

	local shuffledPlayerTable = self:shuffleTable(playerTable)

	for i = 1, math.ceil(#shuffledPlayerTable / 5), 1 do
		local pPlayer = shuffledPlayerTable[i]
		self:createCloud(pPlayer)
	end
end

function nightsisterShapeshifter:createCloud(pPlayer)
	if (pPlayer == nil) then
		return
	end

	local xPos = CreatureObject(pPlayer):getWorldPositionX()
	local yPos = CreatureObject(pPlayer):getWorldPositionY()
	local zPos = getTerrainHeight(pPlayer, xPos, yPos)

	local pSceneObject = spawnSceneObject(self.planetName, "object/static/particle/pt_miasma_of_fog_greenish.iff", xPos, zPos, yPos, 0, 0)
	createEvent(30 * 1000, self.scriptName, "destroyObject", pSceneObject, "")
	self:doCloudDamage(pSceneObject)
end

function nightsisterShapeshifter:doCloudDamage(pSceneObject)
	if (pSceneObject == nil) then
		return
	end

	local playerTable = SceneObject(pSceneObject):getPlayersInRange(self.poisonCloudRadius)

	if (playerTable == nil) then
		createEvent(3 * 1000, self.scriptName, "doCloudDamage", pSceneObject, "")
		return
	end

	for i = 1, #playerTable, 1 do
		local pPlayer = playerTable[i]
		local curDist = SceneObject(pPlayer):getDistanceTo(pSceneObject)

		if (curDist <= self.poisonCloudRadius) then
			CreatureObject(pPlayer):addDotState(pSceneObject, POISONED, 250, HEALTH, 60, 100, SceneObject(pSceneObject):getObjectID(), 0)
			CreatureObject(pPlayer):addDotState(pSceneObject, POISONED, 250, ACTION, 60, 100, SceneObject(pSceneObject):getObjectID(), 0)
			CreatureObject(pPlayer):addDotState(pSceneObject, POISONED, 250, MIND, 60, 100, SceneObject(pSceneObject):getObjectID(), 0)
		end
	end

	createEvent(3 * 1000, self.scriptName, "doCloudDamage", pSceneObject, "")
end

---- Healing Mechanic
function nightsisterShapeshifter:doHealingPulse()
	local bossState = readData("nightsisterShapeshifter:bossState")
	local pBoss = getSceneObject(readData("nightsisterShapeshifter:bossID"))

	if (bossState == 1) then
		for i = 1, self.crystalCount do
			local pCrystal = getSceneObject(readData("nightsisterShapeshifter:crystalID" .. i))
			if (pCrystal ~= nil) then
				TangibleObject(pCrystal):setConditionDamage(0)
			end
		end
	elseif (bossState == 2) then
		for i = 1, self.crystalCount do
			local pCrystal = getSceneObject(readData("nightsisterShapeshifter:crystalID" .. i))
			if (pCrystal ~= nil and readStringData("nightsisterShapeshifter:crystalColor" .. SceneObject(pCrystal):getObjectID()) ~= "red") then
				TangibleObject(pCrystal):setConditionDamage(0)
			end
		end
		if (readData("nightsisterShapeshifter:crystalCount:red") > 0) then
			local pBoss = getSceneObject(readData("nightsisterShapeshifter:bossID"))
			if (pBoss ~= nil) then
				self:healBoss(pBoss)
			end
		end
	elseif (bossState == 3) then
		for i = 1, self.crystalCount do
			local pCrystal = getSceneObject(readData("nightsisterShapeshifter:crystalID" .. i))
			if (pCrystal ~= nil and readStringData("nightsisterShapeshifter:crystalColor" .. SceneObject(pCrystal):getObjectID()) ~= "green") then
				TangibleObject(pCrystal):setConditionDamage(0)
			end
		end
		if (readData("nightsisterShapeshifter:crystalCount:green") > 0) then
			local pBoss = getSceneObject(readData("nightsisterShapeshifter:bossID"))
			if (pBoss ~= nil) then
				self:healBoss(pBoss)
			end
		end
	elseif (bossState == 4) then
		for i = 1, self.crystalCount do
			local pCrystal = getSceneObject(readData("nightsisterShapeshifter:crystalID" .. i))
			if (pCrystal ~= nil and readStringData("nightsisterShapeshifter:crystalColor" .. SceneObject(pCrystal):getObjectID()) ~= "blue") then
				TangibleObject(pCrystal):setConditionDamage(0)
			end
		end
		if (readData("nightsisterShapeshifter:crystalCount:blue") > 0) then
			local pBoss = getSceneObject(readData("nightsisterShapeshifter:bossID"))
			if (pBoss ~= nil) then
				self:healBoss(pBoss)
			end
		end
	elseif (bossState == 5) then
		return
	end
	createEvent(10 * 1000, self.scriptName, "doHealingPulse", nil, "")
end

function nightsisterShapeshifter:healBoss(pBoss)
	if (pBoss == nil) then
		return
	end

	for i = 0, 6, 3 do
		local maxHAM = CreatureObject(pBoss):getMaxHAM(i)
		CreatureObject(pBoss):setWounds(i, 0)
		CreatureObject(pBoss):setShockWounds(i, 0)
		CreatureObject(pBoss):setHAM(i, maxHAM)
	end
end

----Observers
function nightsisterShapeshifter:notifyDamageReceived(pBoss, pPlayer, damage)
	if (pBoss == nil) then
		return 0
	end

	if (self:bossStateLogic(pBoss, 0.5, "nightsisterShapeshifter:bossState", 1)) then
		self:shapeshift(pBoss)
	elseif (self:bossStateLogic(pBoss, 0.5, "nightsisterShapeshifter:bossState", 2)) then
		if (readData("nightsisterShapeshifter:crystalCount:red") > 0) then
			self:healBoss(pBoss)
		end
	elseif (self:bossStateLogic(pBoss, 0.5, "nightsisterShapeshifter:bossState", 3)) then
		if (readData("nightsisterShapeshifter:crystalCount:green") > 0) then
			self:healBoss(pBoss)
		end
	elseif (self:bossStateLogic(pBoss, 0.5, "nightsisterShapeshifter:bossState", 4)) then
		if (readData("nightsisterShapeshifter:crystalCount:blue") > 0) then
			self:healBoss(pBoss)
		end
	end
	return 0
end

function nightsisterShapeshifter:notifyBossDestroyed(pBoss, pPlayer)
	if (pBoss == nil) then
		return 0
	end

	local bossState = readData("nightsisterShapeshifter:bossState")

	if (bossState == 2) then
		writeData("nightsisterShapeshifter:bossShape:rancor", 0)
		self:shapeshift(pBoss)
	elseif (bossState == 3) then
		writeData("nightsisterShapeshifter:bossShape:flier", 0)
		self:shapeshift(pBoss)
	elseif (bossState == 4) then
		writeData("nightsisterShapeshifter:bossShape:spider", 0)
		self:shapeshift(pBoss)
	elseif (bossState == 5) then
		--self:finishEncounter(true)
	end
	return 1
end

function nightsisterShapeshifter:notifyCrystalDestroyed(pCrystal, pPlayer)
	if (pCrystal == nil) then
		return 0
	end

	local color = readStringData("nightsisterShapeshifter:crystalColor" .. SceneObject(pCrystal):getObjectID())
	writeData("nightsisterShapeshifter:crystalCount:" .. color, readData("nightsisterShapeshifter:crystalCount:" .. color) - 1)
	self:destroyObject(pCrystal)

	local pBoss = getSceneObject(readData("nightsisterShapeshifter:bossID"))
	self:shapeshift(pBoss)
	return 1
end

---- Utilities
-- Cleanup
function nightsisterShapeshifter:destroyObject(pObject)
	if (pObject == nil) then
		return
	end

	if (SceneObject(pObject):isAiAgent()) then
		CreatureObject(pObject):setPvpStatusBitmask(0)
		forcePeace(pObject)
	end
	SceneObject(pObject):destroyObjectFromWorld()
end

function nightsisterShapeshifter:cleanupScene()
	local spawnedObjects = readStringData("nightsisterShapeshifter:spawnedObjects")
	local spawnedObjectsTable = HelperFuncs:splitString(spawnedObjects, ",")
	for i = 1, #spawnedObjectsTable, 1 do
		local pObject = getSceneObject(tonumber(spawnedObjectsTable[i]))
		if (pObject ~= nil) then
			if (SceneObject(pObject):isAiAgent()) then
				CreatureObject(pObject):setPvpStatusBitmask(0)
				forcePeace(pObject)
			end
			SceneObject(pObject):destroyObjectFromWorld()
		end
	end

	deleteStringData("nightsisterShapeshifter:spawnedObjects")
	deleteData("nightsisterShapeshifter:bossState")
	deleteData("nightsisterShapeshifter:bossShape:rancor")
	deleteData("nightsisterShapeshifter:bossShape:flier")
	deleteData("nightsisterShapeshifter:bossShape:spider")
	deleteData("nightsisterShapeshifter:crystalCount:blue")
	deleteData("nightsisterShapeshifter:crystalCount:red")
	deleteData("nightsisterShapeshifter:crystalCount:green")
end

-- Store spawned objects
function nightsisterShapeshifter:storeObjectID(pObject)
	if (pObject == nil) then
		return
	end
	local objectID = SceneObject(pObject):getObjectID()
	writeStringData("nightsisterShapeshifter:spawnedObjects", readStringData("nightsisterShapeshifter:spawnedObjects") .. "," .. objectID)
end

-- Fisher-Yates shuffle
function nightsisterShapeshifter:shuffleTable(tInput)
	math.randomseed(os.time())
	local tReturn = {}
	for i = #tInput, 1, -1 do
		local j = math.random(i)
		tInput[i], tInput[j] = tInput[j], tInput[i]
		table.insert(tReturn, tInput[i])
	end
	return tReturn
end

-- Calculating evenly spaced points on the perimeter of a circle
function nightsisterShapeshifter:getCircleSpawnPoints(centerX, centerY, radius, totalPoints)
	local pivotX, pivotY
	local spawnPoints = {}
	local theta = ((math.pi * 2) / totalPoints);

	for i = 1, totalPoints do
		local angle = theta * i
		pivotX = radius * math.cos(angle) + centerX;
		pivotY = radius * math.sin(angle) + centerY;
		table.insert(spawnPoints, {x = pivotX, y = pivotY})
	end
	return spawnPoints
end

-- Boss state logic
function nightsisterShapeshifter:bossStateLogic(pBoss, percent, stateString, checkState)
	if (pBoss == nil) then
		return false
	end

	if (readData(stateString) == checkState) then
		for i = 0, 6, 3 do
			if (CreatureObject(pBoss):getHAM(i) <= CreatureObject(pBoss):getMaxHAM(i) * percent) then
				return true
			end
		end
	end
	return false
end
