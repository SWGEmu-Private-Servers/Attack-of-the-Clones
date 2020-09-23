wod_ghost_witch= ConvoTemplate:new {
	initialScreen = "initial",
	templateType = "Lua",
	luaClassHandler = "wod_ghost_witch_convo_handler",
	screens = {}
}

initial = ConvoScreen:new {
	id = "initial",
	leftDialog = "@conversation/wod_ghost_witch:s_52",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ghost_witch:s_41", "first_screen"},
	}
}
wod_ghost_witch:addScreen(initial)

loop_back = ConvoScreen:new {
	id = "loop_back",
	leftDialog = "@conversation/wod_ghost_witch:s_112",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ghost_witch:s_54", "who_info"},
		{"@conversation/wod_ghost_witch:s_69", "what_info"},
		{"@conversation/wod_ghost_witch:s_80", "quest_info"},
	}
}
wod_ghost_witch:addScreen(loop_back)

first_screen = ConvoScreen:new {
	id = "first_screen",
	leftDialog = "@conversation/wod_ghost_witch:s_45",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ghost_witch:s_54", "who_info"},
		{"@conversation/wod_ghost_witch:s_69", "what_info"},
		{"@conversation/wod_ghost_witch:s_80", "quest_info"},
	}
}
wod_ghost_witch:addScreen(first_screen)

who_info = ConvoScreen:new {
	id = "who_info",
	leftDialog = "@conversation/wod_ghost_witch:s_56",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ghost_witch:s_61", "who_first_screen"},
	}
}
wod_ghost_witch:addScreen(who_info)

who_first_screen = ConvoScreen:new {
	id = "who_first_screen",
	leftDialog = "@conversation/wod_ghost_witch:s_63",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ghost_witch:s_72", "who_second_screen"},
	}
}
wod_ghost_witch:addScreen(who_first_screen)

who_second_screen = ConvoScreen:new {
	id = "who_second_screen",
	leftDialog = "@conversation/wod_ghost_witch:s_76",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ghost_witch:s_108", "loop_back"},
	}
}
wod_ghost_witch:addScreen(who_second_screen)

what_info = ConvoScreen:new {
	id = "what_info",
	leftDialog = "@conversation/wod_ghost_witch:s_71",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ghost_witch:s_77", "what_first_screen"},
	}
}
wod_ghost_witch:addScreen(what_info)

what_first_screen = ConvoScreen:new {
	id = "what_first_screen",
	leftDialog = "@conversation/wod_ghost_witch:s_78",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ghost_witch:s_108", "loop_back"},
	}
}
wod_ghost_witch:addScreen(what_first_screen)

quest_info = ConvoScreen:new {
	id = "quest_info",
	leftDialog = "@conversation/wod_ghost_witch:s_82",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ghost_witch:s_84", "quest_first_screen"},
	}
}
wod_ghost_witch:addScreen(quest_info)

quest_first_screen = ConvoScreen:new {
	id = "quest_first_screen",
	leftDialog = "@conversation/wod_ghost_witch:s_86",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ghost_witch:s_88", "quest_second_screen"},
	}
}
wod_ghost_witch:addScreen(quest_first_screen)

quest_second_screen = ConvoScreen:new {
	id = "quest_second_screen",
	leftDialog = "@conversation/wod_ghost_witch:s_90",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ghost_witch:s_98", "quest_third_screen"},
	}
}
wod_ghost_witch:addScreen(quest_second_screen)

quest_third_screen = ConvoScreen:new {
	id = "quest_third_screen",
	leftDialog = "@conversation/wod_ghost_witch:s_92",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ghost_witch:s_102", "quest_fourth_screen"},
	}
}
wod_ghost_witch:addScreen(quest_third_screen)

quest_fourth_screen = ConvoScreen:new {
	id = "quest_fourth_screen",
	leftDialog = "@conversation/wod_ghost_witch:s_95",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ghost_witch:s_96", "quest_fifth_screen"},
	}
}
wod_ghost_witch:addScreen(quest_fourth_screen)

quest_fifth_screen = ConvoScreen:new {
	id = "quest_fifth_screen",
	leftDialog = "@conversation/wod_ghost_witch:s_116",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ghost_witch:s_101", "quest_sixth_screen"},
	}
}
wod_ghost_witch:addScreen(quest_fifth_screen)

quest_sixth_screen = ConvoScreen:new {
	id = "quest_sixth_screen",
	leftDialog = "@conversation/wod_ghost_witch:s_103",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ghost_witch:s_105", "quest_seventh_screen"},
	}
}
wod_ghost_witch:addScreen(quest_sixth_screen)

quest_seventh_screen = ConvoScreen:new {
	id = "quest_seventh_screen",
	leftDialog = "@conversation/wod_ghost_witch:s_107",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ghost_witch:s_109", "quest_eighth"},
	}
}
wod_ghost_witch:addScreen(quest_seventh_screen)

quest_eighth = ConvoScreen:new {
	id = "quest_eighth",
	leftDialog = "@conversation/wod_ghost_witch:s_111",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ghost_witch:s_113", "quest_start"},
		{"@conversation/wod_ghost_witch:s_108", "loop_back"},
		{"@conversation/wod_ghost_witch:s_2", "quest_decline"},
	}
}
wod_ghost_witch:addScreen(quest_eighth)

quest_start = ConvoScreen:new {
	id = "quest_start",
	leftDialog = "@conversation/wod_ghost_witch:s_115",
	stopConversation = "true",
	options = {
	}
}
wod_ghost_witch:addScreen(quest_start)

quest_decline = ConvoScreen:new {
	id = "quest_decline",
	leftDialog = "@conversation/wod_ghost_witch:s_99",
	stopConversation = "true",
	options = {
	}
}
wod_ghost_witch:addScreen(quest_decline)

first_sister_return = ConvoScreen:new {
	id = "first_sister_return",
	leftDialog = "@conversation/wod_ghost_witch:s_51",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ghost_witch:s_66", "first_sister_complete_quest"},
	}
}
wod_ghost_witch:addScreen(first_sister_return)

first_sister_complete_quest = ConvoScreen:new {
	id = "first_sister_complete_quest",
	leftDialog = "@conversation/wod_ghost_witch:s_53",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ghost_witch:s_59", "first_sister_first_screen"},
	}
}
wod_ghost_witch:addScreen(first_sister_complete_quest)

first_sister_first_screen = ConvoScreen:new {
	id = "first_sister_first_screen",
	leftDialog = "@conversation/wod_ghost_witch:s_117",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ghost_witch:s_118", "second_sister_start"},
	}
}
wod_ghost_witch:addScreen(first_sister_first_screen)

second_sister_start = ConvoScreen:new {
	id = "second_sister_start",
	leftDialog = "@conversation/wod_ghost_witch:s_119",
	stopConversation = "true",
	options = {
	}
}
wod_ghost_witch:addScreen(second_sister_start)

second_sister_return = ConvoScreen:new {
	id = "second_sister_return",
	leftDialog = "@conversation/wod_ghost_witch:s_50",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ghost_witch:s_65", "second_sister_complete_quest"},
	}
}
wod_ghost_witch:addScreen(second_sister_return)

second_sister_complete_quest = ConvoScreen:new {
	id = "second_sister_complete_quest",
	leftDialog = "@conversation/wod_ghost_witch:s_44",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ghost_witch:s_58", "third_sister_start"},
	}
}
wod_ghost_witch:addScreen(second_sister_complete_quest)

third_sister_start = ConvoScreen:new {
	id = "third_sister_start",
	leftDialog = "@conversation/wod_ghost_witch:s_94",
	stopConversation = "true",
	options = {
	}
}
wod_ghost_witch:addScreen(third_sister_start)

third_sister_return = ConvoScreen:new {
	id = "third_sister_return",
	leftDialog = "@conversation/wod_ghost_witch:s_49",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ghost_witch:s_74", "third_sister_first_screen"},
	}
}
wod_ghost_witch:addScreen(third_sister_return)

third_sister_first_screen = ConvoScreen:new {
	id = "third_sister_first_screen",
	leftDialog = "@conversation/wod_ghost_witch:s_37",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ghost_witch:s_57", "third_sister_complete_quest"},
	}
}
wod_ghost_witch:addScreen(third_sister_first_screen)

third_sister_complete_quest = ConvoScreen:new {
	id = "third_sister_complete_quest",
	leftDialog = "", --Handled in the convo handler
	stopConversation = "true",
	options = {
	}
}
wod_ghost_witch:addScreen(third_sister_complete_quest)

first_sister_in_progress = ConvoScreen:new {
	id = "first_sister_in_progress",
	leftDialog = "@conversation/wod_ghost_witch:s_110",
	stopConversation = "false",
	options = {
	}
}
wod_ghost_witch:addScreen(first_sister_in_progress)

second_sister_in_progress = ConvoScreen:new {
	id = "second_sister_in_progress",
	leftDialog = "@conversation/wod_ghost_witch:s_104",
	stopConversation = "false",
	options = {
	}
}
wod_ghost_witch:addScreen(second_sister_in_progress)

third_sister_in_progress = ConvoScreen:new {
	id = "third_sister_in_progress",
	leftDialog = "@conversation/wod_ghost_witch:s_93",
	stopConversation = "false",
	options = {
	}
}
wod_ghost_witch:addScreen(third_sister_in_progress)

not_elligible = ConvoScreen:new {
	id = "not_elligible",
	leftDialog = "@conversation/wod_ghost_witch:s_120",
	stopConversation = "false",
	options = {
	}
}
wod_ghost_witch:addScreen(not_elligible)

quest_completed = ConvoScreen:new {
	id = "quest_completed",
	leftDialog = "@conversation/wod_ghost_witch:s_29",
	stopConversation = "false",
	options = {
	}
}
wod_ghost_witch:addScreen(quest_completed)

addConversationTemplate("wod_ghost_witch", wod_ghost_witch);
