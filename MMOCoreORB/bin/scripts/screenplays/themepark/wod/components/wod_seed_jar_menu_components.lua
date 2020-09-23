wodSeedJarMenuComponent = {}

function wodSeedJarMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end
	
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	menuResponse:addRadialMenuItem(20, 3, "Open Jar")
end

function wodSeedJarMenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end
	
	if (SceneObject(pSceneObject):isASubChildOf(pPlayer) == false) then
		return 0
	end

	if (selectedID == 20) then
		SceneObject(pSceneObject):destroyObjectFromWorld()
		SceneObject(pSceneObject):destroyObjectFromDatabase()

		local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

		if (pInventory == nil) then
			return 0
		end

		local randType = getRandomNumber(1, 9)
		local pItem = giveItem(pInventory, "object/tangible/theme_park/wod/schematics/wod_potted_plant_0" .. randType .. "_schematic.iff", -1)

		if (pItem ~= nil) then
			SceneObject(pItem):sendTo(pPlayer)
		end
	end
	return 0
end

wodNSSeedJarMenuComponent = {}

function wodNSSeedJarMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end
	
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	menuResponse:addRadialMenuItem(20, 3, "Open Jar")
end

function wodNSSeedJarMenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end
	
	if (SceneObject(pSceneObject):isASubChildOf(pPlayer) == false) then
		return 0
	end

	if (selectedID == 20) then
		SceneObject(pSceneObject):destroyObjectFromWorld()
		SceneObject(pSceneObject):destroyObjectFromDatabase()

		local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

		if (pInventory == nil) then
			return 0
		end

		local randType = getRandomNumber(1, 9)
		local pItem = giveItem(pInventory, "object/tangible/theme_park/wod/schematics/wod_ns_potted_plant_0" .. randType .. "_schematic.iff", -1)

		if (pItem ~= nil) then
			SceneObject(pItem):sendTo(pPlayer)
		end
	end
	return 0
end

wodSMSeedJarMenuComponent = {}

function wodSMSeedJarMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end
	
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	menuResponse:addRadialMenuItem(20, 3, "Open Jar")
end

function wodSMSeedJarMenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end
	
	if (SceneObject(pSceneObject):isASubChildOf(pPlayer) == false) then
		return 0
	end

	if (selectedID == 20) then
		SceneObject(pSceneObject):destroyObjectFromWorld()
		SceneObject(pSceneObject):destroyObjectFromDatabase()

		local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

		if (pInventory == nil) then
			return 0
		end

		local randType = getRandomNumber(1, 9)
		local pItem = giveItem(pInventory, "object/tangible/theme_park/wod/schematics/wod_sm_potted_plant_0" .. randType .. "_schematic.iff", -1)

		if (pItem ~= nil) then
			SceneObject(pItem):sendTo(pPlayer)
		end
	end
	return 0
end