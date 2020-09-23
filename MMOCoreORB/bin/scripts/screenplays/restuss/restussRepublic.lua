restussRepublic = ScreenPlay:new {
	scriptName = "restussRepublic",
	planet = "rori",
}

registerScreenPlay("restussRepublic", false)

local ObjectManager = require("managers.object.object_manager")

function restussRepublic:start()
	if (isZoneEnabled(self.planet)) then
		self:spawnMobiles()
	end
end

function restussRepublic:spawnMobiles()
	local pMobile = spawnMobile(self.planet, "restussmerch_rep", -1, 5228, 80, 5831.4, -112, 0) --Temporary Mobile and location, items below will be set in the actual mobile

	local pMobile = spawnMobile(self.planet, "restuss_anakin", -1, 5233, 80, 5830.4, -112, 0) --Temporary Mobile and location, items below will be set in the actual mobile
	self:setMoodString(pMobile, "worried")

	local pEscort = spawnMobile(self.planet, "restuss_omega01", -1, 5448, 80, 5515.4, -112, 0) --Temporary Mobile and location, items below will be set in the actual mobile
end

function restussRepublic:handleReward(pPlayer)
	ThemeParkLogic:giveCredits(pPlayer, 10000)
	local pInventory = SceneObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return
	end

	local pItem = giveItem(pInventory, "object/tangible/loot/misc/event_token_restuss.iff", -1)

	if (pItem ~= nil) then
		SceneObject(pItem):sendTo(pPlayer)
	end
end
