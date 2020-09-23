function createWODOutcastConvoTemplate(templateName)
	wod_outcast = ConvoTemplate:new {
		initialScreen = "initial",
		templateType = "Lua",
		luaClassHandler = "wod_outcast_convo_handler",
		screens = {},
	}

	outcast = ConvoScreen:new {
		id = "outcast",
		leftDialog = "outcast", -- Storage for the outcast, so it can be pulled in the convo handler.
		stopConversation = "false",
		options = {
			{"outcast" , templateName}
		}
	}
	wod_outcast:addScreen(outcast);

	initial = ConvoScreen:new {
		id = "initial",
		leftDialog = "@conversation/" .. templateName .. ":s_10",
		stopConversation = "false",
		options = {
			{"@conversation/" .. templateName .. ":s_12", "dilemma_one"},
		}
	}
	wod_outcast:addScreen(initial)

	dilemma_one = ConvoScreen:new {
		id = "dilemma_one",
		leftDialog = "@conversation/" .. templateName .. ":s_14",
		stopConversation = "false",
		options = {
			{"@conversation/" .. templateName .. ":s_18", "dilemma_one_sm"},
			{"@conversation/" .. templateName .. ":s_17", "dilemma_one_ns"},
		}
	}
	wod_outcast:addScreen(dilemma_one)

	dilemma_two = ConvoScreen:new {
		id = "dilemma_two",
		leftDialog = "@conversation/" .. templateName .. ":s_86",
		stopConversation = "false",
		options = {
			{"@conversation/" .. templateName .. ":s_90", "dilemma_two_sm"},
			{"@conversation/" .. templateName .. ":s_88", "dilemma_two_ns"},
		}
	}
	wod_outcast:addScreen(dilemma_two)

	dilemma_three = ConvoScreen:new {
		id = "dilemma_three",
		leftDialog = "@conversation/" .. templateName .. ":s_95",
		stopConversation = "false",
		options = {
			{"@conversation/" .. templateName .. ":s_97", "dilemma_three_sm"},
			{"@conversation/" .. templateName .. ":s_99", "dilemma_three_ns"},
		}
	}
	wod_outcast:addScreen(dilemma_three)

	supported_clan = ConvoScreen:new {
		id = "supported_clan",
		leftDialog = "@conversation/" .. templateName .. ":s_100",
		stopConversation = "false",
		options = {
			{"@conversation/" .. templateName .. ":s_102", "supported_clan_confirm"},
		}
	}
	wod_outcast:addScreen(supported_clan)
	
	supported_clan_confirm = ConvoScreen:new {
		id = "supported_clan_confirm",
		leftDialog = "",
		stopConversation = "false",
		options = {
		}
	}
	wod_outcast:addScreen(supported_clan_confirm)

	end_screen = ConvoScreen:new {
		id = "end_screen",
		leftDialog = "",
		stopConversation = "true",
		options = {
		}
	}
	wod_outcast:addScreen(end_screen)
	
	not_elligible = ConvoScreen:new {
		id = "not_elligible",
		leftDialog = "@conversation/" .. templateName .. ":s_4",
		stopConversation = "false",
		options = {
			{"@conversation/" .. templateName .. ":s_6", "not_elligible_end"},
		}
	}
	wod_outcast:addScreen(not_elligible)
	
	not_elligible_end = ConvoScreen:new {
		id = "not_elligible_end",
		leftDialog = "@conversation/" .. templateName .. ":s_8",
		stopConversation = "true",
		options = {
		}
	}
	wod_outcast:addScreen(not_elligible_end)

	addConversationTemplate(templateName, wod_outcast);
end

createWODOutcastConvoTemplate("wod_prologue_outcast_1")
createWODOutcastConvoTemplate("wod_prologue_outcast_2")
createWODOutcastConvoTemplate("wod_prologue_outcast_3")
createWODOutcastConvoTemplate("wod_prologue_outcast_4")
createWODOutcastConvoTemplate("wod_prologue_outcast_5")
createWODOutcastConvoTemplate("wod_prologue_outcast_6")
createWODOutcastConvoTemplate("wod_prologue_outcast_7")
