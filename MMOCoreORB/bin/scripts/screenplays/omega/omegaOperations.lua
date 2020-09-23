omegaOperations = ScreenPlay:new {
	scriptName = "omegaOperations",
	planet = "dantooine",
}

registerScreenPlay("omegaOperations", false)

local ObjectManager = require("managers.object.object_manager")

function omegaOperations:start()
	if (isZoneEnabled(self.planet)) then
		self:spawnMobiles()
	end
end

function omegaOperations:spawnMobiles()
	local pMobile = spawnMobile(self.planet, "etain", -1, 5233, 80, 5830.4, -112, 0) --Temporary Mobile and location, items below will be set in the actual mobile
	self:setMoodString(pMobile, "worried")

	local pEscort = spawnMobile(self.planet, "omega01", -1, 5448, 80, 5515.4, -112, 0) --Temporary Mobile and location, items below will be set in the actual mobile
end

function omegaOperations:handleReward(pPlayer)
	CreatureObject(pPlayer):sendSystemMessage("Temporary Message: Imagine this is a nice sandcrawler blueprint for you to make.")
	ThemeParkLogic:giveCredits(pPlayer, 20000)
	local pInventory = SceneObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return
	end

	local pItem = giveItem(pInventory, "object/weapon/ranged/carbine/carbine_nym_slugthrower.iff", -1)

	if (pItem ~= nil) then
		SceneObject(pItem):sendTo(pPlayer)
	end
end
