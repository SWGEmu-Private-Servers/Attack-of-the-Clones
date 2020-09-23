wod_klee= ConvoTemplate:new {
	initialScreen = "initial",
	templateType = "Lua",
	luaClassHandler = "wod_klee_convo_handler",
	screens = {}
}

initial = ConvoScreen:new {
	id = "initial",
	leftDialog = "@conversation/wod_klee:s_19",
	stopConversation = "false",
	options = {
		{"@conversation/wod_klee:s_44", "spiderclan"},
		{"@conversation/wod_klee:s_34", "other_clan"},
	}
}
wod_klee:addScreen(initial)

spiderclan = ConvoScreen:new {
	id = "spiderclan",
	leftDialog = "@conversation/wod_klee:s_97",
	stopConversation = "false",
	options = {
		{"@conversation/wod_klee:s_99", "spiderclan_start"},
		{"@conversation/wod_klee:s_103", "initial"},
	}
}
wod_klee:addScreen(spiderclan)

spiderclan_start = ConvoScreen:new {
	id = "spiderclan_start",
	leftDialog = "@conversation/wod_klee:s_101",
	stopConversation = "true",
	options = {
	}
}
wod_klee:addScreen(spiderclan_start)

other_clan = ConvoScreen:new {
	id = "other_clan",
	leftDialog = "@conversation/wod_klee:s_89",
	stopConversation = "false",
	options = {
		{"@conversation/wod_klee:s_91", "other_clan_start"},
		{"@conversation/wod_klee:s_95", "initial"},
	}
}
wod_klee:addScreen(other_clan)

other_clan_start = ConvoScreen:new {
	id = "other_clan_start",
	leftDialog = "@conversation/wod_klee:s_93",
	stopConversation = "true",
	options = {
	}
}
wod_klee:addScreen(other_clan_start)

other = ConvoScreen:new {
	id = "other",
	leftDialog = "@conversation/wod_klee:s_81",
	stopConversation = "false",
	options = {
		{"@conversation/wod_klee:s_83", "two_clans_start"},
		{"@conversation/wod_klee:s_87", "initial"},
	}
}
wod_klee:addScreen(other)

two_clans_start = ConvoScreen:new {
	id = "two_clans_start",
	leftDialog = "@conversation/wod_klee:s_85",
	stopConversation = "true",
	options = {
	}
}
wod_klee:addScreen(two_clans_start)

init_recon_complete = ConvoScreen:new {
	id = "init_recon_complete",
	leftDialog = "@conversation/wod_klee:s_38",
	stopConversation = "false",
	options = {
		{"@conversation/wod_klee:s_33", "cache_start"},
	}
}
wod_klee:addScreen(init_recon_complete)

cache_start = ConvoScreen:new {
	id = "cache_start",
	leftDialog = "@conversation/wod_klee:s_40",
	stopConversation = "true",
	options = {
	}
}
wod_klee:addScreen(cache_start)

two_clans_return = ConvoScreen:new {
	id = "two_clans_return",
	leftDialog = "@conversation/wod_klee:s_16",
	stopConversation = "false",
	options = {
		{"@conversation/wod_klee:s_33", "init_alt"},
	}
}
wod_klee:addScreen(two_clans_return)

spiderclan_return = ConvoScreen:new {
	id = "spiderclan_return",
	leftDialog = "@conversation/wod_klee:s_13",
	stopConversation = "false",
	options = {
		{"@conversation/wod_klee:s_32", "init_alt"},
	}
}
wod_klee:addScreen(spiderclan_return)

other_clan_return = ConvoScreen:new {
	id = "other_clan_return",
	leftDialog = "@conversation/wod_klee:s_10",
	stopConversation = "false",
	options = {
		{"@conversation/wod_klee:s_31", "init_alt"},
	}
}
wod_klee:addScreen(other_clan_return)

init_alt = ConvoScreen:new {
	id = "init_alt",
	leftDialog = "@conversation/wod_klee:s_2",
	stopConversation = "false",
	options = {
		{"@conversation/wod_klee:s_44", "spiderclan"},
		{"@conversation/wod_klee:s_34", "other_clan"},
	}
}
wod_klee:addScreen(init_alt)

quest_in_progress = ConvoScreen:new {
	id = "quest_in_progress",
	leftDialog = "@conversation/wod_klee:s_55",
	stopConversation = "true",
	options = {
	}
}
wod_klee:addScreen(quest_in_progress)

wrong_alignment = ConvoScreen:new {
	id = "wrong_alignment",
	leftDialog = "@conversation/wod_klee:s_7",
	stopConversation = "true",
	options = {
	}
}
wod_klee:addScreen(wrong_alignment)

not_elligible = ConvoScreen:new {
	id = "not_elligible",
	leftDialog = "@conversation/wod_klee:s_54",
	stopConversation = "true",
	options = {
	}
}
wod_klee:addScreen(not_elligible)

addConversationTemplate("wod_klee", wod_klee);
