wod_queen_mother= ConvoTemplate:new {
	initialScreen = "initial",
	templateType = "Lua",
	luaClassHandler = "wod_queen_mother_convo_handler",
	screens = {}
}

initial = ConvoScreen:new {
	id = "initial",
	leftDialog = "@conversation/wod_queen_mother:s_34",
	stopConversation = "false",
	options = {
		{"@conversation/wod_queen_mother:s_20", "complete_spiderclan_secret"},
	}
}
wod_queen_mother:addScreen(initial)

complete_spiderclan_secret = ConvoScreen:new {
	id = "complete_spiderclan_secret",
	leftDialog = "@conversation/wod_queen_mother:s_21",
	stopConversation = "true",
	options = {
	}
}
wod_queen_mother:addScreen(complete_spiderclan_secret)

hunting_init = ConvoScreen:new {
	id = "hunting_init",
	leftDialog = "@conversation/wod_queen_mother:s_100",
	stopConversation = "false",
	options = {
		{"@conversation/wod_queen_mother:s_101", "hunting_first_screen"},
	}
}
wod_queen_mother:addScreen(hunting_init)

hunting_first_screen = ConvoScreen:new {
	id = "hunting_first_screen",
	leftDialog = "@conversation/wod_queen_mother:s_153",
	stopConversation = "false",
	options = {
		{"@conversation/wod_queen_mother:s_173", "hunting_start_quest"},
	}
}
wod_queen_mother:addScreen(hunting_first_screen)

hunting_start_quest = ConvoScreen:new {
	id = "hunting_start_quest",
	leftDialog = "@conversation/wod_queen_mother:s_174",
	stopConversation = "true",
	options = {
	}
}
wod_queen_mother:addScreen(hunting_start_quest)

busy = ConvoScreen:new {
	id = "busy",
	leftDialog = "@conversation/wod_queen_mother:s_165",
	stopConversation = "true",
	options = {
	}
}
wod_queen_mother:addScreen(busy)

not_elligible = ConvoScreen:new {
	id = "not_elligible",
	leftDialog = "@conversation/wod_queen_mother:s_30",
	stopConversation = "true",
	options = {
	}
}
wod_queen_mother:addScreen(not_elligible)

quest_complete = ConvoScreen:new {
	id = "quest_complete",
	leftDialog = "@conversation/wod_queen_mother:s_15",
	stopConversation = "true",
	options = {
	}
}
wod_queen_mother:addScreen(quest_complete)

not_in_group = ConvoScreen:new {
	id = "not_in_group",
	leftDialog = "@conversation/wod_queen_mother:s_175",
	stopConversation = "false",
	options = {
		{"@conversation/wod_queen_mother:s_176", "not_in_group_end"},
	}
}
wod_queen_mother:addScreen(not_in_group)

not_in_group_end = ConvoScreen:new {
	id = "not_in_group_end",
	leftDialog = "@conversation/wod_queen_mother:s_177",
	stopConversation = "true",
	options = {
	}
}
wod_queen_mother:addScreen(not_in_group_end)

addConversationTemplate("wod_queen_mother", wod_queen_mother);
