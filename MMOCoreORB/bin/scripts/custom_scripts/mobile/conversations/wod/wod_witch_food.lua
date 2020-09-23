function createWODWitchFoodConvoTemplate(templateName)
	wod_witch_food = ConvoTemplate:new {
		initialScreen = "initial",
		templateType = "Lua",
		luaClassHandler = "wod_witch_food_convo_handler",
		screens = {},
	}

	witchFoodType = ConvoScreen:new {
		id = "witchFoodType",
		leftDialog = "witchFoodType", -- Storage for the faction, so it can be pulled in the convo handler.
		stopConversation = "false",
		options = {
			{"witchFoodType" , templateName}
		}
	}
	wod_witch_food:addScreen(witchFoodType);

	initial = ConvoScreen:new {
		id = "initial",
		leftDialog = "@conversation/" .. templateName .. ":s_14",
		stopConversation = "false",
		options = {
			{"@conversation/" .. templateName .. ":s_16", "bolma_start"},
			{"@conversation/" .. templateName .. ":s_21", "fish_start"},
			{"@conversation/" .. templateName .. ":s_2", "decline"},
		}
	}
	wod_witch_food:addScreen(initial)

	bolma_start = ConvoScreen:new {
		id = "bolma_start",
		leftDialog = "@conversation/" .. templateName .. ":s_18",
		stopConversation = "true",
		options = {
		}
	}
	wod_witch_food:addScreen(bolma_start)

	bolma_in_progress = ConvoScreen:new {
		id = "bolma_in_progress",
		leftDialog = "@conversation/" .. templateName .. ":s_23",
		stopConversation = "true",
		options = {
		}
	}
	wod_witch_food:addScreen(bolma_in_progress)

	fish_start = ConvoScreen:new {
		id = "fish_start",
		leftDialog = "@conversation/" .. templateName .. ":s_24",
		stopConversation = "true",
		options = {
		}
	}
	wod_witch_food:addScreen(fish_start)

	fish_in_progress = ConvoScreen:new {
		id = "fish_in_progress",
		leftDialog = "@conversation/" .. templateName .. ":s_26",
		stopConversation = "true",
		options = {
		}
	}
	wod_witch_food:addScreen(fish_in_progress)

	decline = ConvoScreen:new {
		id = "decline",
		leftDialog = "@conversation/" .. templateName .. ":s_28",
		stopConversation = "true",
		options = {
		}
	}
	wod_witch_food:addScreen(decline)

	return_food = ConvoScreen:new {
		id = "return_food",
		leftDialog = "@conversation/" .. templateName .. ":s_8",
		stopConversation = "false",
		options = {
			{"@conversation/" .. templateName .. ":s_12", "initial"},
		}
	}
	wod_witch_food:addScreen(return_food)

	wrong_alignment = ConvoScreen:new {
		id = "wrong_alignment",
		leftDialog = "@conversation/" .. templateName .. ":s_4",
		stopConversation = "true",
		options = {
		}
	}
	wod_witch_food:addScreen(wrong_alignment)

	not_elligible = ConvoScreen:new {
		id = "not_elligible",
		leftDialog = "@conversation/" .. templateName .. ":s_6",
		stopConversation = "true",
		options = {
		}
	}
	wod_witch_food:addScreen(not_elligible)

	other_faction_in_progress = ConvoScreen:new {
		id = "other_faction_in_progress",
		leftDialog = "@conversation/" .. templateName .. ":s_11",
		stopConversation = "true",
		options = {
		}
	}
	wod_witch_food:addScreen(other_faction_in_progress)

	addConversationTemplate(templateName, wod_witch_food);
end

createWODWitchFoodConvoTemplate("wod_ns_witch_food")
createWODWitchFoodConvoTemplate("wod_sm_witch_food")
