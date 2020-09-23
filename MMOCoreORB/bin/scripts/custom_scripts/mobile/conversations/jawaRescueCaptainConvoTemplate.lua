jawaRescueCaptainConvoTemplate = ConvoTemplate:new {
	initialScreen = "",
	templateType = "Lua",
	luaClassHandler = "jawaRescueCaptainConvoHandler",
	screens = {}
}

quest = ConvoScreen:new {
	id = "quest",
	customDialogText = "Please tell me you're here to rescue me!", 
	stopConversation = "false",
	options = {
		{"It's safe to leave, your companion is waiting in Mos Espa!", "complete_quest"},
		{"How did you get captured?", "information_one"},
		{"It's not safe to leave yet.", "decline"},
	}
}
jawaRescueCaptainConvoTemplate:addScreen(quest);

information_one = ConvoScreen:new {
	id = "information_one",
	customDialogText = "These Tuskens appeared out of nowhere and completely surprised us. It's the first time I've seen Tuskens be this smart.", 
	stopConversation = "false",
	options = {
		{"It's safe to leave, your companion is waiting in Mos Espa!", "complete_quest"},
		{"What happened here? You seem to be the only Jawa survivor.", "information_two"},
		{"It's not safe to leave yet.", "decline"},
	}
}
jawaRescueCaptainConvoTemplate:addScreen(information_one);

information_two = ConvoScreen:new {
	id = "information_two",
	customDialogText = "They forced all of us to work, to restore this bunker. They didn't feed or drink us, I managed to survive because I'm the only one who was allowed to work inside.", 
	stopConversation = "false",
	options = {
		{"It's safe to leave, your companion is waiting in Mos Espa!", "complete_quest"},
		{"It's not safe to leave yet.", "decline"},
	}
}
jawaRescueCaptainConvoTemplate:addScreen(information_two);

complete_quest = ConvoScreen:new {
	id = "complete_quest",
	customDialogText = "Thank you, I'll return at once to let him know I'm safe.", 
	stopConversation = "true",
	options = {
	}
}
jawaRescueCaptainConvoTemplate:addScreen(complete_quest);

decline = ConvoScreen:new {
	id = "decline",
	customDialogText = "I'll wait here until it's safe.", 
	stopConversation = "true",
	options = {
	}
}
jawaRescueCaptainConvoTemplate:addScreen(decline);

reject = ConvoScreen:new {
	id = "reject",
	customDialogText = "*He looks at you quizzically*", 
	stopConversation = "true",
	options = {
	}
}
jawaRescueCaptainConvoTemplate:addScreen(reject);

addConversationTemplate("jawaRescueCaptainConvoTemplate", jawaRescueCaptainConvoTemplate);
