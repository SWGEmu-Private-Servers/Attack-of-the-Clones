wod_kyrisa = ConvoTemplate:new {
	initialScreen = "initial",
	templateType = "Lua",
	luaClassHandler = "wod_kyrisa_convo_handler",
	screens = {}
}

initial = ConvoScreen:new {
	id = "initial",
	leftDialog = "@conversation/wod_kyrisa:s_34",
	stopConversation = "false",
	options = {
		{"@conversation/wod_kyrisa:s_20", "first_screen"},
	}
}
wod_kyrisa:addScreen(initial)

first_screen = ConvoScreen:new {
	id = "first_screen",
	leftDialog = "@conversation/wod_kyrisa:s_21",
	stopConversation = "false",
	options = {
		{"@conversation/wod_kyrisa:s_22", "second_screen"},
	}
}
wod_kyrisa:addScreen(first_screen)

second_screen = ConvoScreen:new {
	id = "second_screen",
	leftDialog = "@conversation/wod_kyrisa:s_23",
	stopConversation = "false",
	options = {
		{"@conversation/wod_kyrisa:s_24", "third_screen"},
	}
}
wod_kyrisa:addScreen(second_screen)

third_screen = ConvoScreen:new {
	id = "third_screen",
	leftDialog = "@conversation/wod_kyrisa:s_25",
	stopConversation = "false",
	options = {
		{"@conversation/wod_kyrisa:s_26", "complete_quest"},
	}
}
wod_kyrisa:addScreen(third_screen)

complete_quest = ConvoScreen:new {
	id = "complete_quest",
	leftDialog = "@conversation/wod_kyrisa:s_27",
	stopConversation = "true",
	options = {
	}
}
wod_kyrisa:addScreen(complete_quest)

greater_good_init = ConvoScreen:new {
	id = "greater_good_init",
	leftDialog = "@conversation/wod_kyrisa:s_100",
	stopConversation = "false",
	options = {
		{"@conversation/wod_kyrisa:s_101", "greater_good_first_screen"},
	}
}
wod_kyrisa:addScreen(greater_good_init)

greater_good_first_screen = ConvoScreen:new {
	id = "greater_good_first_screen",
	leftDialog = "@conversation/wod_kyrisa:s_153",
	stopConversation = "false",
	options = {
		{"@conversation/wod_kyrisa:s_173", "greater_good_start_quest"},
	}
}
wod_kyrisa:addScreen(greater_good_first_screen)

greater_good_start_quest = ConvoScreen:new {
	id = "greater_good_start_quest",
	leftDialog = "@conversation/wod_kyrisa:s_175",
	stopConversation = "true",
	options = {
	}
}
wod_kyrisa:addScreen(greater_good_start_quest)

not_in_group = ConvoScreen:new {
	id = "not_in_group",
	leftDialog = "@conversation/wod_kyrisa:s_175",
	stopConversation = "true",
	options = {
	}
}
wod_kyrisa:addScreen(not_in_group)

quest_complete = ConvoScreen:new {
	id = "quest_complete",
	leftDialog = "@conversation/wod_kyrisa:s_30",
	stopConversation = "true",
	options = {
	}
}
wod_kyrisa:addScreen(quest_complete)

busy = ConvoScreen:new {
	id = "busy",
	leftDialog = "@conversation/wod_kyrisa:s_165",
	stopConversation = "true",
	options = {
	}
}
wod_kyrisa:addScreen(busy)

not_elligible = ConvoScreen:new {
	id = "not_elligible",
	leftDialog = "@conversation/wod_kyrisa:s_15",
	stopConversation = "true",
	options = {
	}
}
wod_kyrisa:addScreen(not_elligible)

addConversationTemplate("wod_kyrisa", wod_kyrisa);
