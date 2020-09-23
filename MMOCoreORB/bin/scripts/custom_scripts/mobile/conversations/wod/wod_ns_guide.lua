wod_ns_guide= ConvoTemplate:new {
	initialScreen = "initial",
	templateType = "Lua",
	luaClassHandler = "wod_ns_guide_convo_handler",
	screens = {}
}

initial = ConvoScreen:new {
	id = "initial",
	leftDialog = "@conversation/wod_ns_guide:s_10",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ns_guide:s_12", "first_screen"},
	}
}
wod_ns_guide:addScreen(initial)

first_screen = ConvoScreen:new {
	id = "first_screen",
	leftDialog = "@conversation/wod_ns_guide:s_14",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ns_guide:s_16", "continue"},
		{"@conversation/wod_ns_guide:s_19", "information"},
		{"@conversation/wod_ns_guide:s_68", "end_conv"},
	}
}
wod_ns_guide:addScreen(first_screen)

continue = ConvoScreen:new {
	id = "continue",
	leftDialog = "@conversation/wod_ns_guide:s_75",
	stopConversation = "true",
	options = {
	}
}
wod_ns_guide:addScreen(continue)

information = ConvoScreen:new {
	id = "information",
	leftDialog = "@conversation/wod_ns_guide:s_21",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ns_guide:s_23", "information_first_screen"},
		{"@conversation/wod_ns_guide:s_28", "information_other"},
		{"@conversation/wod_ns_guide:s_39", "information_crafting"},
		{"@conversation/wod_ns_guide:s_58", "information_subtle_skills"},
		{"@conversation/wod_ns_guide:s_64", "information_vendor"},
	}
}
wod_ns_guide:addScreen(information)

information_first_screen = ConvoScreen:new {
	id = "information_first_screen",
	leftDialog = "@conversation/wod_ns_guide:s_25",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ns_guide:s_72", "information_second_screen"},
	}
}
wod_ns_guide:addScreen(information_first_screen)

information_second_screen = ConvoScreen:new {
	id = "information_second_screen",
	leftDialog = "@conversation/wod_ns_guide:s_45",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ns_guide:s_47", "information_third_screen"},
	}
}
wod_ns_guide:addScreen(information_second_screen)

information_third_screen = ConvoScreen:new {
	id = "information_third_screen",
	leftDialog = "@conversation/wod_ns_guide:s_49",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ns_guide:s_32", "information"},
	}
}
wod_ns_guide:addScreen(information_third_screen)

information_other = ConvoScreen:new {
	id = "information_other",
	leftDialog = "@conversation/wod_ns_guide:s_30",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ns_guide:s_35", "information_other_first_screen"},
	}
}
wod_ns_guide:addScreen(information_other)

information_other_first_screen = ConvoScreen:new {
	id = "information_other_first_screen",
	leftDialog = "@conversation/wod_ns_guide:s_37",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ns_guide:s_51", "information_other_second_screen"},
	}
}
wod_ns_guide:addScreen(information_other_first_screen)

information_other_second_screen = ConvoScreen:new {
	id = "information_other_second_screen",
	leftDialog = "@conversation/wod_ns_guide:s_69",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ns_guide:s_54", "information_other_leave"},
		{"@conversation/wod_ns_guide:s_43", "information"},
	}
}
wod_ns_guide:addScreen(information_other_second_screen)

information_other_leave = ConvoScreen:new {
	id = "information_other_leave",
	leftDialog = "@conversation/wod_ns_guide:s_56",
	stopConversation = "true",
	options = {
	}
}
wod_ns_guide:addScreen(information_other_leave)

information_crafting = ConvoScreen:new {
	id = "information_crafting",
	leftDialog = "@conversation/wod_ns_guide:s_41",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ns_guide:s_54", "information_crafting_end"},
		{"@conversation/wod_ns_guide:s_32", "information"},
	}
}
wod_ns_guide:addScreen(information_crafting)

information_crafting_end = ConvoScreen:new {
	id = "information_crafting_end",
	leftDialog = "@conversation/wod_ns_guide:s_56",
	stopConversation = "true",
	options = {
	}
}
wod_ns_guide:addScreen(information_crafting_end)

information_subtle_skills = ConvoScreen:new {
	id = "information_subtle_skills",
	leftDialog = "@conversation/wod_ns_guide:s_60",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ns_guide:s_74", "information_subtle_skills_end"},
		{"@conversation/wod_ns_guide:s_32", "information"},
	}
}
wod_ns_guide:addScreen(information_subtle_skills)

information_subtle_skills_end = ConvoScreen:new {
	id = "information_subtle_skills_end",
	leftDialog = "@conversation/wod_ns_guide:s_73",
	stopConversation = "true",
	options = {
	}
}
wod_ns_guide:addScreen(information_subtle_skills_end)

information_vendor = ConvoScreen:new {
	id = "information_vendor",
	leftDialog = "@conversation/wod_ns_guide:s_66",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ns_guide:s_35", "information_vendor_end"},
		{"@conversation/wod_ns_guide:s_32", "information"},
	}
}
wod_ns_guide:addScreen(information_vendor)

information_vendor_end = ConvoScreen:new {
	id = "information_vendor_end",
	leftDialog = "@conversation/wod_ns_guide:s_37",
	stopConversation = "true",
	options = {
	}
}
wod_ns_guide:addScreen(information_vendor_end)

end_conv = ConvoScreen:new {
	id = "end_conv",
	leftDialog = "@conversation/wod_ns_guide:s_33",
	stopConversation = "true",
	options = {
	}
}
wod_ns_guide:addScreen(end_conv)

not_elligible = ConvoScreen:new {
	id = "not_elligible",
	leftDialog = "@conversation/wod_ns_guide:s_6",
	stopConversation = "true",
	options = {
	}
}
wod_ns_guide:addScreen(not_elligible)

wrong_alignment = ConvoScreen:new {
	id = "wrong_alignment",
	leftDialog = "@conversation/wod_ns_guide:s_4",
	stopConversation = "true",
	options = {
	}
}
wod_ns_guide:addScreen(wrong_alignment)

not_enough_faction = ConvoScreen:new {
	id = "not_enough_faction",
	leftDialog = "@conversation/wod_ns_guide:s_71",
	stopConversation = "false",
	options = {
		{"@conversation/wod_ns_guide:s_76", "not_enough_faction_end"},
	}
}
wod_ns_guide:addScreen(not_enough_faction)

not_enough_faction_end = ConvoScreen:new {
	id = "not_enough_faction_end",
	leftDialog = "@conversation/wod_ns_guide:s_2",
	stopConversation = "true",
	options = {
	}
}
wod_ns_guide:addScreen(not_enough_faction_end)

addConversationTemplate("wod_ns_guide", wod_ns_guide);
