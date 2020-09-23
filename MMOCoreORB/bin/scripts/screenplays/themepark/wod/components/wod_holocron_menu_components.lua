wodBrokenHolocronMenuComponent = {}

function wodBrokenHolocronMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end

	if (not CreatureObject(pPlayer):isInRangeWithObject(pSceneObject, 5)) then
		return
	end

	local menuResponse = LuaObjectMenuResponse(pMenuResponse)

	if (SceneObject(pSceneObject):isASubChildOf(pPlayer)) then
		menuResponse:addRadialMenuItem(20, 3, "@theme_park_wod/wod:examine_holo")
	end
end

function wodBrokenHolocronMenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
	if (pSceneObject == nil or pPlayer == nil) then
		return 0
	end

	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return 0
	end

	if (SceneObject(pSceneObject):isASubChildOf(pPlayer) == false) then
		return 0
	end

	if (selectedID == 20) then
		if (not CreatureObject(pPlayer):hasSkill("crafting_artisan_novice")) then
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:not_trader")
			return 0 
		end

		PlayerObject(pGhost):addRewardedSchematic("object/draft_schematic/item/theme_park/wod_crafting_template.iff", 2, 1, true)
		CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:got_schem")

		SceneObject(pSceneObject):destroyObjectFromWorld()
		SceneObject(pSceneObject):destroyObjectFromDatabase()
	end
	return 0
end

wodHolocronMenuComponent = {}

function wodHolocronMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end
	
	if (not CreatureObject(pPlayer):isInRangeWithObject(pSceneObject, 5)) then
		return
	end
	
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)

	if (SceneObject(pSceneObject):isASubChildOf(pPlayer)) then
		menuResponse:addRadialMenuItem(20, 3, "@theme_park_wod/wod:activate_holo")
	end
end

function wodHolocronMenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
	if (pSceneObject == nil or pPlayer == nil) then
		return 0
	end

	if (selectedID == 20) then
		local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

		if (pInventory == nil) then
			return
		end

		SceneObject(pSceneObject):destroyObjectFromWorld()
		SceneObject(pSceneObject):destroyObjectFromDatabase()
		createLoot(pInventory, "wod_logic_unit", -1, true)
	end
	return 0
end