wod_ns_leandra = ConvoTemplate:new {
	initialScreen = "initial",
	templateType = "Lua",
	luaClassHandler = "wod_ns_leandra_convo_handler",
	screens = {}
}

initial = ConvoScreen:new {
	id = "initial",
	leftDialog = "@conversation/wod_ns_leandra:s_35",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ns_leandra:s_37", "first_screen"},
	}
}
wod_ns_leandra:addScreen(initial)

first_screen = ConvoScreen:new {
	id = "first_screen",
	leftDialog = "@conversation/wod_ns_leandra:s_40",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ns_leandra:s_42", "second_screen"},
	}
}
wod_ns_leandra:addScreen(first_screen)

second_screen = ConvoScreen:new {
	id = "second_screen",
	leftDialog = "@conversation/wod_ns_leandra:s_44",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ns_leandra:s_46", "start_quest_lost"},
		{"@conversation/wod_ns_leandra:s_3", "decline"},
	}
}
wod_ns_leandra:addScreen(second_screen)

start_quest_lost = ConvoScreen:new {
	id = "start_quest_lost",
	leftDialog = "@conversation/wod_ns_leandra:s_49",
	stopConversation = "true",
	options = {
	}
}
wod_ns_leandra:addScreen(start_quest_lost)

decline = ConvoScreen:new {
	id = "decline",
	leftDialog = "@conversation/wod_ns_leandra:s_90",
	stopConversation = "true",
	options = {
	}
}
wod_ns_leandra:addScreen(decline)

quest_lost_return = ConvoScreen:new {
	id = "quest_lost_return",
	leftDialog = "@conversation/wod_ns_leandra:s_53",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ns_leandra:s_91", "quest_lost_return_first"},
	}
}
wod_ns_leandra:addScreen(quest_lost_return)

quest_lost_return_first = ConvoScreen:new {
	id = "quest_lost_return_first",
	leftDialog = "@conversation/wod_ns_leandra:s_76",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ns_leandra:s_78", "quest_lost_return_second"},
	}
}
wod_ns_leandra:addScreen(quest_lost_return_first)

quest_lost_return_second = ConvoScreen:new {
	id = "quest_lost_return_second",
	leftDialog = "@conversation/wod_ns_leandra:s_80",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ns_leandra:s_84", "start_quest_found"},
	}
}
wod_ns_leandra:addScreen(quest_lost_return_second)

start_quest_found = ConvoScreen:new {
	id = "start_quest_found",
	leftDialog = "@conversation/wod_ns_leandra:s_86",
	stopConversation = "true",
	options = {
	}
}
wod_ns_leandra:addScreen(start_quest_found)

quest_found_return = ConvoScreen:new {
	id = "quest_found_return",
	leftDialog = "@conversation/wod_ns_leandra:s_92",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ns_leandra:s_93", "quest_found_return_first"},
	}
}
wod_ns_leandra:addScreen(quest_found_return)

quest_found_return_first = ConvoScreen:new {
	id = "quest_found_return_first",
	leftDialog = "@conversation/wod_ns_leandra:s_94",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ns_leandra:s_95", "quest_found_return_second"},
	}
}
wod_ns_leandra:addScreen(quest_found_return_first)

quest_found_return_second = ConvoScreen:new {
	id = "quest_found_return_second",
	leftDialog = "@conversation/wod_ns_leandra:s_2",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ns_leandra:s_99", "quest_found_return_third"},
	}
}
wod_ns_leandra:addScreen(quest_found_return_second)

quest_found_return_third = ConvoScreen:new {
	id = "quest_found_return_third",
	leftDialog = "@conversation/wod_ns_leandra:s_101",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ns_leandra:s_103", "quest_return_fourth"},
	}
}
wod_ns_leandra:addScreen(quest_found_return_third)

quest_return_fourth = ConvoScreen:new {
	id = "quest_return_fourth",
	leftDialog = "@conversation/wod_ns_leandra:s_105",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ns_leandra:s_107", "start_quest_hate"},
	}
}
wod_ns_leandra:addScreen(quest_return_fourth)

start_quest_hate = ConvoScreen:new {
	id = "start_quest_hate",
	leftDialog = "@conversation/wod_ns_leandra:s_109",
	stopConversation = "true",
	options = {
	}
}
wod_ns_leandra:addScreen(start_quest_hate)

quest_hate_return = ConvoScreen:new {
	id = "quest_hate_return",
	leftDialog = "@conversation/wod_ns_leandra:s_81",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ns_leandra:s_82", "quest_hate_return_first"},
	}
}
wod_ns_leandra:addScreen(quest_hate_return)

quest_hate_return_first = ConvoScreen:new {
	id = "quest_hate_return_first",
	leftDialog = "@conversation/wod_ns_leandra:s_62",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ns_leandra:s_63", "quest_hate_return_second"},
	}
}
wod_ns_leandra:addScreen(quest_hate_return_first)

quest_hate_return_second = ConvoScreen:new {
	id = "quest_hate_return_second",
	leftDialog = "@conversation/wod_ns_leandra:s_65",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ns_leandra:s_64", "quest_hate_return_third"},
	}
}
wod_ns_leandra:addScreen(quest_hate_return_second)

quest_hate_return_third = ConvoScreen:new {
	id = "quest_hate_return_third",
	leftDialog = "@conversation/wod_ns_leandra:s_68",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ns_leandra:s_69", "start_quest_challenge"},
		{"@conversation/wod_ns_leandra:s_70", "decline_challenge"},
	}
}
wod_ns_leandra:addScreen(quest_hate_return_third)

start_quest_challenge = ConvoScreen:new {
	id = "start_quest_challenge",
	leftDialog = "@conversation/wod_ns_leandra:s_71",
	stopConversation = "true",
	options = {
	}
}
wod_ns_leandra:addScreen(start_quest_challenge)

decline_challenge = ConvoScreen:new {
	id = "decline_challenge",
	leftDialog = "@conversation/wod_ns_leandra:s_72",
	stopConversation = "true",
	options = {
	}
}
wod_ns_leandra:addScreen(decline_challenge)

quest_complete = ConvoScreen:new {
	id = "quest_complete",
	leftDialog = "@conversation/wod_ns_leandra:s_97",
	stopConversation = "true",
	options = {
	}
}
wod_ns_leandra:addScreen(quest_complete)

quest_challenge_in_progress = ConvoScreen:new {
	id = "quest_challenge_in_progress",
	leftDialog = "@conversation/wod_ns_leandra:s_110",
	stopConversation = "true",
	options = {
	}
}
wod_ns_leandra:addScreen(quest_challenge_in_progress)

not_elligible = ConvoScreen:new {
	id = "not_elligible",
	leftDialog = "@conversation/wod_ns_leandra:s_60",
	stopConversation = "true",
	options = {
	}
}
wod_ns_leandra:addScreen(not_elligible)

quest_lost_in_progress = ConvoScreen:new {
	id = "quest_lost_in_progress",
	leftDialog = "@conversation/wod_ns_leandra:s_88",
	stopConversation = "true",
	options = {
	}
}
wod_ns_leandra:addScreen(quest_lost_in_progress)

quest_investigation_in_progress = ConvoScreen:new {
	id = "quest_investigation_in_progress",
	leftDialog = "@conversation/wod_ns_leandra:s_74",
	stopConversation = "true",
	options = {
	}
}
wod_ns_leandra:addScreen(quest_investigation_in_progress)

quest_hate_in_progress = ConvoScreen:new {
	id = "quest_hate_in_progress",
	leftDialog = "@conversation/wod_ns_leandra:s_61",
	stopConversation = "true",
	options = {
	}
}
wod_ns_leandra:addScreen(quest_hate_in_progress)

wrong_alignment = ConvoScreen:new {
	id = "wrong_alignment",
	leftDialog = "@conversation/wod_ns_leandra:s_38",
	stopConversation = "true",
	options = {
	}
}
wod_ns_leandra:addScreen(wrong_alignment)

addConversationTemplate("wod_ns_leandra", wod_ns_leandra);
