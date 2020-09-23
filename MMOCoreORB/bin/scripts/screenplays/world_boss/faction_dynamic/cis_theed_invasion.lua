-- Written by: Stack

-- Simple spawn and hang out when a faction tick is hit
local ObjectManager = require("managers.object.object_manager")
local CombatHelper = require("screenplays.utils.combatHelper")


cisTheedInvasion = ScreenPlay:new {
	scriptName = "cisTheedInvasion",
	locations = {
		{
			planetName = "naboo",
			x = -4880,
			z = 6,
			y = 4105,
			radius = 25,
		},
		{
			planetName = "naboo",
			x = -5014,
			z = 6,
			y = 4063,
			radius = 25,
		},
		{
			planetName = "naboo",
			x = -5411,
			z = 6,
			y = 4346,
			radius = 25,
		},
		{
			planetName = "naboo",
			x = -5836,
			z = 6,
			y = 4174,
			radius = 25,
		},
	},


	-- These will be spawned at EVERY location above
	requiredMobiles = {
		 "fbase_rebel_colonel",
		 "fbase_rebel_first_lieutenant_hard",
	 },

-- This is the "tough" category, spawned toughUnitSpawnCount amount (randomly selected)
 toughMobiles = {
		"fbase_hailfire",
		"fbase_rebel_rifleman_extreme",
		"fbase_rebel_colonel",
		"fbase_rebel_first_lieutenant_hard",
	},

-- This is the "regular" category, spawned unitSpawnCount amount (randomly selected)
  regularMobiles = {
		"cis_magnaguard",
		"cis_major_general",
		"cis_sbd",
	},

	unitSpawnCount = 4,
  toughUnitSpawnCount = 2,
	idleWander = true,

}

registerScreenPlay("cisTheedInvasion", false)


function cisTheedInvasion:start()
	print("Starting invasion")
	-- Iterate over ALL locations
	for n = 1, #self.locations do
		local loc = self.locations[n]

		for i = 1, self.unitSpawnCount do
			if (isZoneEnabled(loc.planetName)) then
				self:spawnMobile(none, i, self.regularMobiles, loc)
			end
		end
		for j = 1, self.toughUnitSpawnCount do
			if (isZoneEnabled(loc.planetName)) then
				self:spawnMobile(none, j + self.unitSpawnCount, self.toughMobiles, loc)
			end
		end


		-- then spawn in the REQIRED ones.
		for r = 1, #self.requiredMobiles do
			local mobileName = self.requiredMobiles[r]
			self:spawnSingleMobile(none, self.unitSpawnCount + self.toughUnitSpawnCount + r, mobileName , loc)
		end

	end

end

function cisTheedInvasion:stop()
	self:cleanupScene()
end

function cisTheedInvasion:cleanupScene()
	local spawnedObjects = readStringData("cisTheedInvasion:spawnedObjects")
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

	deleteStringData("cisTheedInvasion:spawnedObjects")
	deleteData("cisTheedInvasion:mobileID")
	deleteData("cisTheedInvasion:mobNumber")
	deleteData("cisTheedInvasion:numDestroyed")
end

function cisTheedInvasion:getSpawnInRadius(center, radius)
	local min = center - (radius / 2)
	local max = center + (radius / 2)

	if(max < min) then
		local temp = max
		max = min
		min = temp
	end
	local randomNum = getRandomNumber(0, max - min)
	randomNum = randomNum + min
	return randomNum
end

function cisTheedInvasion:spawnSingleMobile(none, num, mobileName, location)
	local pMobile
	local spawnPoint = {self:getSpawnInRadius(location.x, location.radius),location.z, self:getSpawnInRadius(location.y, location.radius)}
	if (spawnPoint ~= nil) then
		pMobile = spawnMobile(location.planetName, mobileName, 0, spawnPoint[1], spawnPoint[2], spawnPoint[3], getRandomNumber(360), 0)

		createObserver(OBJECTDESTRUCTION, self.scriptName, "notifyMobileDestroyed", pMobile)
		writeData("cisTheedInvasion:mobileID" .. num, SceneObject(pMobile):getObjectID())
		writeData("cisTheedInvasion:mobNumber" .. SceneObject(pMobile):getObjectID(), num)
		self:storeObjectID(pMobile)

		if (self.idleWander) then
  		AiAgent(pMobile):setAiTemplate("idlewander")
  	end

	end

end

function cisTheedInvasion:spawnMobile(none, num, mobileList, location)

	local mobileName = mobileList[ getRandomNumber(1, #mobileList) ]

	self:spawnSingleMobile(none, num, mobileName, location)
end

function cisTheedInvasion:notifyMobileDestroyed(pMobile, pAttacker)
	if (pMobile == nil or pAttacker == nil) then
		return 0
	end

	local numDestroyed = readData("cisTheedInvasion:numDestroyed")
	numDestroyed = numDestroyed + 1
	writeData("cisTheedInvasion:numDestroyed", numDestroyed)
	if(numDestroyed == (self.unitSpawnCount + self.toughUnitSpawnCount + #self.requiredMobiles) * #self.locations) then
		print("Screenplay Ended -- Cleanup in 10s -- cisTheedInvasion")
		createEvent(10000, self.scriptName, "cleanupScene", pMobile, "")

	end

	return 1
end

-- Store spawned objects
function cisTheedInvasion:storeObjectID(pObject)
	if (pObject == nil) then
		return
	end
	local objectID = SceneObject(pObject):getObjectID()
	writeStringData("cisTheedInvasion:spawnedObjects", readStringData("cisTheedInvasion:spawnedObjects") .. "," .. objectID)
end


function cisTheedInvasion:destroyObject(pObject)
	if (pObject ~= nil) then
		if (SceneObject(pObject):isAiAgent()) then
			CreatureObject(pObject):setPvpStatusBitmask(0)
			forcePeace(pObject)
		end
		SceneObject(pObject):destroyObjectFromWorld()
	end
end