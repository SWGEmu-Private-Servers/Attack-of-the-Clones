wodProSeedJarMenuComponent = {}

function wodProSeedJarMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end
	
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	menuResponse:addRadialMenuItem(20, 3, "Open Jar")
end

function wodProSeedJarMenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
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

		local randType = getRandomNumber(1, 8)
		local pItem = giveItem(pInventory, "object/tangible/theme_park/wod/schematics/wod_pro_tree_0" .. randType .. "_schematic.iff", -1)

		if (pItem ~= nil) then
			SceneObject(pItem):sendTo(pPlayer)
		end
	end
	return 0
end

wodProNSSeedJar01MenuComponent = {}

function wodProNSSeedJar01MenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end
	
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	menuResponse:addRadialMenuItem(20, 3, "Open Jar")
end

function wodProNSSeedJar01MenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
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

		local pItem = giveItem(pInventory, "object/tangible/theme_park/wod/schematics/wod_ns_pro_tree_01_schematic.iff", -1)

		if (pItem ~= nil) then
			SceneObject(pItem):sendTo(pPlayer)
		end
	end
	return 0
end

wodProNSSeedJar02MenuComponent = {}

function wodProNSSeedJar02MenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end
	
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	menuResponse:addRadialMenuItem(20, 3, "Open Jar")
end

function wodProNSSeedJar02MenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
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

		local pItem = giveItem(pInventory, "object/tangible/theme_park/wod/schematics/wod_ns_pro_tree_02_schematic.iff", -1)

		if (pItem ~= nil) then
			SceneObject(pItem):sendTo(pPlayer)
		end
	end
	return 0
end

wodProNSSeedJar03MenuComponent = {}

function wodProNSSeedJar03MenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end
	
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	menuResponse:addRadialMenuItem(20, 3, "Open Jar")
end

function wodProNSSeedJar03MenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
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

		local pItem = giveItem(pInventory, "object/tangible/theme_park/wod/schematics/wod_ns_pro_tree_03_schematic.iff", -1)

		if (pItem ~= nil) then
			SceneObject(pItem):sendTo(pPlayer)
		end
	end
	return 0
end

wodProNSSeedJar04MenuComponent = {}

function wodProNSSeedJar04MenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end
	
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	menuResponse:addRadialMenuItem(20, 3, "Open Jar")
end

function wodProNSSeedJar04MenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
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

		local pItem = giveItem(pInventory, "object/tangible/theme_park/wod/schematics/wod_ns_pro_tree_04_schematic.iff", -1)

		if (pItem ~= nil) then
			SceneObject(pItem):sendTo(pPlayer)
		end
	end
	return 0
end

wodProNSSeedJar05MenuComponent = {}

function wodProNSSeedJar05MenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end
	
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	menuResponse:addRadialMenuItem(20, 3, "Open Jar")
end

function wodProNSSeedJar05MenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
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

		local pItem = giveItem(pInventory, "object/tangible/theme_park/wod/schematics/wod_ns_pro_tree_05_schematic.iff", -1)

		if (pItem ~= nil) then
			SceneObject(pItem):sendTo(pPlayer)
		end
	end
	return 0
end

wodProNSSeedJar06MenuComponent = {}

function wodProNSSeedJar06MenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end
	
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	menuResponse:addRadialMenuItem(20, 3, "Open Jar")
end

function wodProNSSeedJar06MenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
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

		local pItem = giveItem(pInventory, "object/tangible/theme_park/wod/schematics/wod_ns_pro_tree_06_schematic.iff", -1)

		if (pItem ~= nil) then
			SceneObject(pItem):sendTo(pPlayer)
		end
	end
	return 0
end

wodProNSSeedJar07MenuComponent = {}

function wodProNSSeedJar07MenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end
	
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	menuResponse:addRadialMenuItem(20, 3, "Open Jar")
end

function wodProNSSeedJar07MenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
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

		local pItem = giveItem(pInventory, "object/tangible/theme_park/wod/schematics/wod_ns_pro_tree_07_schematic.iff", -1)

		if (pItem ~= nil) then
			SceneObject(pItem):sendTo(pPlayer)
		end
	end
	return 0
end

wodProNSSeedJar08MenuComponent = {}

function wodProNSSeedJar08MenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end
	
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	menuResponse:addRadialMenuItem(20, 3, "Open Jar")
end

function wodProNSSeedJar08MenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
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

		local pItem = giveItem(pInventory, "object/tangible/theme_park/wod/schematics/wod_ns_pro_tree_08_schematic.iff", -1)

		if (pItem ~= nil) then
			SceneObject(pItem):sendTo(pPlayer)
		end
	end
	return 0
end

wodProSMSeedJar01MenuComponent = {}

function wodProSMSeedJar01MenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end
	
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	menuResponse:addRadialMenuItem(20, 3, "Open Jar")
end

function wodProSMSeedJar01MenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
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

		local pItem = giveItem(pInventory, "object/tangible/theme_park/wod/schematics/wod_sm_pro_tree_01_schematic.iff", -1)

		if (pItem ~= nil) then
			SceneObject(pItem):sendTo(pPlayer)
		end
	end
	return 0
end

wodProSMSeedJar02MenuComponent = {}

function wodProSMSeedJar02MenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end
	
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	menuResponse:addRadialMenuItem(20, 3, "Open Jar")
end

function wodProSMSeedJar02MenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
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

		local pItem = giveItem(pInventory, "object/tangible/theme_park/wod/schematics/wod_sm_pro_tree_02_schematic.iff", -1)

		if (pItem ~= nil) then
			SceneObject(pItem):sendTo(pPlayer)
		end
	end
	return 0
end

wodProSMSeedJar03MenuComponent = {}

function wodProSMSeedJar03MenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end
	
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	menuResponse:addRadialMenuItem(20, 3, "Open Jar")
end

function wodProSMSeedJar03MenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
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

		local pItem = giveItem(pInventory, "object/tangible/theme_park/wod/schematics/wod_sm_pro_tree_03_schematic.iff", -1)

		if (pItem ~= nil) then
			SceneObject(pItem):sendTo(pPlayer)
		end
	end
	return 0
end

wodProSMSeedJar04MenuComponent = {}

function wodProSMSeedJar04MenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end
	
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	menuResponse:addRadialMenuItem(20, 3, "Open Jar")
end

function wodProSMSeedJar04MenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
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

		local pItem = giveItem(pInventory, "object/tangible/theme_park/wod/schematics/wod_sm_pro_tree_04_schematic.iff", -1)

		if (pItem ~= nil) then
			SceneObject(pItem):sendTo(pPlayer)
		end
	end
	return 0
end

wodProSMSeedJar05MenuComponent = {}

function wodProSMSeedJar05MenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end
	
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	menuResponse:addRadialMenuItem(20, 3, "Open Jar")
end

function wodProSMSeedJar05MenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
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

		local pItem = giveItem(pInventory, "object/tangible/theme_park/wod/schematics/wod_sm_pro_tree_05_schematic.iff", -1)

		if (pItem ~= nil) then
			SceneObject(pItem):sendTo(pPlayer)
		end
	end
	return 0
end

wodProSMSeedJar06MenuComponent = {}

function wodProSMSeedJar06MenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end
	
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	menuResponse:addRadialMenuItem(20, 3, "Open Jar")
end

function wodProSMSeedJar06MenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
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

		local pItem = giveItem(pInventory, "object/tangible/theme_park/wod/schematics/wod_sm_pro_tree_06_schematic.iff", -1)

		if (pItem ~= nil) then
			SceneObject(pItem):sendTo(pPlayer)
		end
	end
	return 0
end

wodProSMSeedJar07MenuComponent = {}

function wodProSMSeedJar07MenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end
	
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	menuResponse:addRadialMenuItem(20, 3, "Open Jar")
end

function wodProSMSeedJar07MenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
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

		local pItem = giveItem(pInventory, "object/tangible/theme_park/wod/schematics/wod_sm_pro_tree_07_schematic.iff", -1)

		if (pItem ~= nil) then
			SceneObject(pItem):sendTo(pPlayer)
		end
	end
	return 0
end

wodProSMSeedJar08MenuComponent = {}

function wodProSMSeedJar08MenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end
	
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	menuResponse:addRadialMenuItem(20, 3, "Open Jar")
end

function wodProSMSeedJar08MenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
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

		local pItem = giveItem(pInventory, "object/tangible/theme_park/wod/schematics/wod_sm_pro_tree_08_schematic.iff", -1)

		if (pItem ~= nil) then
			SceneObject(pItem):sendTo(pPlayer)
		end
	end
	return 0
end