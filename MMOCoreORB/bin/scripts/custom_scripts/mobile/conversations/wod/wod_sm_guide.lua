wod_sm_guide = ConvoTemplate:new {
	initialScreen = "initial",
	templateType = "Lua",
	luaClassHandler = "wod_sm_guide_convo_handler",
	screens = {}
}

initial = ConvoScreen:new {
	id = "initial",
	leftDialog = "@conversation/wod_ns_guide:s_10",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_guide:s_12", "first_screen"},
	}
}
wod_sm_guide:addScreen(initial)

first_screen = ConvoScreen:new {
	id = "first_screen",
	leftDialog = "@conversation/wod_sm_guide:s_14",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_guide:s_16", "continue"},
		{"@conversation/wod_sm_guide:s_19", "information"},
		{"@conversation/wod_sm_guide:s_100", "end_conv"},
	}
}
wod_sm_guide:addScreen(first_screen)

continue = ConvoScreen:new {
	id = "continue",
	leftDialog = "@conversation/wod_sm_guide:s_33",
	stopConversation = "true",
	options = {
	}
}
wod_sm_guide:addScreen(continue)

information = ConvoScreen:new {
	id = "information",
	leftDialog = "@conversation/wod_sm_guide:s_21",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_guide:s_23", "information_first_screen"},
		{"@conversation/wod_sm_guide:s_28", "information_other"},
		{"@conversation/wod_sm_guide:s_39", "information_crafting"},
		{"@conversation/wod_sm_guide:s_63", "information_subtle_skills"},
		{"@conversation/wod_sm_guide:s_76", "information_vendor"},
	}
}
wod_sm_guide:addScreen(information)

information_first_screen = ConvoScreen:new {
	id = "information_first_screen",
	leftDialog = "@conversation/wod_sm_guide:s_25",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_guide:s_72", "information"},
	}
}
wod_sm_guide:addScreen(information_first_screen)

information_other = ConvoScreen:new {
	id = "information_other",
	leftDialog = "@conversation/wod_sm_guide:s_30",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_guide:s_35", "information_other_end"},
		{"@conversation/wod_sm_guide:s_32", "information"},
	}
}
wod_sm_guide:addScreen(information_other)

information_other_end = ConvoScreen:new {
	id = "information_other_end",
	leftDialog = "@conversation/wod_sm_guide:s_37",
	stopConversation = "true",
	options = {
	}
}
wod_sm_guide:addScreen(information_other_end)

information_crafting = ConvoScreen:new {
	id = "information_crafting",
	leftDialog = "@conversation/wod_sm_guide:s_41",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_guide:s_43", "information_vendor_alt"},
		{"@conversation/wod_sm_guide:s_89", "information_crafting_end"},
	}
}
wod_sm_guide:addScreen(information_crafting)

information_vendor_alt = ConvoScreen:new {
	id = "information_vendor_alt",
	leftDialog = "@conversation/wod_sm_guide:s_45",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_guide:s_47", "information_charge"},
		{"@conversation/wod_sm_guide:s_57", "information_vendor_end"},
	}
}
wod_sm_guide:addScreen(information_vendor_alt)

information_charge = ConvoScreen:new {
	id = "information_charge",
	leftDialog = "@conversation/wod_sm_guide:s_49",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_guide:s_51", "information_charge_first_screen"},
	}
}
wod_sm_guide:addScreen(information_charge)

information_charge_first_screen = ConvoScreen:new {
	id = "information_charge_first_screen",
	leftDialog = "@conversation/wod_sm_guide:s_69",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_guide:s_77", "information_charge_end"},
		{"@conversation/wod_sm_guide:s_81", "information"},
	}
}
wod_sm_guide:addScreen(information_charge_first_screen)

information_charge_end = ConvoScreen:new {
	id = "information_charge_end",
	leftDialog = "@conversation/wod_sm_guide:s_78",
	stopConversation = "true",
	options = {
	}
}
wod_sm_guide:addScreen(information_charge_end)

information_vendor_end = ConvoScreen:new {
	id = "information_vendor_end",
	leftDialog = "@conversation/wod_sm_guide:s_59",
	stopConversation = "true",
	options = {
	}
}
wod_sm_guide:addScreen(information_vendor_end)

information_crafting_end = ConvoScreen:new {
	id = "information_crafting_end",
	leftDialog = "@conversation/wod_sm_guide:s_90",
	stopConversation = "true",
	options = {
	}
}
wod_sm_guide:addScreen(information_crafting_end)

information_subtle_skills = ConvoScreen:new {
	id = "information_subtle_skills",
	leftDialog = "@conversation/wod_sm_guide:s_65",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_guide:s_74", "information_subtle_skills_end"},
		{"@conversation/wod_sm_guide:s_82", "information"},
	}
}
wod_sm_guide:addScreen(information_subtle_skills)

information_subtle_skills_end = ConvoScreen:new {
	id = "information_subtle_skills_end",
	leftDialog = "@conversation/wod_sm_guide:s_75",
	stopConversation = "true",
	options = {
	}
}
wod_sm_guide:addScreen(information_subtle_skills_end)

information_vendor = ConvoScreen:new {
	id = "information_vendor",
	leftDialog = "@conversation/wod_sm_guide:s_80",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_guide:s_84", "information_vendor_end"},
		{"@conversation/wod_sm_guide:s_88", "information_vendor_barter"},
	}
}
wod_sm_guide:addScreen(information_vendor)

information_vendor_end = ConvoScreen:new {
	id = "information_vendor_end",
	leftDialog = "@conversation/wod_sm_guide:s_86",
	stopConversation = "true",
	options = {
	}
}
wod_sm_guide:addScreen(information_vendor_end)

information_vendor_barter = ConvoScreen:new {
	id = "information_vendor_barter",
	leftDialog = "@conversation/wod_sm_guide:s_92",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_guide:s_94", "information_vendor_barter_end"},
		{"@conversation/wod_sm_guide:s_98", "information"},
	}
}
wod_sm_guide:addScreen(information_vendor_barter)

information_vendor_barter_end = ConvoScreen:new {
	id = "information_vendor_barter_end",
	leftDialog = "@conversation/wod_sm_guide:s_96",
	stopConversation = "true",
	options = {
	}
}
wod_sm_guide:addScreen(information_vendor_barter_end)

end_conv = ConvoScreen:new {
	id = "end_conv",
	leftDialog = "@conversation/wod_sm_guide:s_102",
	stopConversation = "true",
	options = {
	}
}
wod_sm_guide:addScreen(end_conv)

not_elligible = ConvoScreen:new {
	id = "not_elligible",
	leftDialog = "@conversation/wod_sm_guide:s_4",
	stopConversation = "true",
	options = {
	}
}
wod_sm_guide:addScreen(not_elligible)

wrong_alignment = ConvoScreen:new {
	id = "wrong_alignment",
	leftDialog = "@conversation/wod_sm_guide:s_6",
	stopConversation = "true",
	options = {
	}
}
wod_sm_guide:addScreen(wrong_alignment)

not_enough_faction = ConvoScreen:new {
	id = "not_enough_faction",
	leftDialog = "@conversation/wod_sm_guide:s_68",
	stopConversation = "false",
	options = {
		{"@conversation/wod_sm_guide:s_70", "not_enough_faction_end"},
	}
}
wod_sm_guide:addScreen(not_enough_faction)

not_enough_faction_end = ConvoScreen:new {
	id = "not_enough_faction_end",
	leftDialog = "@conversation/wod_sm_guide:s_2",
	stopConversation = "true",
	options = {
	}
}
wod_sm_guide:addScreen(not_enough_faction_end)

addConversationTemplate("wod_sm_guide", wod_sm_guide);
