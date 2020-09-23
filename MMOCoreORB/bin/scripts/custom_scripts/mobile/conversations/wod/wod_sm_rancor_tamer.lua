wod_sm_rancor_tamer = ConvoTemplate:new {
	initialScreen = "initial",
	templateType = "Lua",
	luaClassHandler = "wod_sm_rancor_tamer_convo_handler",
	screens = {}
}

initial = ConvoScreen:new {
	id = "initial",
	leftDialog = "@conversation/wod_sm_rancor_tamer:s_18",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_rancor_tamer:s_20", "first_screen"},
	}
}
wod_sm_rancor_tamer:addScreen(initial)

first_screen = ConvoScreen:new {
	id = "first_screen",
	leftDialog = "@conversation/wod_sm_rancor_tamer:s_44",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_rancor_tamer:s_45", "second_screen"},
	}
}
wod_sm_rancor_tamer:addScreen(first_screen)

second_screen = ConvoScreen:new {
	id = "second_screen",
	leftDialog = "@conversation/wod_sm_rancor_tamer:s_50",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_rancor_tamer:s_52", "third_screen"},
	}
}
wod_sm_rancor_tamer:addScreen(second_screen)

third_screen = ConvoScreen:new {
	id = "third_screen",
	leftDialog = "@conversation/wod_sm_rancor_tamer:s_54",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_rancor_tamer:s_56", "fourth_screen"},
	}
}
wod_sm_rancor_tamer:addScreen(third_screen)

fourth_screen = ConvoScreen:new {
	id = "fourth_screen",
	leftDialog = "@conversation/wod_sm_rancor_tamer:s_58",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_rancor_tamer:s_60", "fifth_screen"},
	}
}
wod_sm_rancor_tamer:addScreen(fourth_screen)

fifth_screen = ConvoScreen:new {
	id = "fifth_screen",
	leftDialog = "@conversation/wod_sm_rancor_tamer:s_62",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_rancor_tamer:s_51", "sixth_sense"},
	}
}
wod_sm_rancor_tamer:addScreen(fifth_screen)

sixth_sense = ConvoScreen:new {
	id = "sixth_sense",
	leftDialog = "@conversation/wod_sm_rancor_tamer:s_53",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_rancor_tamer:s_91", "start_quest_whole_truth"},
		{"@conversation/wod_sm_rancor_tamer:s_89", "decline"},
	}
}
wod_sm_rancor_tamer:addScreen(sixth_sense)

start_quest_whole_truth = ConvoScreen:new {
	id = "start_quest_whole_truth",
	leftDialog = "@conversation/wod_sm_rancor_tamer:s_93",
	stopConversation = "true",
	options = {
	}
}
wod_sm_rancor_tamer:addScreen(start_quest_whole_truth)

decline = ConvoScreen:new {
	id = "decline",
	leftDialog = "@conversation/wod_sm_rancor_tamer:s_2",
	stopConversation = "false",
	options = {
	}
}
wod_sm_rancor_tamer:addScreen(decline)

return_whole_truth = ConvoScreen:new {
	id = "return_whole_truth",
	leftDialog = "@conversation/wod_sm_rancor_tamer:s_37",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_rancor_tamer:s_39", "complete_quest_whole_truth"},
	}
}
wod_sm_rancor_tamer:addScreen(return_whole_truth)

complete_quest_whole_truth = ConvoScreen:new {
	id = "complete_quest_whole_truth",
	leftDialog = "@conversation/wod_sm_rancor_tamer:s_41",
	stopConversation = "true",
	options = {
	}
}
wod_sm_rancor_tamer:addScreen(complete_quest_whole_truth)

whole_truth_two_init = ConvoScreen:new {
	id = "whole_truth_two_init",
	leftDialog = "@conversation/wod_sm_rancor_tamer:s_64",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_rancor_tamer:s_66", "start_quest_whole_truth_two"},
	}
}
wod_sm_rancor_tamer:addScreen(whole_truth_two_init)

start_quest_whole_truth_two = ConvoScreen:new {
	id = "start_quest_whole_truth_two",
	leftDialog = "@conversation/wod_sm_rancor_tamer:s_68",
	stopConversation = "true",
	options = {
	}
}
wod_sm_rancor_tamer:addScreen(start_quest_whole_truth_two)

return_whole_truth_two = ConvoScreen:new {
	id = "return_whole_truth_two",
	leftDialog = "@conversation/wod_sm_rancor_tamer:s_8",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_rancor_tamer:s_10", "return_whole_truth_two_first"},
	}
}
wod_sm_rancor_tamer:addScreen(return_whole_truth_two)

return_whole_truth_two_first = ConvoScreen:new {
	id = "return_whole_truth_two_first",
	leftDialog = "@conversation/wod_sm_rancor_tamer:s_73",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_rancor_tamer:s_74", "quest_greater_good_start"},
		{"@conversation/wod_sm_rancor_tamer:s_75", "decline_greater_good"},
	}
}
wod_sm_rancor_tamer:addScreen(return_whole_truth_two_first)

quest_greater_good_start = ConvoScreen:new {
	id = "quest_greater_good_start",
	leftDialog = "@conversation/wod_sm_rancor_tamer:s_76",
	stopConversation = "true",
	options = {
	}
}
wod_sm_rancor_tamer:addScreen(quest_greater_good_start)

decline_greater_good = ConvoScreen:new {
	id = "decline_greater_good",
	leftDialog = "@conversation/wod_sm_rancor_tamer:s_77",
	stopConversation = "true",
	options = {
	}
}
wod_sm_rancor_tamer:addScreen(decline_greater_good)

quest_whole_truth_in_progress = ConvoScreen:new {
	id = "quest_whole_truth_in_progress",
	leftDialog = "@conversation/wod_sm_rancor_tamer:s_43",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_rancor_tamer:s_59", "quest_whole_truth_continue"},
	}
}
wod_sm_rancor_tamer:addScreen(quest_whole_truth_in_progress)

quest_whole_truth_continue = ConvoScreen:new {
	id = "quest_whole_truth_continue",
	leftDialog = "@conversation/wod_sm_rancor_tamer:s_61",
	stopConversation = "true",
	options = {
	}
}
wod_sm_rancor_tamer:addScreen(quest_whole_truth_continue)

quest_whole_truth_two_in_progress = ConvoScreen:new {
	id = "quest_whole_truth_two_in_progress",
	leftDialog = "@conversation/wod_sm_rancor_tamer:s_70",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_rancor_tamer:s_72", "quest_whole_truth_two_continue"},
	}
}
wod_sm_rancor_tamer:addScreen(quest_whole_truth_two_in_progress)

quest_whole_truth_two_continue = ConvoScreen:new {
	id = "quest_whole_truth_two_continue",
	leftDialog = "@conversation/wod_sm_rancor_tamer:s_80",
	stopConversation = "true",
	options = {
	}
}
wod_sm_rancor_tamer:addScreen(quest_whole_truth_two_continue)

quest_greater_good_in_progress = ConvoScreen:new {
	id = "quest_greater_good_in_progress",
	leftDialog = "@conversation/wod_sm_rancor_tamer:s_82",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_rancor_tamer:s_84", "quest_greater_good_continue"},
	}
}
wod_sm_rancor_tamer:addScreen(quest_greater_good_in_progress)

quest_greater_good_continue = ConvoScreen:new {
	id = "quest_greater_good_continue",
	leftDialog = "@conversation/wod_sm_rancor_tamer:s_86",
	stopConversation = "true",
	options = {
	}
}
wod_sm_rancor_tamer:addScreen(quest_greater_good_continue)

quest_complete = ConvoScreen:new {
	id = "quest_complete",
	leftDialog = "@conversation/wod_sm_rancor_tamer:s_88",
	stopConversation = "true",
	options = {
	}
}
wod_sm_rancor_tamer:addScreen(quest_complete)

wrong_alignment = ConvoScreen:new {
	id = "wrong_alignment",
	leftDialog = "@conversation/wod_sm_rancor_tamer:s_6",
	stopConversation = "true",
	options = {
	}
}
wod_sm_rancor_tamer:addScreen(wrong_alignment)

not_elligible = ConvoScreen:new {
	id = "not_elligible",
	leftDialog = "@conversation/wod_sm_rancor_tamer:s_4",
	stopConversation = "true",
	options = {
	}
}
wod_sm_rancor_tamer:addScreen(not_elligible)

addConversationTemplate("wod_sm_rancor_tamer", wod_sm_rancor_tamer);
