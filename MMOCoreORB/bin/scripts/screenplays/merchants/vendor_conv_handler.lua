VendorConvoHandler = conv_handler:new {
	--Vendor Setup
	vendorLogicType = VendorLogic,
	--Vendor Greeting
	initialDialog = "Test initial",
	--Player selection to start buying, vendor spatial.
	saleOption = "Test Sale Option",
	saleDialog = "Test Sale Dialog",
	--Player selection to get vendor information, vendor dialog.
	informationFirstOption = "",
	informationFirstDialog = "",
	--Player selection to get vendor more information, vendor dialog.
	informationSecondOption = "",
	informationSecondDialog = "",
	--Set faction restriction
	factionRestriction = "",
}

function VendorConvoHandler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)

	if (self.factionRestriction ~= "") then
		if (self.factionRestriction == FACTIONIMPERIAL and not CreatureObject(pPlayer):getFaction() == FACTIONIMPERIAL) or
		(self.factionRestriction == FACTIONREBEL and not CreatureObject(pPlayer):getFaction() == FACTIONREBEL) or
		(CreatureObject(pPlayer):getFactionStanding(self.factionRestriction) < 200) then
			return convoTemplate:getScreen("factionRestriction")
		end
	end

	return convoTemplate:getInitialScreen()
end


function VendorConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local pConvScreen = screen:cloneScreen()
	local clonedScreen = LuaConversationScreen(pConvScreen)

	if (screenID == "initial") then
		clonedScreen:setCustomDialogText(self.initialDialog)
		clonedScreen:addOption(self.saleOption, "start_sale")
		if (self.informationFirstOption ~= "") then
			clonedScreen:addOption(self.informationFirstOption, "information_first")
		end
		if (self.informationSecondOption ~= "") then
			clonedScreen:addOption(self.informationSecondOption, "information_second")
		end
	end

	if (screenID == "start_sale") then
		clonedScreen:setCustomDialogText(self.saleDialog)
		self.vendorLogicType:openSUI(pPlayer)
	end

	if (screenID == "information_first") then
		clonedScreen:setCustomDialogText(self.informationFirstDialog)
		clonedScreen:addOption(self.saleOption, "start_sale")
		if (self.informationSecondOption ~= "") then
			clonedScreen:addOption(self.informationSecondOption, "information_second")
		end
	end

	if (screenID == "information_second") then
		clonedScreen:setCustomDialogText(self.informationSecondDialog)
		clonedScreen:addOption(self.saleOption, "start_sale")
		if (self.informationFirstOption ~= "") then
			clonedScreen:addOption(self.informationFirstOption, "information_first")
		end
	end
	return pConvScreen
end

EventVendorConvoHandler = VendorConvoHandler:new {
	--Vendor Setup
	vendorLogicType = EventVendorLogic,
	--Vendor Greeting
	initialDialog = "Hello, buy my items please and thank you.",
	--Player selection to start buying, vendor spatial.
	saleOption = "Show me what you have for sale.",
	saleDialog = "Buy my stuff.",
	--Player selection to get vendor information, vendor dialog.
	informationFirstOption = "What do you sell?",
	informationFirstDialog = "Buncha stuff, please buy.",
	--Player selection to get vendor more information, vendor dialog.
	informationSecondOption = "How do I get event tokens?",
	informationSecondDialog = "Post a picture of a naked Gungan in discord.",
}

HouseVendorConvoHandler = VendorConvoHandler:new {
	--Vendor Setup
	vendorLogicType = HouseVendorLogic,
	--Vendor Greeting
	initialDialog = "What's a guy gotta do ta get a drink around here? Oh, yeah? Whadda ya want? Wait a minute...you look like a smart individual. You interested in some top of the line housing? If you are, I got ya covered. Just don't ask where I got it from.",
	--Player selection to start buying, vendor spatial.
	saleOption = "Top of the line housing? Let me see what you have",
	saleDialog = "Here's what I got right now.",
	--Player selection to get vendor information, vendor dialog.
	informationFirstOption = "Is this all that you sell?",
	informationFirstDialog = "For now. Make sure to check back for new items.",
	--Player selection to get vendor more information, vendor dialog.
	informationSecondOption = "Where can I see these houses in person?",
	informationSecondDialog = "You can find the houses at: ",
}

RestussRepVendorConvoHandler = VendorConvoHandler:new {
	--Vendor Setup
	vendorLogicType = RestussRepVendorLogic,
	--Vendor Greeting
	initialDialog = "Hey there! I have some things for trade if you're interested.",
	--Player selection to start buying, vendor spatial.
	saleOption = "Show me what you have for sale.",
	saleDialog = "Take a look.",
	--Player selection to get vendor information, vendor dialog.
	informationFirstOption = "What sort of items do you sell?",
	informationFirstDialog = "I have all sorts of weapon and turret schematics",
	--Player selection to get vendor more information, vendor dialog.
	informationSecondOption = "How do I get these Restuss Commendations?",
	informationSecondDialog = "Kill the Jedi or those Managuards around the city.",
}
