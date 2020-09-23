wod_vendor_convo_handler = conv_handler:new{}

function wod_vendor_convo_handler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	local vendor = self:getVendorType(pPlayer, pNpc, pConvTemplate)
	local clan = readScreenPlayData(pPlayer, "witchesOfDathomir", "clanAlignment")
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return convoTemplate:getScreen("not_enough_faction")
	end
	
	if (clan == "" or clan == nil) then
		return convoTemplate:getScreen("not_elligible")
	elseif ((vendor == "wod_ns_vendor" and clan == "sm") or (vendor == "wod_sm_vendor" and clan == "ns")) then
		return convoTemplate:getScreen("wrong_alignment")
	end
	
	local nsFaction = PlayerObject(pGhost):getFactionStanding("nightsister")
	local smFaction = PlayerObject(pGhost):getFactionStanding("mtn_clan")
	if ((vendor == "wod_ns_vendor" and nsFaction > 3000) or (vendor == "wod_sm_vendor" and smFaction > 300)) then
		return convoTemplate:getScreen("initial")
	else
		return convoTemplate:getScreen("not_enough_faction")
	end
end

function wod_vendor_convo_handler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local pConvScreen = screen:cloneScreen()
	local clonedConversation = LuaConversationScreen(pConvScreen)
	local vendor = self:getVendorType(pPlayer, pNpc, pConvTemplate)
	
	if (screenID == "sale") then
		if (vendor == "wod_ns_vendor") then
			NSWodVendorLogic:openSUI(pPlayer)
		else
			SMWodVendorLogic:openSUI(pPlayer)
		end
	end
	
    return pConvScreen
end

function wod_vendor_convo_handler:getVendorType(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	local pScreen = convoTemplate:getScreen("vendorType")
	local screen = LuaConversationScreen(pScreen)

	return screen:getOptionLink(0)
end
