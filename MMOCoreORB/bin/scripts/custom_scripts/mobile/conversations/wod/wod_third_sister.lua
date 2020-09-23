wod_third_sister = ConvoTemplate:new {
	initialScreen = "initial",
	templateType = "Lua",
	luaClassHandler = "wod_third_sister_convo_handler",
	screens = {}
}

initial = ConvoScreen:new {
	id = "initial",
	leftDialog = "@conversation/wod_third_sister:s_4",
	stopConversation = "false",
	options = {
		{"@conversation/wod_third_sister:s_6", "first_screen"},
	}
}
wod_third_sister:addScreen(initial)

first_screen = ConvoScreen:new {
	id = "first_screen",
	leftDialog = "@conversation/wod_third_sister:s_11",
	stopConversation = "false",
	options = {
		{"@conversation/wod_third_sister:s_12", "second_screen"},
	}
}
wod_third_sister:addScreen(first_screen)

second_screen = ConvoScreen:new {
	id = "second_screen",
	leftDialog = "@conversation/wod_third_sister:s_13",
	stopConversation = "false",
	options = {
		{"@conversation/wod_third_sister:s_14", "start_fight"},
	}
}
wod_third_sister:addScreen(second_screen)

start_fight = ConvoScreen:new {
	id = "start_fight",
	leftDialog = "@conversation/wod_third_sister:s_16",
	stopConversation = "true",
	options = {
	}
}
wod_third_sister:addScreen(start_fight)

addConversationTemplate("wod_third_sister", wod_third_sister);
