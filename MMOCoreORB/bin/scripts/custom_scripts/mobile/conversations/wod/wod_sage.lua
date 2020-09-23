function createWODSageConvoTemplate(templateName)
	wod_sage = ConvoTemplate:new {
		initialScreen = "initial",
		templateType = "Lua",
		luaClassHandler = "wod_sage_convo_handler",
		screens = {},
	}

	sageType = ConvoScreen:new {
		id = "sageType",
		leftDialog = "sageType", -- Storage for the faction, so it can be pulled in the convo handler.
		stopConversation = "false",
		options = {
			{"sageType" , templateName}
		}
	}
	wod_sage:addScreen(sageType);

	initial = ConvoScreen:new {
		id = "initial",
		leftDialog = "@conversation/" .. templateName .. ":s_11",
		stopConversation = "false",
		options = {
			{"@conversation/" .. templateName .. ":s_13", "first_screen"},
		}
	}
	wod_sage:addScreen(initial)

	first_screen = ConvoScreen:new {
		id = "first_screen",
		leftDialog = "@conversation/" .. templateName .. ":s_15",
		stopConversation = "false",
		options = {
			{"@conversation/" .. templateName .. ":s_17", "second_screen"},
		}
	}
	wod_sage:addScreen(first_screen)

	second_screen = ConvoScreen:new {
		id = "second_screen",
		leftDialog = "@conversation/" .. templateName .. ":s_19",
		stopConversation = "false",
		options = {
			{"@conversation/" .. templateName .. ":s_32", "quest_start_first"},
			{"@conversation/" .. templateName .. ":s_2", "information"},
			{"@conversation/" .. templateName .. ":s_36", "decline_first"},
		}
	}
	wod_sage:addScreen(second_screen)

	quest_start_first = ConvoScreen:new {
		id = "quest_start_first",
		leftDialog = "@conversation/" .. templateName .. ":s_34",
		stopConversation = "true",
		options = {
		}
	}
	wod_sage:addScreen(quest_start_first)

	information = ConvoScreen:new {
		id = "information",
		leftDialog = "@conversation/" .. templateName .. ":s_81",
		stopConversation = "false",
		options = {
			{"@conversation/" .. templateName .. ":s_83", "info_first_screen"},
		}
	}
	wod_sage:addScreen(information)

	info_first_screen = ConvoScreen:new {
		id = "info_first_screen",
		leftDialog = "@conversation/" .. templateName .. ":s_86",
		stopConversation = "false",
		options = {
			{"@conversation/" .. templateName .. ":s_89", "second_screen"},
		}
	}
	wod_sage:addScreen(info_first_screen)

	second_screen = ConvoScreen:new {
		id = "second_screen",
		customDialogText = "",
		stopConversation = "false",
		options = {
		}
	}
	wod_sage:addScreen(second_screen)

	decline_first = ConvoScreen:new {
		id = "decline_first",
		leftDialog = "@conversation/" .. templateName .. ":s_38",
		stopConversation = "true",
		options = {
		}
	}
	wod_sage:addScreen(decline_first)

	init_second = ConvoScreen:new {
		id = "init_second",
		leftDialog = "@conversation/" .. templateName .. ":s_25",
		stopConversation = "false",
		options = {
			{"@conversation/" .. templateName .. ":s_27", "quest_start_second"},
			{"@conversation/" .. templateName .. ":s_39", "information_second"},
			{"@conversation/" .. templateName .. ":s_31", "decline_second"},
		}
	}
	wod_sage:addScreen(init_second)

	quest_start_second = ConvoScreen:new {
		id = "quest_start_second",
		leftDialog = "@conversation/" .. templateName .. ":s_29",
		stopConversation = "true",
		options = {
		}
	}
	wod_sage:addScreen(quest_start_second)

	information_second = ConvoScreen:new {
		id = "information_second",
		leftDialog = "@conversation/" .. templateName .. ":s_57",
		stopConversation = "false",
		options = {
			{"@conversation/" .. templateName .. ":s_83", "info_first_screen"},
		}
	}
	wod_sage:addScreen(information_second)

	decline_second = ConvoScreen:new {
		id = "decline_second",
		leftDialog = "@conversation/" .. templateName .. ":s_35",
		stopConversation = "true",
		options = {
		}
	}
	wod_sage:addScreen(decline_second)

	init_third = ConvoScreen:new {
		id = "init_third",
		leftDialog = "@conversation/" .. templateName .. ":s_42",
		stopConversation = "false",
		options = {
			{"@conversation/" .. templateName .. ":s_44", "quest_start_third"},
			{"@conversation/" .. templateName .. ":s_52", "information_third"},
			{"@conversation/" .. templateName .. ":s_64", "decline_fourth"},
		}
	}
	wod_sage:addScreen(init_third)

	quest_start_third = ConvoScreen:new {
		id = "quest_start_third",
		leftDialog = "@conversation/" .. templateName .. ":s_46",
		stopConversation = "true",
		options = {
		}
	}
	wod_sage:addScreen(quest_start_third)

	information_third = ConvoScreen:new {
		id = "information_third",
		leftDialog = "@conversation/" .. templateName .. ":s_54",
		stopConversation = "false",
		options = {
			{"@conversation/" .. templateName .. ":s_83", "info_first_screen"},
		}
	}
	wod_sage:addScreen(information_third)

	decline_fourth = ConvoScreen:new {
		id = "decline_fourth",
		leftDialog = "@conversation/" .. templateName .. ":s_66",
		stopConversation = "true",
		options = {
		}
	}
	wod_sage:addScreen(decline_fourth)

	init_fourth = ConvoScreen:new {
		id = "init_fourth",
		leftDialog = "@conversation/" .. templateName .. ":s_56",
		stopConversation = "false",
		options = {
			{"@conversation/" .. templateName .. ":s_60", "quest_start_fourth"},
			{"@conversation/" .. templateName .. ":s_68", "information_fourth"},
			{"@conversation/" .. templateName .. ":s_64", "decline_fourth"},
		}
	}
	wod_sage:addScreen(init_fourth)

	quest_start_fourth = ConvoScreen:new {
		id = "quest_start_fourth",
		leftDialog = "@conversation/" .. templateName .. ":s_62",
		stopConversation = "true",
		options = {
		}
	}
	wod_sage:addScreen(quest_start_fourth)

	information_fourth = ConvoScreen:new {
		id = "information_fourth",
		leftDialog = "@conversation/" .. templateName .. ":s_70",
		stopConversation = "false",
		options = {
			{"@conversation/" .. templateName .. ":s_83", "info_first_screen"},
		}
	}
	wod_sage:addScreen(information_fourth)

	decline_fourth = ConvoScreen:new {
		id = "decline_fourth",
		leftDialog = "@conversation/" .. templateName .. ":s_66",
		stopConversation = "true",
		options = {
		}
	}
	wod_sage:addScreen(decline_fourth)

	init_fifth = ConvoScreen:new {
		id = "init_fifth",
		leftDialog = "@conversation/" .. templateName .. ":s_8",
		stopConversation = "false",
		options = {
			{"@conversation/" .. templateName .. ":s_80", "return_first_screen"},
		}
	}
	wod_sage:addScreen(init_fifth)

	return_first_screen = ConvoScreen:new {
		id = "return_first_screen",
		leftDialog = "@conversation/" .. templateName .. ":s_72",
		stopConversation = "false",
		options = {
			{"@conversation/" .. templateName .. ":s_74", "complete_quest"},
		}
	}
	wod_sage:addScreen(return_first_screen)

	complete_quest = ConvoScreen:new {
		id = "complete_quest",
		leftDialog = "@conversation/" .. templateName .. ":s_76",
		stopConversation = "true",
		options = {
		}
	}
	wod_sage:addScreen(complete_quest)

	wrong_alignment = ConvoScreen:new {
		id = "wrong_alignment",
		leftDialog = "@conversation/" .. templateName .. ":s_4",
		stopConversation = "true",
		options = {
		}
	}
	wod_sage:addScreen(wrong_alignment)

	not_elligible = ConvoScreen:new {
		id = "not_elligible",
		leftDialog = "@conversation/" .. templateName .. ":s_58",
		stopConversation = "true",
		options = {
		}
	}
	wod_sage:addScreen(not_elligible)

	not_crafter = ConvoScreen:new {
		id = "not_crafter",
		leftDialog = "@conversation/" .. templateName .. ":s_85",
		stopConversation = "true",
		options = {
		}
	}
	wod_sage:addScreen(not_crafter)

	quest_completed = ConvoScreen:new {
		id = "quest_completed",
		leftDialog = "@conversation/" .. templateName .. ":s_88",
		stopConversation = "true",
		options = {
		}
	}
	wod_sage:addScreen(quest_completed)

	quest_in_progress = ConvoScreen:new {
		id = "quest_in_progress",
		leftDialog = "@conversation/" .. templateName .. ":s_90",
		stopConversation = "true",
		options = {
		}
	}
	wod_sage:addScreen(quest_in_progress)

	addConversationTemplate(templateName, wod_sage);
end

createWODSageConvoTemplate("wod_ns_sage")
createWODSageConvoTemplate("wod_sm_sage")
