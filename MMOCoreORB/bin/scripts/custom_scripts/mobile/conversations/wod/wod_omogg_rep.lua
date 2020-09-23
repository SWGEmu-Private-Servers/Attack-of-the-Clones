wod_omogg_rep = ConvoTemplate:new {
	initialScreen = "initial",
	templateType = "Lua",
	luaClassHandler = "wod_omogg_rep_convo_handler",
	screens = {}
}

initial = ConvoScreen:new {
	id = "initial",
	leftDialog = "@conversation/wod_omogg_rep:s_19",
	stopConversation = "false",
	options = {
		{"@conversation/wod_omogg_rep:s_21", "first_screen"},
	}
}
wod_omogg_rep:addScreen(initial)

first_screen = ConvoScreen:new {
	id = "first_screen",
	leftDialog = "@conversation/wod_omogg_rep:s_26",
	stopConversation = "false",
	options = {
		{"@conversation/wod_omogg_rep:s_28", "second_screen"},
	}
}
wod_omogg_rep:addScreen(first_screen)

second_screen = ConvoScreen:new {
	id = "second_screen",
	leftDialog = "@conversation/wod_omogg_rep:s_30",
	stopConversation = "false",
	options = {
		{"@conversation/wod_omogg_rep:s_32", "walkabout_start"},
		{"@conversation/wod_omogg_rep:s_38", "walkabout_decline"},
	}
}
wod_omogg_rep:addScreen(second_screen)

walkabout_start = ConvoScreen:new {
	id = "walkabout_start",
	leftDialog = "@conversation/wod_omogg_rep:s_34",
	stopConversation = "true",
	options = {
	}
}
wod_omogg_rep:addScreen(walkabout_start)

walkabout_decline = ConvoScreen:new {
	id = "walkabout_decline",
	leftDialog = "@conversation/wod_omogg_rep:s_40",
	stopConversation = "true",
	options = {
	}
}
wod_omogg_rep:addScreen(walkabout_decline)

walkabout_return_init = ConvoScreen:new {
	id = "walkabout_return_init",
	leftDialog = "@conversation/wod_omogg_rep:s_6",
	stopConversation = "false",
	options = {
		{"@conversation/wod_omogg_rep:s_12", "walkabout_complete"},
	}
}
wod_omogg_rep:addScreen(walkabout_return_init)

walkabout_complete = ConvoScreen:new {
	id = "walkabout_complete",
	leftDialog = "@conversation/wod_omogg_rep:s_13",
	stopConversation = "false",
	options = {
		{"@conversation/wod_omogg_rep:s_35", "walkabout_two_first_screen"},
	}
}
wod_omogg_rep:addScreen(walkabout_complete)

walkabout_two_first_screen = ConvoScreen:new {
	id = "walkabout_two_first_screen",
	leftDialog = "@conversation/wod_omogg_rep:s_36",
	stopConversation = "false",
	options = {
		{"@conversation/wod_omogg_rep:s_44", "walkabout_two_start"},
		{"@conversation/wod_omogg_rep:s_48", "walkabout_two_decline"},
	}
}
wod_omogg_rep:addScreen(walkabout_two_first_screen)

walkabout_two_init_alt = ConvoScreen:new {
	id = "walkabout_two_init_alt",
	leftDialog = "@conversation/wod_omogg_rep:s_42",
	stopConversation = "false",
	options = {
		{"@conversation/wod_omogg_rep:s_44", "walkabout_two_start"},
		{"@conversation/wod_omogg_rep:s_48", "walkabout_two_decline"},
	}
}
wod_omogg_rep:addScreen(walkabout_two_init_alt)

walkabout_two_start = ConvoScreen:new {
	id = "walkabout_two_start",
	leftDialog = "@conversation/wod_omogg_rep:s_46",
	stopConversation = "true",
	options = {
	}
}
wod_omogg_rep:addScreen(walkabout_two_start)

walkabout_two_decline = ConvoScreen:new {
	id = "walkabout_two_decline",
	leftDialog = "@conversation/wod_omogg_rep:s_50",
	stopConversation = "true",
	options = {
	}
}
wod_omogg_rep:addScreen(walkabout_two_decline)

walkabout_two_return_init = ConvoScreen:new {
	id = "walkabout_two_return_init",
	leftDialog = "@conversation/wod_omogg_rep:s_23",
	stopConversation = "false",
	options = {
		{"@conversation/wod_omogg_rep:s_24", "walkabout_two_complete"},
	}
}
wod_omogg_rep:addScreen(walkabout_two_return_init)

walkabout_two_complete = ConvoScreen:new {
	id = "walkabout_two_complete",
	leftDialog = "@conversation/wod_omogg_rep:s_25",
	stopConversation = "true",
	options = {
	}
}
wod_omogg_rep:addScreen(walkabout_two_complete)

quest_completed = ConvoScreen:new {
	id = "quest_completed",
	leftDialog = "@conversation/wod_omogg_rep:s_4",
	stopConversation = "true",
	options = {
	}
}
wod_omogg_rep:addScreen(quest_completed)

not_elligible = ConvoScreen:new {
	id = "not_elligible",
	leftDialog = "@conversation/wod_omogg_rep:s_52",
	stopConversation = "true",
	options = {
	}
}
wod_omogg_rep:addScreen(not_elligible)

quest_in_progress = ConvoScreen:new {
	id = "quest_in_progress",
	leftDialog = "@conversation/wod_omogg_rep:s_17",
	stopConversation = "true",
	options = {
	}
}
wod_omogg_rep:addScreen(quest_in_progress)

addConversationTemplate("wod_omogg_rep", wod_omogg_rep);
