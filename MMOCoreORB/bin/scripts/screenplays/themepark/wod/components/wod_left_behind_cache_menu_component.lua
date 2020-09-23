wodLeftBehindCacheMenuComponent = {}

function wodLeftBehindCacheMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end

	if (not CreatureObject(pPlayer):isInRangeWithObject(pSceneObject, 5)) then
		return
	end

	local menuResponse = LuaObjectMenuResponse(pMenuResponse)

	if (SceneObject(pSceneObject):isASubChildOf(pPlayer)) then
		menuResponse:addRadialMenuItem(20, 3, "@theme_park_wod/wod_left_behind:task02_retrieve_menu_text")
	end
end

function wodLeftBehindCacheMenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
	if (pSceneObject == nil or pPlayer == nil) then
		return 0
	end

	if (selectedID == 20) then
		local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

		if (pInventory == nil) then
			return
		end

		if (SceneObject(pInventory):isContainerFullRecursive()) then
			creatureObject(pPlayer):sendSystemMessage("Couldn't retrieve cache, your inventory is full.")
			return
		end

		creatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod_left_behind:task02_start_message")
		giveItem(pInventory, "object/tangible/theme_park/wod/wod_crafting_alter_key.iff", -1)
		wodRubinaEpilogue:startEncounter(pPlayer)
	end
	return 0
end
