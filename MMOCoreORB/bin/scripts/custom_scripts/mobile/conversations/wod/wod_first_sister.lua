wod_first_sister = ConvoTemplate:new {
	initialScreen = "initial",
	templateType = "Lua",
	luaClassHandler = "wod_first_sister_convo_handler",
	screens = {}
}

initial = ConvoScreen:new {
	id = "initial",
	leftDialog = "@conversation/wod_first_sister:s_4",
	stopConversation = "false",
	options = {
		{"@conversation/wod_first_sister:s_6", "start_fight"},
	}
}
wod_first_sister:addScreen(initial)

start_fight = ConvoScreen:new {
	id = "start_fight",
	leftDialog = "@conversation/wod_first_sister:s_8",
	stopConversation = "true",
	options = {
	}
}
wod_first_sister:addScreen(start_fight)

not_elligible = ConvoScreen:new {
	id = "not_elligible",
	leftDialog = "@conversation/wod_first_sister:s_10",
	stopConversation = "true",
	options = {
	}
}
wod_first_sister:addScreen(not_elligible)

addConversationTemplate("wod_first_sister", wod_first_sister);
