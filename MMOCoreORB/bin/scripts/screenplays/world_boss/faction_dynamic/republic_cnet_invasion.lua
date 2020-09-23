-- Written by: Stack

-- Simple spawn and hang out when a faction tick is hit
local ObjectManager = require("managers.object.object_manager")
local CombatHelper = require("screenplays.utils.combatHelper")


republicCnetInvasion = ScreenPlay:new {
	scriptName = "republicCnetInvasion",
	locations = {
		{
			planetName = "corellia",
			x = -434,
			z = 6,
			y = -4343,
			radius = 50,
		},

  },


	-- These will be spawned at EVERY location above
	requiredMobiles = {
		 "rep_jedi_knight",
		 "clone_commando",
     "fbase_imperial_first_lieutenant_hard",
	 },

-- This is the "tough" category, spawned toughUnitSpawnCount amount (randomly selected)
 toughMobiles = {
		"fbase_stormtrooper_rifleman_extreme",
		"fbase_at_xt",
		"rep_at_xt",
		"clonetrooper_squad_leader",
	},

-- This is the "regular" category, spawned unitSpawnCount amount (randomly selected)
  regularMobiles = {
		"clonetrooper",
		"clone_sand_trooper",
		"clonetrooper_bombardier",
	},

	unitSpawnCount = 7,
  toughUnitSpawnCount = 5,
	idleWander = true,

}

registerScreenPlay("republicCnetInvasion", false)


function republicCnetInvasion:start()
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

function republicCnetInvasion:stop()
	self:cleanupScene()
end

function republicCnetInvasion:cleanupScene()
	local spawnedObjects = readStringData("republicCnetInvasion:spawnedObjects")
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

	deleteStringData("republicCnetInvasion:spawnedObjects")
	deleteData("republicCnetInvasion:mobileID")
	deleteData("republicCnetInvasion:mobNumber")
	deleteData("republicCnetInvasion:numDestroyed")
end

function republicCnetInvasion:getSpawnInRadius(center, radius)
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

function republicCnetInvasion:spawnSingleMobile(none, num, mobileName, location)
  local pMobile
	local spawnPoint = {self:getSpawnInRadius(location.x, location.radius),location.z, self:getSpawnInRadius(location.y, location.radius)}
	if (spawnPoint ~= nil) then
		pMobile = spawnMobile(location.planetName, mobileName, 0, spawnPoint[1], spawnPoint[2], spawnPoint[3], getRandomNumber(360), 0)

		createObserver(OBJECTDESTRUCTION, self.scriptName, "notifyMobileDestroyed", pMobile)
		writeData("republicCnetInvasion:mobileID" .. num, SceneObject(pMobile):getObjectID())
		writeData("republicCnetInvasion:mobNumber" .. SceneObject(pMobile):getObjectID(), num)
		self:storeObjectID(pMobile)

    if (self.idleWander) then
  		AiAgent(pMobile):setAiTemplate("idlewander")
  	end

	end

end

function republicCnetInvasion:spawnMobile(none, num, mobileList, location)

	local mobileName = mobileList[ getRandomNumber(1, #mobileList) ]

	self:spawnSingleMobile(none, num, mobileName, location)
end

function republicCnetInvasion:notifyMobileDestroyed(pMobile, pAttacker)
	if (pMobile == nil or pAttacker == nil) then
		return 0
	end

	local numDestroyed = readData("republicCnetInvasion:numDestroyed")
	numDestroyed = numDestroyed + 1
	writeData("republicCnetInvasion:numDestroyed", numDestroyed)
	if(numDestroyed == (self.unitSpawnCount + self.toughUnitSpawnCount + #self.requiredMobiles) * #self.locations) then
		print("Screenplay Ended -- Cleanup in 10s -- republicCnetInvasion")
		createEvent(10000, self.scriptName, "cleanupScene", pMobile, "")

	end

	return 1
end

-- Store spawned objects
function republicCnetInvasion:storeObjectID(pObject)
	if (pObject == nil) then
		return
	end
	local objectID = SceneObject(pObject):getObjectID()
	writeStringData("republicCnetInvasion:spawnedObjects", readStringData("republicCnetInvasion:spawnedObjects") .. "," .. objectID)
end

function republicCnetInvasion:destroyObject(pObject)
	if (pObject ~= nil) then
		if (SceneObject(pObject):isAiAgent()) then
			CreatureObject(pObject):setPvpStatusBitmask(0)
			forcePeace(pObject)
		end
		SceneObject(pObject):destroyObjectFromWorld()
	end
end
