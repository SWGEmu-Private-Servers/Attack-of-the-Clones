function createWODRancorTamerEntConvoTemplate(templateName)
	wod_rancor_tamer_ent = ConvoTemplate:new {
		initialScreen = "initial",
		templateType = "Lua",
		luaClassHandler = "wod_rancor_tamer_ent_convo_handler",
		screens = {},
	}

	rancorTamer = ConvoScreen:new {
		id = "rancorTamer",
		leftDialog = "rancorTamer", -- Storage for the faction, so it can be pulled in the convo handler.
		stopConversation = "false",
		options = {
			{"rancorTamer", templateName}
		}
	}
	wod_rancor_tamer_ent:addScreen(rancorTamer);

	initial = ConvoScreen:new {
		id = "initial",
		leftDialog = "@conversation/" .. templateName .. ":s_10",
		stopConversation = "false",
		options = {
			{"@conversation/" .. templateName .. ":s_12", "first_screen"},
		}
	}
	wod_rancor_tamer_ent:addScreen(initial)

	first_screen = ConvoScreen:new {
		id = "first_screen",
		leftDialog = "@conversation/" .. templateName .. ":s_22",
		stopConversation = "false",
		options = {
			{"@conversation/" .. templateName .. ":s_25", "second_screen"},
		}
	}
	wod_rancor_tamer_ent:addScreen(first_screen)

	second_screen = ConvoScreen:new {
		id = "second_screen",
		leftDialog = "@conversation/" .. templateName .. ":s_26",
		stopConversation = "false",
		options = {
			{"@conversation/" .. templateName .. ":s_27", "third_screen"},
		}
	}
	wod_rancor_tamer_ent:addScreen(second_screen)

	third_screen = ConvoScreen:new {
		id = "third_screen",
		leftDialog = "@conversation/" .. templateName .. ":s_28",
		stopConversation = "false",
		options = {
			{"@conversation/" .. templateName .. ":s_29", "fourth_screen"},
		}
	}
	wod_rancor_tamer_ent:addScreen(third_screen)

	fourth_screen = ConvoScreen:new {
		id = "fourth_screen",
		leftDialog = "@conversation/" .. templateName .. ":s_30",
		stopConversation = "false",
		options = {
			{"@conversation/" .. templateName .. ":s_31", "fifth_screen"},
		}
	}
	wod_rancor_tamer_ent:addScreen(fourth_screen)

	fifth_screen = ConvoScreen:new {
		id = "fifth_screen",
		leftDialog = "@conversation/" .. templateName .. ":s_32",
		stopConversation = "false",
		options = {
			{"@conversation/" .. templateName .. ":s_33", "quest_start"},
			{"@conversation/" .. templateName .. ":s_42", "decline"},
		}
	}
	wod_rancor_tamer_ent:addScreen(fifth_screen)

	quest_start = ConvoScreen:new {
		id = "quest_start",
		leftDialog = "@conversation/" .. templateName .. ":s_37",
		stopConversation = "true",
		options = {
		}
	}
	wod_rancor_tamer_ent:addScreen(quest_start)

	decline = ConvoScreen:new {
		id = "decline",
		leftDialog = "@conversation/" .. templateName .. ":s_44",
		stopConversation = "true",
		options = {
		}
	}
	wod_rancor_tamer_ent:addScreen(decline)

	return_init = ConvoScreen:new {
		id = "return_init",
		leftDialog = "@conversation/" .. templateName .. ":s_35",
		stopConversation = "false",
		options = {
			{"@conversation/" .. templateName .. ":s_38", "quest_start"},
			{"@conversation/" .. templateName .. ":s_42", "decline"},
		}
	}
	wod_rancor_tamer_ent:addScreen(return_init)

	quest_in_progress = ConvoScreen:new {
		id = "quest_in_progress",
		leftDialog = "@conversation/" .. templateName .. ":s_46",
		stopConversation = "true",
		options = {
		}
	}
	wod_rancor_tamer_ent:addScreen(quest_in_progress)

	wrong_alignment = ConvoScreen:new {
		id = "wrong_alignment",
		leftDialog = "@conversation/" .. templateName .. ":s_6",
		stopConversation = "true",
		options = {
		}
	}
	wod_rancor_tamer_ent:addScreen(wrong_alignment)

	not_entertainer = ConvoScreen:new {
		id = "not_entertainer",
		leftDialog = "@conversation/" .. templateName .. ":s_8",
		stopConversation = "true",
		options = {
		}
	}
	wod_rancor_tamer_ent:addScreen(not_entertainer)

	not_elligible = ConvoScreen:new {
		id = "not_elligible",
		leftDialog = "@conversation/" .. templateName .. ":s_4",
		stopConversation = "true",
		options = {
		}
	}
	wod_rancor_tamer_ent:addScreen(not_elligible)

	addConversationTemplate(templateName, wod_rancor_tamer_ent);
end

createWODRancorTamerEntConvoTemplate("wod_ns_rancor_tamer_diax")
createWODRancorTamerEntConvoTemplate("wod_sm_rancor_tamer_zideera")
