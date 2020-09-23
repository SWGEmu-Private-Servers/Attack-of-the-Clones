function createWODWitchHerbsConvoTemplate(templateName)
	wod_witch_herbs = ConvoTemplate:new {
		initialScreen = "initial",
		templateType = "Lua",
		luaClassHandler = "wod_witch_herbs_convo_handler",
		screens = {},
	}

	witchHerbsType = ConvoScreen:new {
		id = "witchHerbsType",
		leftDialog = "witchHerbsType", -- Storage for the faction, so it can be pulled in the convo handler.
		stopConversation = "false",
		options = {
			{"witchHerbsType" , templateName}
		}
	}
	wod_witch_herbs:addScreen(witchHerbsType);

	initial = ConvoScreen:new {
		id = "initial",
		leftDialog = "@conversation/" .. templateName .. ":s_12",
		stopConversation = "false",
		options = {
			{"@conversation/" .. templateName .. ":s_14", "first_screen"},
		}
	}
	wod_witch_herbs:addScreen(initial)

	first_screen = ConvoScreen:new {
		id = "first_screen",
		leftDialog = "@conversation/" .. templateName .. ":s_21",
		stopConversation = "false",
		options = {
			{"@conversation/" .. templateName .. ":s_23", "second_screen"},
		}
	}
	wod_witch_herbs:addScreen(first_screen)

	second_screen = ConvoScreen:new {
		id = "second_screen",
		leftDialog = "@conversation/" .. templateName .. ":s_25",
		stopConversation = "false",
		options = {
			{"@conversation/" .. templateName .. ":s_27", "third_screen"},
		}
	}
	wod_witch_herbs:addScreen(second_screen)

	third_screen = ConvoScreen:new {
		id = "third_screen",
		leftDialog = "@conversation/" .. templateName .. ":s_29",
		stopConversation = "false",
		options = {
			{"@conversation/" .. templateName .. ":s_31", "quest_start"},
			{"@conversation/" .. templateName .. ":s_2", "decline"},
		}
	}
	wod_witch_herbs:addScreen(third_screen)

	quest_start = ConvoScreen:new {
		id = "quest_start",
		leftDialog = "@conversation/" .. templateName .. ":s_35",
		stopConversation = "true",
		options = {
		}
	}
	wod_witch_herbs:addScreen(quest_start)

	decline = ConvoScreen:new {
		id = "decline",
		leftDialog = "@conversation/" .. templateName .. ":s_40",
		stopConversation = "true",
		options = {
		}
	}
	wod_witch_herbs:addScreen(decline)

	return_complete_quest = ConvoScreen:new {
		id = "return_complete_quest",
		leftDialog = "@conversation/" .. templateName .. ":s_17",
		stopConversation = "true",
		options = {
		}
	}
	wod_witch_herbs:addScreen(return_complete_quest)

	return_init = ConvoScreen:new {
		id = "return_init",
		leftDialog = "@conversation/" .. templateName .. ":s_18",
		stopConversation = "false",
		options = {
			{"@conversation/" .. templateName .. ":s_19", "quest_start_alt"},
			{"@conversation/" .. templateName .. ":s_2", "decline"},
		}
	}
	wod_witch_herbs:addScreen(return_init)

	quest_start_alt = ConvoScreen:new {
		id = "quest_start_alt",
		leftDialog = "@conversation/" .. templateName .. ":s_20",
		stopConversation = "true",
		options = {
		}
	}
	wod_witch_herbs:addScreen(quest_start_alt)

	quest_in_progress = ConvoScreen:new {
		id = "quest_in_progress",
		leftDialog = "@conversation/" .. templateName .. ":s_16",
		stopConversation = "true",
		options = {
		}
	}
	wod_witch_herbs:addScreen(quest_in_progress)

	not_elligible = ConvoScreen:new {
		id = "not_elligible",
		leftDialog = "@conversation/" .. templateName .. ":s_32",
		stopConversation = "true",
		options = {
		}
	}
	wod_witch_herbs:addScreen(not_elligible)

	wrong_alignment = ConvoScreen:new {
		id = "wrong_alignment",
		leftDialog = "@conversation/" .. templateName .. ":s_36",
		stopConversation = "true",
		options = {
		}
	}
	wod_witch_herbs:addScreen(wrong_alignment)

	addConversationTemplate(templateName, wod_witch_herbs);
end

createWODWitchHerbsConvoTemplate("wod_ns_witch_herbs")
createWODWitchHerbsConvoTemplate("wod_sm_witch_herbs")
