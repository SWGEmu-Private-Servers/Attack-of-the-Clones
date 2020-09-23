wod_sm_azzenaj = ConvoTemplate:new {
	initialScreen = "initial",
	templateType = "Lua",
	luaClassHandler = "wod_sm_azzenaj_convo_handler",
	screens = {}
}

initial = ConvoScreen:new {
	id = "initial",
	leftDialog = "@conversation/wod_sm_azzenaj:s_33",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_azzenaj:s_35", "first_screen"},
	}
}
wod_sm_azzenaj:addScreen(initial)

first_screen = ConvoScreen:new {
	id = "first_screen",
	leftDialog = "@conversation/wod_sm_azzenaj:s_37",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_azzenaj:s_42", "second_screen"},
	}
}
wod_sm_azzenaj:addScreen(first_screen)

second_screen = ConvoScreen:new {
	id = "second_screen",
	leftDialog = "@conversation/wod_sm_azzenaj:s_44",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_azzenaj:s_46", "start_quest_lost"},
		{"@conversation/wod_sm_azzenaj:s_3", "decline"},
	}
}
wod_sm_azzenaj:addScreen(second_screen)

start_quest_lost = ConvoScreen:new {
	id = "start_quest_lost",
	leftDialog = "@conversation/wod_sm_azzenaj:s_49",
	stopConversation = "true",
	options = {
	}
}
wod_sm_azzenaj:addScreen(start_quest_lost)

decline = ConvoScreen:new {
	id = "decline",
	leftDialog = "@conversation/wod_sm_azzenaj:s_96",
	stopConversation = "true",
	options = {
	}
}
wod_sm_azzenaj:addScreen(decline)

quest_lost_return = ConvoScreen:new {
	id = "quest_lost_return",
	leftDialog = "@conversation/wod_sm_azzenaj:s_53",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_azzenaj:s_2", "quest_lost_return_first"},
	}
}
wod_sm_azzenaj:addScreen(quest_lost_return)

quest_lost_return_first = ConvoScreen:new {
	id = "quest_lost_return_first",
	leftDialog = "@conversation/wod_sm_azzenaj:s_76",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_azzenaj:s_78", "quest_lost_return_second"},
	}
}
wod_sm_azzenaj:addScreen(quest_lost_return_first)

quest_lost_return_second = ConvoScreen:new {
	id = "quest_lost_return_second",
	leftDialog = "@conversation/wod_sm_azzenaj:s_80",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_azzenaj:s_84", "start_quest_found"},
	}
}
wod_sm_azzenaj:addScreen(quest_lost_return_second)

start_quest_found = ConvoScreen:new {
	id = "start_quest_found",
	leftDialog = "@conversation/wod_sm_azzenaj:s_86",
	stopConversation = "true",
	options = {
	}
}
wod_sm_azzenaj:addScreen(start_quest_found)

quest_found_return = ConvoScreen:new {
	id = "quest_found_return",
	leftDialog = "@conversation/wod_sm_azzenaj:s_20",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_azzenaj:s_39", "quest_found_return_first"},
	}
}
wod_sm_azzenaj:addScreen(quest_found_return)

quest_found_return_first = ConvoScreen:new {
	id = "quest_found_return_first",
	leftDialog = "@conversation/wod_sm_azzenaj:s_40",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_azzenaj:s_48", "quest_found_return_second"},
	}
}
wod_sm_azzenaj:addScreen(quest_found_return_first)

quest_found_return_second = ConvoScreen:new {
	id = "quest_found_return_second",
	leftDialog = "@conversation/wod_sm_azzenaj:s_103",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_azzenaj:s_105", "quest_found_return_third"},
	}
}
wod_sm_azzenaj:addScreen(quest_found_return_second)

quest_found_return_third = ConvoScreen:new {
	id = "quest_found_return_third",
	leftDialog = "@conversation/wod_sm_azzenaj:s_107",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_azzenaj:s_109", "quest_return_fourth"},
	}
}
wod_sm_azzenaj:addScreen(quest_found_return_third)

quest_return_fourth = ConvoScreen:new {
	id = "quest_return_fourth",
	leftDialog = "@conversation/wod_sm_azzenaj:s_11",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_azzenaj:s_113", "start_quest_hate"},
	}
}
wod_sm_azzenaj:addScreen(quest_return_fourth)

start_quest_hate = ConvoScreen:new {
	id = "start_quest_hate",
	leftDialog = "@conversation/wod_sm_azzenaj:s_115",
	stopConversation = "true",
	options = {
	}
}
wod_sm_azzenaj:addScreen(start_quest_hate)

quest_hate_return = ConvoScreen:new {
	id = "quest_hate_return",
	leftDialog = "@conversation/wod_sm_azzenaj:s_81",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_azzenaj:s_82", "quest_hate_return_first"},
	}
}
wod_sm_azzenaj:addScreen(quest_hate_return)

quest_hate_return_first = ConvoScreen:new {
	id = "quest_hate_return_first",
	leftDialog = "@conversation/wod_sm_azzenaj:s_62",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_azzenaj:s_63", "quest_hate_return_second"},
	}
}
wod_sm_azzenaj:addScreen(quest_hate_return_first)

quest_hate_return_second = ConvoScreen:new {
	id = "quest_hate_return_second",
	leftDialog = "@conversation/wod_sm_azzenaj:s_65",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_azzenaj:s_64", "quest_hate_return_third"},
	}
}
wod_sm_azzenaj:addScreen(quest_hate_return_second)

quest_hate_return_third = ConvoScreen:new {
	id = "quest_hate_return_third",
	leftDialog = "@conversation/wod_sm_azzenaj:s_68",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_azzenaj:s_69", "start_quest_challenge"},
		{"@conversation/wod_sm_azzenaj:s_70", "decline_challenge"},
	}
}
wod_sm_azzenaj:addScreen(quest_hate_return_third)

start_quest_challenge = ConvoScreen:new {
	id = "start_quest_challenge",
	leftDialog = "@conversation/wod_sm_azzenaj:s_83",
	stopConversation = "true",
	options = {
	}
}
wod_sm_azzenaj:addScreen(start_quest_challenge)

decline_challenge = ConvoScreen:new {
	id = "decline_challenge",
	leftDialog = "@conversation/wod_sm_azzenaj:s_72",
	stopConversation = "true",
	options = {
	}
}
wod_sm_azzenaj:addScreen(decline_challenge)

quest_complete = ConvoScreen:new {
	id = "quest_complete",
	leftDialog = "@conversation/wod_sm_azzenaj:s_85",
	stopConversation = "true",
	options = {
	}
}
wod_sm_azzenaj:addScreen(quest_complete)

quest_challenge_in_progress = ConvoScreen:new {
	id = "quest_challenge_in_progress",
	leftDialog = "@conversation/wod_sm_azzenaj:s_71",
	stopConversation = "true",
	options = {
	}
}
wod_sm_azzenaj:addScreen(quest_challenge_in_progress)

not_elligible = ConvoScreen:new {
	id = "not_elligible",
	leftDialog = "@conversation/wod_sm_azzenaj:s_60",
	stopConversation = "true",
	options = {
	}
}
wod_sm_azzenaj:addScreen(not_elligible)

quest_lost_in_progress = ConvoScreen:new {
	id = "quest_lost_in_progress",
	leftDialog = "@conversation/wod_sm_azzenaj:s_88",
	stopConversation = "true",
	options = {
	}
}
wod_sm_azzenaj:addScreen(quest_lost_in_progress)

quest_investigation_in_progress = ConvoScreen:new {
	id = "quest_investigation_in_progress",
	leftDialog = "@conversation/wod_sm_azzenaj:s_74",
	stopConversation = "true",
	options = {
	}
}
wod_sm_azzenaj:addScreen(quest_investigation_in_progress)

quest_hate_in_progress = ConvoScreen:new {
	id = "quest_hate_in_progress",
	leftDialog = "@conversation/wod_sm_azzenaj:s_61",
	stopConversation = "true",
	options = {
	}
}
wod_sm_azzenaj:addScreen(quest_hate_in_progress)

wrong_alignment = ConvoScreen:new {
	id = "wrong_alignment",
	leftDialog = "@conversation/wod_sm_azzenaj:s_38",
	stopConversation = "true",
	options = {
	}
}
wod_sm_azzenaj:addScreen(wrong_alignment)

addConversationTemplate("wod_sm_azzenaj", wod_sm_azzenaj);
