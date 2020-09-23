omega01ConvoTemplate = ConvoTemplate:new {
	initialScreen = "",
	templateType = "Lua",
	luaClassHandler = "omega01ConvoHandler",
	screens = {}
}

quest = ConvoScreen:new {
	id = "quest",
	customDialogText = "Am I glad to see you, did you have any trouble finding me?",
	stopConversation = "false",
	options = {
		{"Let's go before more clankers show up!", "complete_quest"},
		{"How did you survive?", "information_one"},
		{"It's not safe yet, wait here.", "decline"},
	}
}
omega01ConvoTemplate:addScreen(quest);

information_one = ConvoScreen:new {
	id = "information_one",
	customDialogText = "I set of diversions which enabled me to survive.",
	stopConversation = "false",
	options = {
		{"Genius! It's safe to leave, lets go!", "complete_quest"},
		{"What happened to the rest of your squad?", "information_two"},
		{"It's not safe yet, wait here.", "decline"},
	}
}
omega01ConvoTemplate:addScreen(information_one);

information_two = ConvoScreen:new {
	id = "information_two",
	customDialogText = "We were ambushed. I think we were set up. The rest of my squad didn't make it.",
	stopConversation = "false",
	options = {
		{"Well let's not waste anymore time, let's go!", "complete_quest"},
		{"It's not safe yet, wait here.", "decline"},
	}
}
omega01ConvoTemplate:addScreen(information_two);

complete_quest = ConvoScreen:new {
	id = "complete_quest",
	customDialogText = "Thank you, I am sure the command will be interested in my report.",
	stopConversation = "true",
	options = {
	}
}
omega01ConvoTemplate:addScreen(complete_quest);

decline = ConvoScreen:new {
	id = "decline",
	customDialogText = "I'll wait here until it's clear.",
	stopConversation = "true",
	options = {
	}
}
omega01ConvoTemplate:addScreen(decline);

reject = ConvoScreen:new {
	id = "reject",
	customDialogText = "Really, it is not safe to be here.",
	stopConversation = "true",
	options = {
	}
}
omega01ConvoTemplate:addScreen(quest_reject);

quest_completed = ConvoScreen:new {
	id = "quest_completed",
	customDialogText = "Take Cover!",
	stopConversation = "true",
	options = {
	}
}
omega01ConvoTemplate:addScreen(quest_completed);

addConversationTemplate("omega01ConvoTemplate", omega01ConvoTemplate);
