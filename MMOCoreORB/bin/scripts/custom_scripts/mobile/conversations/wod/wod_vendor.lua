function createWODVendorConvoTemplate(templateName)
	wod_vendor = ConvoTemplate:new {
		initialScreen = "initial",
		templateType = "Lua",
		luaClassHandler = "wod_vendor_convo_handler",
		screens = {},
	}

	vendorType = ConvoScreen:new {
		id = "vendorType",
		leftDialog = "vendorType", -- Storage for the vendor type, so it can be pulled in the convo handler.
		stopConversation = "false",
		options = {
			{"vendorType" , templateName}
		}
	}
	wod_vendor:addScreen(vendorType);

	initial = ConvoScreen:new {
		id = "initial",
		leftDialog = "@conversation/" .. templateName .. ":s_6",
		stopConversation = "false",
		options = {
			{"@conversation/" .. templateName .. ":s_8", "sale"},
			{"@conversation/" .. templateName .. ":s_12", "decline"},
		}
	}
	wod_vendor:addScreen(initial)

	sale = ConvoScreen:new {
		id = "sale",
		leftDialog = "@conversation/" .. templateName .. ":s_10",
		stopConversation = "true",
		options = {
		}
	}
	wod_vendor:addScreen(sale)

	decline = ConvoScreen:new {
		id = "decline",
		leftDialog = "@conversation/" .. templateName .. ":s_16",
		stopConversation = "true",
		options = {
		}
	}
	wod_vendor:addScreen(decline)

	wrong_alignment = ConvoScreen:new {
		id = "wrong_alignment",
		leftDialog = "@conversation/" .. templateName .. ":s_13",
		stopConversation = "true",
		options = {
		}
	}
	wod_vendor:addScreen(wrong_alignment)

	not_enough_faction = ConvoScreen:new {
		id = "not_enough_faction",
		leftDialog = "@conversation/" .. templateName .. ":s_14",
		stopConversation = "true",
		options = {
		}
	}
	wod_vendor:addScreen(not_enough_faction)
	
	not_elligible = ConvoScreen:new {
		id = "not_elligible",
		leftDialog = "@conversation/" .. templateName .. ":s_2",
		stopConversation = "true",
		options = {
		}
	}
	wod_vendor:addScreen(not_elligible)

	addConversationTemplate(templateName, wod_vendor);
end

createWODVendorConvoTemplate("wod_ns_vendor")
createWODVendorConvoTemplate("wod_sm_vendor")
