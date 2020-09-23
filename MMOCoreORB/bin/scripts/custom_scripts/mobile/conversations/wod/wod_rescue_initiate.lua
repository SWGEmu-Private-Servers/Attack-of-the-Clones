wod_rescue_initiate= ConvoTemplate:new {
	initialScreen = "initial_ns",
	templateType = "Lua",
	luaClassHandler = "wod_rescue_initiate_convo_handler",
	screens = {}
}

initial_ns = ConvoScreen:new {
	id = "initial_ns",
	leftDialog = "@conversation/wod_rescue_initiate:s_15",
	stopConversation = "false",
	options = {
		{"@conversation/wod_rescue_initiate:s_16", "first_screen_ns"},
	}
}
wod_rescue_initiate:addScreen(initial_ns)

first_screen_ns = ConvoScreen:new {
	id = "first_screen_ns",
	leftDialog = "@conversation/wod_rescue_initiate:s_17",
	stopConversation = "false",
	options = {
		{"@conversation/wod_rescue_initiate:s_18", "complete_quest_ns"},
	}
}
wod_rescue_initiate:addScreen(first_screen_ns)

complete_quest_ns = ConvoScreen:new {
	id = "complete_quest_ns",
	leftDialog = "@conversation/wod_rescue_initiate:s_19",
	stopConversation = "true",
	options = {
	}
}
wod_rescue_initiate:addScreen(complete_quest_ns)

not_elligible_ns = ConvoScreen:new {
	id = "not_elligible_ns",
	leftDialog = "@conversation/wod_rescue_initiate:s_2",
	stopConversation = "true",
	options = {
	}
}
wod_rescue_initiate:addScreen(not_elligible_ns)

initial_sm = ConvoScreen:new {
	id = "initial_sm",
	leftDialog = "@conversation/wod_rescue_initiate:s_4",
	stopConversation = "false",
	options = {
		{"@conversation/wod_rescue_initiate:s_7", "first_screen_sm"},
	}
}
wod_rescue_initiate:addScreen(initial_sm)

first_screen_sm = ConvoScreen:new {
	id = "first_screen_sm",
	leftDialog = "@conversation/wod_rescue_initiate:s_8",
	stopConversation = "false",
	options = {
		{"@conversation/wod_rescue_initiate:s_18", "complete_quest_sm"},
	}
}
wod_rescue_initiate:addScreen(first_screen_sm)

complete_quest_sm = ConvoScreen:new {
	id = "complete_quest_sm",
	leftDialog = "@conversation/wod_rescue_initiate:s_12",
	stopConversation = "true",
	options = {
	}
}
wod_rescue_initiate:addScreen(complete_quest_sm)

not_elligible_sm = ConvoScreen:new {
	id = "not_elligible_sm",
	leftDialog = "@conversation/wod_rescue_initiate:s_14",
	stopConversation = "true",
	options = {
	}
}
wod_rescue_initiate:addScreen(not_elligible_sm)

addConversationTemplate("wod_rescue_initiate", wod_rescue_initiate);
