wod_rubina = ConvoTemplate:new {
	initialScreen = "initial",
	templateType = "Lua",
	luaClassHandler = "wod_rubina_convo_handler",
	screens = {}
}

initial = ConvoScreen:new {
	id = "initial",
	leftDialog = "@conversation/wod_rubina:s_20",
	stopConversation = "false",
	options = {
		{"@conversation/wod_rubina:s_22", "complete_meet_witch"},
	}
}
wod_rubina:addScreen(initial)

complete_meet_witch = ConvoScreen:new {
	id = "complete_meet_witch",
	leftDialog = "@conversation/wod_rubina:s_2",
	stopConversation = "true",
	options = {
	}
}
wod_rubina:addScreen(complete_meet_witch)

second_init = ConvoScreen:new {
	id = "second_init",
	leftDialog = "@conversation/wod_rubina:s_66",
	stopConversation = "false",
	options = {
		{"@conversation/wod_rubina:s_68", "task"},
		{"@conversation/wod_rubina:s_104", "information"},
		{"@conversation/wod_rubina:s_154", "favor"},
	}
}
wod_rubina:addScreen(second_init)

task = ConvoScreen:new {
	id = "task",
	leftDialog = "@conversation/wod_rubina:s_70",
	stopConversation = "false",
	options = {
		{"@conversation/wod_rubina:s_72", "task_information"},
	}
}
wod_rubina:addScreen(task)

task_information = ConvoScreen:new {
	id = "task_information",
	leftDialog = "@conversation/wod_rubina:s_74",
	stopConversation = "false",
	options = {
		{"@conversation/wod_rubina:s_175", "task_herbs"},
		{"@conversation/wod_rubina:s_177", "task_enemies"},
		{"@conversation/wod_rubina:s_179", "task_wisdom"},
	}
}
wod_rubina:addScreen(task_information)

task_herbs = ConvoScreen:new {
	id = "task_herbs",
	leftDialog = "@conversation/wod_rubina:s_176",
	stopConversation = "false",
	options = {
		{"@conversation/wod_rubina:s_181", "task_herbs_info"},
		{"@conversation/wod_rubina:s_88", "task_herbs_start"},
		{"@conversation/wod_rubina:s_5", "task_information"},
	}
}
wod_rubina:addScreen(task_herbs)

task_herbs_info = ConvoScreen:new {
	id = "task_herbs_info",
	leftDialog = "@conversation/wod_rubina:s_182",
	stopConversation = "false",
	options = {
		{"@conversation/wod_rubina:s_88", "task_herbs_start"},
		{"@conversation/wod_rubina:s_5", "task_information"},
	}
}
wod_rubina:addScreen(task_herbs_info)

task_herbs_start = ConvoScreen:new {
	id = "task_herbs_start",
	leftDialog = "@conversation/wod_rubina:s_90",
	stopConversation = "true",
	options = {
	}
}
wod_rubina:addScreen(task_herbs_start)

task_enemies = ConvoScreen:new {
	id = "task_enemies",
	leftDialog = "@conversation/wod_rubina:s_178",
	stopConversation = "false",
	options = {
		{"@conversation/wod_rubina:s_183", "task_enemies_info"},
		{"@conversation/wod_rubina:s_92", "task_enemies_start"},
		{"@conversation/wod_rubina:s_5", "task_information"},
	}
}
wod_rubina:addScreen(task_enemies)

task_enemies_info = ConvoScreen:new {
	id = "task_enemies_info",
	leftDialog = "@conversation/wod_rubina:s_185",
	stopConversation = "false",
	options = {
		{"@conversation/wod_rubina:s_92", "task_enemies_start"},
		{"@conversation/wod_rubina:s_5", "task_information"},
	}
}
wod_rubina:addScreen(task_enemies_info)

task_enemies_start = ConvoScreen:new {
	id = "task_enemies_start",
	leftDialog = "@conversation/wod_rubina:s_94",
	stopConversation = "true",
	options = {
	}
}
wod_rubina:addScreen(task_enemies_start)

task_wisdom = ConvoScreen:new {
	id = "task_wisdom",
	leftDialog = "@conversation/wod_rubina:s_180",
	stopConversation = "false",
	options = {
		{"@conversation/wod_rubina:s_187", "task_wisdom_info"},
		{"@conversation/wod_rubina:s_96", "task_wisdom_start"},
		{"@conversation/wod_rubina:s_5", "task_information"},
	}
}
wod_rubina:addScreen(task_wisdom)

task_wisdom_info = ConvoScreen:new {
	id = "task_wisdom_info",
	leftDialog = "@conversation/wod_rubina:s_188",
	stopConversation = "false",
	options = {
		{"@conversation/wod_rubina:s_96", "task_wisdom_start"},
		{"@conversation/wod_rubina:s_5", "task_information"},
	}
}
wod_rubina:addScreen(task_wisdom_info)

task_wisdom_start = ConvoScreen:new {
	id = "task_wisdom_start",
	leftDialog = "@conversation/wod_rubina:s_98",
	stopConversation = "true",
	options = {
	}
}
wod_rubina:addScreen(task_wisdom_start)

information = ConvoScreen:new {
	id = "information",
	leftDialog = "@conversation/wod_rubina:s_106",
	stopConversation = "false",
	options = {
		{"@conversation/wod_rubina:s_150", "info_favor"},
		{"@conversation/wod_rubina:s_169", "info_reason"},
		{"@conversation/wod_rubina:s_191", "info_witches"},
		{"@conversation/wod_rubina:s_130", "info_sm"},
		{"@conversation/wod_rubina:s_134", "info_ns"},
		{"@conversation/wod_rubina:s_139", "info_spiderclan"},
		{"@conversation/wod_rubina:s_143", "info_magic"},
		{"@conversation/wod_rubina:s_148", "info_task"},
	}
}
wod_rubina:addScreen(information)

info_favor = ConvoScreen:new {
	id = "info_favor",
	leftDialog = "@conversation/wod_rubina:s_151",
	stopConversation = "false",
	options = {
		{"@conversation/wod_rubina:s_163", "info_favor_second"},
	}
}
wod_rubina:addScreen(info_favor)

info_favor_second = ConvoScreen:new {
	id = "info_favor_second",
	leftDialog = "@conversation/wod_rubina:s_165",
	stopConversation = "false",
	options = {
		{"@conversation/wod_rubina:s_166", "info_favor_third"},
	}
}
wod_rubina:addScreen(info_favor_second)

info_favor_third = ConvoScreen:new {
	id = "info_favor_third",
	leftDialog = "@conversation/wod_rubina:s_167",
	stopConversation = "false",
	options = {
		{"@conversation/wod_rubina:s_169", "info_reason"},
		{"@conversation/wod_rubina:s_191", "info_witches"},
		{"@conversation/wod_rubina:s_130", "info_sm"},
		{"@conversation/wod_rubina:s_134", "info_ns"},
		{"@conversation/wod_rubina:s_139", "info_spiderclan"},
		{"@conversation/wod_rubina:s_143", "info_magic"},
		{"@conversation/wod_rubina:s_148", "info_task"},
	}
}
wod_rubina:addScreen(info_favor_third)

info_reason = ConvoScreen:new {
	id = "info_reason",
	leftDialog = "@conversation/wod_rubina:s_170",
	stopConversation = "false",
	options = {
		{"@conversation/wod_rubina:s_150", "info_favor"},
		{"@conversation/wod_rubina:s_191", "info_witches"},
		{"@conversation/wod_rubina:s_130", "info_sm"},
		{"@conversation/wod_rubina:s_134", "info_ns"},
		{"@conversation/wod_rubina:s_139", "info_spiderclan"},
		{"@conversation/wod_rubina:s_143", "info_magic"},
		{"@conversation/wod_rubina:s_148", "info_task"},
	}
}
wod_rubina:addScreen(info_reason)

info_witches = ConvoScreen:new {
	id = "info_witches",
	leftDialog = "@conversation/wod_rubina:s_192",
	stopConversation = "false",
	options = {
		{"@conversation/wod_rubina:s_150", "info_favor"},
		{"@conversation/wod_rubina:s_169", "info_reason"},
		{"@conversation/wod_rubina:s_130", "info_sm"},
		{"@conversation/wod_rubina:s_134", "info_ns"},
		{"@conversation/wod_rubina:s_139", "info_spiderclan"},
		{"@conversation/wod_rubina:s_143", "info_magic"},
		{"@conversation/wod_rubina:s_148", "info_task"},
	}
}
wod_rubina:addScreen(info_witches)

info_sm = ConvoScreen:new {
	id = "info_sm",
	leftDialog = "@conversation/wod_rubina:s_132",
	stopConversation = "false",
	options = {
		{"@conversation/wod_rubina:s_150", "info_favor"},
		{"@conversation/wod_rubina:s_169", "info_reason"},
		{"@conversation/wod_rubina:s_191", "info_witches"},
		{"@conversation/wod_rubina:s_134", "info_ns"},
		{"@conversation/wod_rubina:s_139", "info_spiderclan"},
		{"@conversation/wod_rubina:s_143", "info_magic"},
		{"@conversation/wod_rubina:s_148", "info_task"},
	}
}
wod_rubina:addScreen(info_sm)

info_ns = ConvoScreen:new {
	id = "info_ns",
	leftDialog = "@conversation/wod_rubina:s_137",
	stopConversation = "false",
	options = {
		{"@conversation/wod_rubina:s_150", "info_favor"},
		{"@conversation/wod_rubina:s_169", "info_reason"},
		{"@conversation/wod_rubina:s_191", "info_witches"},
		{"@conversation/wod_rubina:s_130", "info_sm"},
		{"@conversation/wod_rubina:s_139", "info_spiderclan"},
		{"@conversation/wod_rubina:s_143", "info_magic"},
		{"@conversation/wod_rubina:s_148", "info_task"},
	}
}
wod_rubina:addScreen(info_ns)

info_spiderclan = ConvoScreen:new {
	id = "info_spiderclan",
	leftDialog = "@conversation/wod_rubina:s_141",
	stopConversation = "false",
	options = {
		{"@conversation/wod_rubina:s_150", "info_favor"},
		{"@conversation/wod_rubina:s_169", "info_reason"},
		{"@conversation/wod_rubina:s_191", "info_witches"},
		{"@conversation/wod_rubina:s_130", "info_sm"},
		{"@conversation/wod_rubina:s_134", "info_ns"},
		{"@conversation/wod_rubina:s_143", "info_magic"},
		{"@conversation/wod_rubina:s_148", "info_task"},
	}
}
wod_rubina:addScreen(info_spiderclan)

info_magic = ConvoScreen:new {
	id = "info_magic",
	leftDialog = "@conversation/wod_rubina:s_145",
	stopConversation = "false",
	options = {
		{"@conversation/wod_rubina:s_150", "info_favor"},
		{"@conversation/wod_rubina:s_169", "info_reason"},
		{"@conversation/wod_rubina:s_191", "info_witches"},
		{"@conversation/wod_rubina:s_130", "info_sm"},
		{"@conversation/wod_rubina:s_134", "info_ns"},
		{"@conversation/wod_rubina:s_139", "info_spiderclan"},
		{"@conversation/wod_rubina:s_148", "info_task"},
	}
}
wod_rubina:addScreen(info_magic)

info_task = ConvoScreen:new {
	id = "info_task",
	leftDialog = "@conversation/wod_rubina:s_152",
	stopConversation = "false",
	options = {
		{"@conversation/wod_rubina:s_68", "task"},
		{"@conversation/wod_rubina:s_104", "information"},
		{"@conversation/wod_rubina:s_154", "favor"},
	}
}
wod_rubina:addScreen(info_task)

favor = ConvoScreen:new {
	id = "favor",
	leftDialog = "",
	stopConversation = "true",
	options = {
	}
}
wod_rubina:addScreen(favor)

ns_ready = ConvoScreen:new {
	id = "ns_ready",
	leftDialog = "@conversation/wod_rubina:s_58",
	stopConversation = "false",
	options = {
		{"@conversation/wod_rubina:s_58", "ns_ready_go"},
		{"@conversation/wod_rubina:s_120", "ns_ready_waypoint"},
		{"@conversation/wod_rubina:s_124", "second_init"},
	}
}
wod_rubina:addScreen(ns_ready)

ns_ready_go = ConvoScreen:new {
	id = "ns_ready_go",
	leftDialog = "@conversation/wod_rubina:s_100",
	stopConversation = "true",
	options = {
	}
}
wod_rubina:addScreen(ns_ready_go)

ns_ready_waypoint = ConvoScreen:new {
	id = "ns_ready_waypoint",
	leftDialog = "@conversation/wod_rubina:s_125",
	stopConversation = "true",
	options = {
	}
}
wod_rubina:addScreen(ns_ready_waypoint)

sm_ready = ConvoScreen:new {
	id = "sm_ready",
	leftDialog = "@conversation/wod_rubina:s_119",
	stopConversation = "false",
	options = {
		{"@conversation/wod_rubina:s_102", "sm_ready_go"},
		{"@conversation/wod_rubina:s_118", "sm_ready_waypoint"},
		{"@conversation/wod_rubina:s_121", "second_init"},
	}
}
wod_rubina:addScreen(sm_ready)

sm_ready_go = ConvoScreen:new {
	id = "sm_ready_go",
	leftDialog = "@conversation/wod_rubina:s_127",
	stopConversation = "true",
	options = {
	}
}
wod_rubina:addScreen(sm_ready_go)

sm_ready_waypoint = ConvoScreen:new {
	id = "sm_ready_waypoint",
	leftDialog = "@conversation/wod_rubina:s_122",
	stopConversation = "true",
	options = {
	}
}
wod_rubina:addScreen(sm_ready_waypoint)

return_wisdom_ns = ConvoScreen:new {
	id = "return_wisdom_ns",
	leftDialog = "@conversation/wod_rubina:s_27",
	stopConversation = "false",
	options = {
		{"@conversation/wod_rubina:s_29", "return_wisdom_complete_ns"},
	}
}
wod_rubina:addScreen(return_wisdom_ns)

return_wisdom_complete_ns = ConvoScreen:new {
	id = "return_wisdom_complete_ns",
	leftDialog = "@conversation/wod_rubina:s_207",
	stopConversation = "true",
	options = {
	}
}
wod_rubina:addScreen(return_wisdom_complete_ns)

return_wisdom_sm = ConvoScreen:new {
	id = "return_wisdom_sm",
	leftDialog = "@conversation/wod_rubina:s_31",
	stopConversation = "false",
	options = {
		{"@conversation/wod_rubina:s_33", "return_wisdom_complete_sm"},
	}
}
wod_rubina:addScreen(return_wisdom_sm)

return_wisdom_complete_sm = ConvoScreen:new {
	id = "return_wisdom_complete_sm",
	leftDialog = "@conversation/wod_rubina:s_207",
	stopConversation = "true",
	options = {
	}
}
wod_rubina:addScreen(return_wisdom_complete_sm)

return_eliminate_ns = ConvoScreen:new {
	id = "return_eliminate_ns",
	leftDialog = "@conversation/wod_rubina:s_35",
	stopConversation = "false",
	options = {
		{"@conversation/wod_rubina:s_37", "return_eliminate_complete_ns"},
	}
}
wod_rubina:addScreen(return_eliminate_ns)

return_eliminate_complete_ns = ConvoScreen:new {
	id = "return_eliminate_complete_ns",
	leftDialog = "@conversation/wod_rubina:s_208",
	stopConversation = "true",
	options = {
	}
}
wod_rubina:addScreen(return_eliminate_complete_ns)

return_eliminate_sm = ConvoScreen:new {
	id = "return_eliminate_sm",
	leftDialog = "@conversation/wod_rubina:s_39",
	stopConversation = "false",
	options = {
		{"@conversation/wod_rubina:s_41", "return_eliminate_complete_sm"},
	}
}
wod_rubina:addScreen(return_eliminate_sm)

return_eliminate_complete_sm = ConvoScreen:new {
	id = "return_eliminate_complete_sm",
	leftDialog = "@conversation/wod_rubina:s_208",
	stopConversation = "true",
	options = {
	}
}
wod_rubina:addScreen(return_eliminate_complete_sm)

return_herbs_ns = ConvoScreen:new {
	id = "return_herbs_ns",
	leftDialog = "@conversation/wod_rubina:s_43",
	stopConversation = "false",
	options = {
		{"@conversation/wod_rubina:s_45", "return_herbs_complete_ns"},
	}
}
wod_rubina:addScreen(return_herbs_ns)

return_herbs_complete_ns = ConvoScreen:new {
	id = "return_herbs_complete_ns",
	leftDialog = "@conversation/wod_rubina:s_206",
	stopConversation = "true",
	options = {
	}
}
wod_rubina:addScreen(return_herbs_complete_ns)

return_herbs_sm = ConvoScreen:new {
	id = "return_herbs_sm",
	leftDialog = "@conversation/wod_rubina:s_47",
	stopConversation = "false",
	options = {
		{"@conversation/wod_rubina:s_49", "return_herbs_complete_sm"},
	}
}
wod_rubina:addScreen(return_herbs_sm)

return_herbs_complete_sm = ConvoScreen:new {
	id = "return_herbs_complete_sm",
	leftDialog = "@conversation/wod_rubina:s_206",
	stopConversation = "true",
	options = {
	}
}
wod_rubina:addScreen(return_herbs_complete_sm)

cache_init = ConvoScreen:new {
	id = "cache_init",
	leftDialog = "@conversation/wod_rubina:s_159",
	stopConversation = "false",
	options = {
		{"@conversation/wod_rubina:s_160", "cache_first_screen"},
	}
}
wod_rubina:addScreen(cache_init)

cache_first_screen = ConvoScreen:new {
	id = "cache_first_screen",
	leftDialog = "@conversation/wod_rubina:s_161",
	stopConversation = "false",
	options = {
		{"@conversation/wod_rubina:s_174", "cache_second_screen"},
	}
}
wod_rubina:addScreen(cache_first_screen)

cache_second_screen = ConvoScreen:new {
	id = "cache_second_screen",
	leftDialog = "@conversation/wod_rubina:s_171",
	stopConversation = "false",
	options = {
		{"@conversation/wod_rubina:s_172", "left_behind_start"},
	}
}
wod_rubina:addScreen(cache_second_screen)

left_behind_start = ConvoScreen:new {
	id = "left_behind_start",
	leftDialog = "@conversation/wod_rubina:s_173",
	stopConversation = "true",
	options = {
	}
}
wod_rubina:addScreen(left_behind_start)

left_behind_return = ConvoScreen:new {
	id = "left_behind_return",
	leftDialog = "@conversation/wod_rubina:s_184",
	stopConversation = "false",
	options = {
		{"@conversation/wod_rubina:s_186", "left_behind_first_screen"},
	}
}
wod_rubina:addScreen(left_behind_return)

left_behind_first_screen = ConvoScreen:new {
	id = "left_behind_first_screen",
	leftDialog = "@conversation/wod_rubina:s_189",
	stopConversation = "false",
	options = {
		{"@conversation/wod_rubina:s_190", "left_behind_second_screen"},
	}
}
wod_rubina:addScreen(left_behind_first_screen)

left_behind_second_screen = ConvoScreen:new {
	id = "left_behind_second_screen",
	leftDialog = "@conversation/wod_rubina:s_193",
	stopConversation = "false",
	options = {
		{"@conversation/wod_rubina:s_194", "left_behind_complete_quest"},
	}
}
wod_rubina:addScreen(left_behind_second_screen)

left_behind_complete_quest = ConvoScreen:new {
	id = "left_behind_complete_quest",
	leftDialog = "@conversation/wod_rubina:s_195",
	stopConversation = "true",
	options = {
	}
}
wod_rubina:addScreen(left_behind_complete_quest)

quest_in_progress = ConvoScreen:new {
	id = "quest_in_progress",
	leftDialog = "@conversation/wod_rubina:s_147",
	stopConversation = "true",
	options = {
	}
}
wod_rubina:addScreen(quest_in_progress)

not_elligible = ConvoScreen:new {
	id = "not_elligible",
	leftDialog = "@conversation/wod_rubina:s_8",
	stopConversation = "true",
	options = {
	}
}
wod_rubina:addScreen(not_elligible)

addConversationTemplate("wod_rubina", wod_rubina);
