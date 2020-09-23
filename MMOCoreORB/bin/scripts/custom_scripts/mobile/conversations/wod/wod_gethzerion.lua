wod_gethzerion= ConvoTemplate:new {
	initialScreen = "initial",
	templateType = "Lua",
	luaClassHandler = "wod_gethzerion_convo_handler",
	screens = {}
}

initial = ConvoScreen:new {
	id = "initial",
	leftDialog = "@conversation/wod_gethzerion:s_19",
	stopConversation = "false",
	options = {
		{"@conversation/wod_gethzerion:s_88", "spiderclan"},
		{"@conversation/wod_gethzerion:s_79", "other_clan"},
	}
}
wod_gethzerion:addScreen(initial)

spiderclan = ConvoScreen:new {
	id = "spiderclan",
	leftDialog = "@conversation/wod_gethzerion:s_90",
	stopConversation = "false",
	options = {
		{"@conversation/wod_gethzerion:s_83", "spiderclan_start"},
		{"@conversation/wod_gethzerion:s_87", "initial"},
	}
}
wod_gethzerion:addScreen(spiderclan)

spiderclan_start = ConvoScreen:new {
	id = "spiderclan_start",
	leftDialog = "@conversation/wod_gethzerion:s_85",
	stopConversation = "true",
	options = {
	}
}
wod_gethzerion:addScreen(spiderclan_start)

other_clan = ConvoScreen:new {
	id = "other_clan",
	leftDialog = "@conversation/wod_gethzerion:s_81",
	stopConversation = "false",
	options = {
		{"@conversation/wod_gethzerion:s_91", "other_clan_start"},
		{"@conversation/wod_gethzerion:s_95", "initial"},
	}
}
wod_gethzerion:addScreen(other_clan)

other_clan_start = ConvoScreen:new {
	id = "other_clan_start",
	leftDialog = "@conversation/wod_gethzerion:s_93",
	stopConversation = "true",
	options = {
	}
}
wod_gethzerion:addScreen(other_clan_start)

other = ConvoScreen:new {
	id = "other",
	leftDialog = "@conversation/wod_gethzerion:s_55",
	stopConversation = "false",
	options = {
		{"@conversation/wod_gethzerion:s_57", "two_clans_start"},
		{"@conversation/wod_gethzerion:s_61", "initial"},
	}
}
wod_gethzerion:addScreen(other)

two_clans_start = ConvoScreen:new {
	id = "two_clans_start",
	leftDialog = "@conversation/wod_gethzerion:s_59",
	stopConversation = "true",
	options = {
	}
}
wod_gethzerion:addScreen(two_clans_start)

init_recon_complete = ConvoScreen:new {
	id = "init_recon_complete",
	leftDialog = "@conversation/wod_gethzerion:s_39",
	stopConversation = "false",
	options = {
		{"@conversation/wod_gethzerion:s_38", "cache_start"},
	}
}
wod_gethzerion:addScreen(init_recon_complete)

cache_start = ConvoScreen:new {
	id = "cache_start",
	leftDialog = "@conversation/wod_gethzerion:s_37",
	stopConversation = "true",
	options = {
	}
}
wod_gethzerion:addScreen(cache_start)

two_clans_return = ConvoScreen:new {
	id = "two_clans_return",
	leftDialog = "@conversation/wod_gethzerion:s_12",
	stopConversation = "false",
	options = {
		{"@conversation/wod_gethzerion:s_32", "init_alt"},
	}
}
wod_gethzerion:addScreen(two_clans_return)

spiderclan_return = ConvoScreen:new {
	id = "spiderclan_return",
	leftDialog = "@conversation/wod_gethzerion:s_10",
	stopConversation = "false",
	options = {
		{"@conversation/wod_gethzerion:s_31", "init_alt"},
	}
}
wod_gethzerion:addScreen(spiderclan_return)

other_clan_return = ConvoScreen:new {
	id = "other_clan_return",
	leftDialog = "@conversation/wod_gethzerion:s_9",
	stopConversation = "false",
	options = {
		{"@conversation/wod_gethzerion:s_33", "init_alt"},
	}
}
wod_gethzerion:addScreen(other_clan_return)

init_alt = ConvoScreen:new {
	id = "init_alt",
	leftDialog = "@conversation/wod_gethzerion:s_2",
	stopConversation = "false",
	options = {
		{"@conversation/wod_gethzerion:s_88", "spiderclan"},
		{"@conversation/wod_gethzerion:s_79", "other_clan"},
	}
}
wod_gethzerion:addScreen(init_alt)

quest_in_progress = ConvoScreen:new {
	id = "quest_in_progress",
	leftDialog = "@conversation/wod_gethzerion:s_34",
	stopConversation = "true",
	options = {
	}
}
wod_gethzerion:addScreen(quest_in_progress)

wrong_alignment = ConvoScreen:new {
	id = "wrong_alignment",
	leftDialog = "@conversation/wod_gethzerion:s_7",
	stopConversation = "true",
	options = {
	}
}
wod_gethzerion:addScreen(wrong_alignment)

not_elligible = ConvoScreen:new {
	id = "not_elligible",
	leftDialog = "@conversation/wod_gethzerion:s_52",
	stopConversation = "true",
	options = {
	}
}
wod_gethzerion:addScreen(not_elligible)

addConversationTemplate("wod_gethzerion", wod_gethzerion);
