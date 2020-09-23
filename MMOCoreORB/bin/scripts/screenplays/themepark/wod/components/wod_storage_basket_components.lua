wodStorageBasketTokenData = {--ScreenPlayData string, ScreenPlayData key, display string, full template string (without shared_)
	{"wodThemeparkToken", "amber", "Dathomir Amber", "object/tangible/content/wod_token_1.iff"},
	{"wodThemeparkToken", "silk", "Spider Silk", "object/tangible/content/wod_token_2.iff"},
	{"wodThemeparkToken", "teeth", "Rancor Teeth", "object/tangible/content/wod_token_3.iff"},
	{"wodThemeparkToken", "leather", "Whuffa Leather", "object/tangible/content/wod_token_4.iff"},
	{"wodThemeparkToken", "herbs", "Rare Dried Herbs", "object/tangible/content/wod_token_5.iff"},
}

wodStorageBasketMenuComponent = {}

function wodStorageBasketMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end
	
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	menuResponse:addRadialMenuItem(122, 3, "Withdraw Item")
end

function wodStorageBasketMenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end

	if (SceneObject(pSceneObject):isASubChildOf(pPlayer) == false) then
		return 0
	end

	if (selectedID == 122) then
		local sui = SuiListBox.new("wodStorageBasketMenuComponent", "withdrawTokenListCallback")

		sui.setTargetNetworkId(SceneObject(pPlayer):getObjectID())

		sui.setTitle("Item Withdrawal")
		sui.setPrompt("Select which item to withdraw from your storage basket.")

		for i = 1, 5 do
			local tokenData = tonumber(readScreenPlayData(pPlayer, wodStorageBasketTokenData[i][1], wodStorageBasketTokenData[i][2]))
			if (tokenData == nil or tokenData == "") then
				tokenData = 0
			end

			if (tokenData >= 1) then
				sui.add(wodStorageBasketTokenData[i][3], "")
			end
		end

		sui.sendTo(pPlayer)
	end
	return 0
end

function wodStorageBasketMenuComponent:withdrawTokenListCallback(pPlayer, pSui, eventIndex, args)
	local cancelPressed = (eventIndex == 1)
	
	if (cancelPressed) then
		return
	end
	
	local chosenToken = args + 1
	writeData(SceneObject(pPlayer):getObjectID() .. "wodStorageBasket:tokenToWithdraw", chosenToken)
	local tokenData = tonumber(readScreenPlayData(pPlayer, wodStorageBasketTokenData[chosenToken][1], wodStorageBasketTokenData[chosenToken][2]))
	
	local sui = SuiTransferBox.new("wodStorageBasketMenuComponent", "withdrawTokenTransferCallback")
		
	sui.setTargetNetworkId(SceneObject(pPlayer):getObjectID())
	sui.setTitle("Withdraw " .. wodStorageBasketTokenData[chosenToken][3])
	sui.setPrompt("How many " .. wodStorageBasketTokenData[chosenToken][3] .. " do you wish to withdraw from your wodStorageBasket8 datapad?")
	sui.setTransferFromText("Stored " .. wodStorageBasketTokenData[chosenToken][3])
	sui.setTransferFromValue(tokenData)
	sui.setTransferFromInputValue(tokenData)
	sui.setConversionFromRatio(1)
	sui.setTransferToText("Withdraw")
	sui.setTransferToValue(0)
	sui.setTransferToValue(0)
	sui.setConversionToRatio(1)
	
	sui.sendTo(pPlayer)	
end

function wodStorageBasketMenuComponent:withdrawTokenTransferCallback(pPlayer, pSui, eventIndex, transferInputFromValue, transferInputToValue)
	local cancelPressed = (eventIndex == 1)
	
	if (cancelPressed) then
		return
	end
	
	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
	
	if (pInventory == nil) then
		return
	end
	
	if (SceneObject(pInventory):isContainerFullRecursive()) then
		CreatureObject(pPlayer):sendSystemMessage("You do not have enough inventory space.")
		deleteData(SceneObject(pPlayer):getObjectID() .. "wodStorageBasket:tokenToWithdraw")
		return
	end
	
	local chosenToken = readData(SceneObject(pPlayer):getObjectID() .. "wodStorageBasket:tokenToWithdraw")
	
	writeScreenPlayData(pPlayer, wodStorageBasketTokenData[chosenToken][1], wodStorageBasketTokenData[chosenToken][2], tonumber(transferInputFromValue))
	
	local pItem = giveItem(pInventory, wodStorageBasketTokenData[chosenToken][4], -1)
	TangibleObject(pItem):setUseCount(tonumber(transferInputToValue))
	
	deleteData(SceneObject(pPlayer):getObjectID() .. "wodStorageBasket:tokenToWithdraw")
end

wodStorageBasketContainerComponent = {}

function wodStorageBasketContainerComponent:canAddObject(pBasket, pObject, slot)
	if (pBasket == nil or pObject == nil) then
		return
	end
	print("OO")
	local pParent = self:getObjOwner(pObject)
	print("OO")
	if (pParent == nil or not SceneObject(pParent):isPlayerCreature()) then
		return TRANSFERCANTADD
	end
	
	for i = 1, #wodStorageBasketTokenData do
		if (SceneObject(pObject):getTemplateObjectPath() == wodStorageBasketTokenData[i][4]) then
			local tokenData = tonumber(readScreenPlayData(pPlayer, wodStorageBasketTokenData[i][1], wodStorageBasketTokenData[i][2]))
			if (tokenData == "" or tokenData == nil) then
				tokenData = 0
			end
			writeScreenPlayData(pPlayer, wodStorageBasketTokenData[i][1], wodStorageBasketTokenData[i][2], tokenData + TangibleObject(pObject):getUseCount())
				
			SceneObject(pObject):destroyObjectFromWorld()
			SceneObject(pObject):destroyObjectFromDatabase()
		end
	end
	
	return TRANSFERCANTADD
end

function wodStorageBasketContainerComponent:transferObject(pBasket, pObject, slot)
	if (pObject == nil) then
		return TRANSFERFAIL
	end
	
	for i = 1, #wodStorageBasketTokenData do
		if (SceneObject(pObject):getTemplateObjectPath() == wodStorageBasketTokenData[i][4]) then
			local tokenData = tonumber(readScreenPlayData(pPlayer, wodStorageBasketTokenData[i][1], wodStorageBasketTokenData[i][2]))
			if (tokenData == "" or tokenData == nil) then
				tokenData = 0
			end
			writeScreenPlayData(pPlayer, wodStorageBasketTokenData[i][1], wodStorageBasketTokenData[i][2], tokenData + TangibleObject(pObject):getUseCount())
				
			SceneObject(pObject):destroyObjectFromWorld()
			SceneObject(pObject):destroyObjectFromDatabase()
		end
	end
	
	return TRANSFERSUCCESS
end

function wodStorageBasketContainerComponent:getObjOwner(pObj)
	local pPlayerInv = SceneObject(pObj):getParent()

	if (pPlayerInv == nil) then
		return nil
	end

	local parent = SceneObject(pPlayerInv):getParent()

	if (parent == nil) then
		return nil
	end

	if (SceneObject(parent):isCreatureObject()) then
		return parent
	end

	return nil
end

wodStorageBasketAttributeListComponent = {}

function wodStorageBasketAttributeListComponent:fillAttributeList(pALM, pPlayer, pObject)
	local ALM = LuaAttributeListMessage(pALM)

	for i = 1, #wodStorageBasketTokenData do
		local tokenData = tonumber(readScreenPlayData(pPlayer, wodStorageBasketTokenData[i][1], wodStorageBasketTokenData[i][2]))
		if (tokenData == "" or tokenData == nil) then
			tokenData = 0
		end

		ALM:insertNewAttribute("wod_storage_basket_token" .. i, tokenData)
	end
end
