jawaRescueGiverConvoTemplate = ConvoTemplate:new {
	initialScreen = "",
	templateType = "Lua",
	luaClassHandler = "jawaRescueGiverConvoHandler",
	screens = {}
}

init = ConvoScreen:new {
	id = "init",
	customDialogText = "Ahhh! They took them, they took all of them!", 
	stopConversation = "false",
	options = {
		{"Woah woah, calm down. What's going on?", "information_one"},
		{"This doesn't seem like my problem.", "decline"},
	}
}
jawaRescueGiverConvoTemplate:addScreen(init);

information_one = ConvoScreen:new {
	id = "information_one",
	customDialogText = "The Tuskens, they kidnapped my entire crew and captain! What am I going to do?", 
	stopConversation = "false",
	options = {
		{"Take a deep breath and tell me where they took them.", "information_two"},
		{"This doesn't seem like my problem.", "decline"},
	}
}
jawaRescueGiverConvoTemplate:addScreen(information_one);

information_two = ConvoScreen:new {
	id = "information_two",
	customDialogText = "*Deep breath* I followed to an old bunker, I was hoping I could come up with a plan to rescue them, but there were too many Tuskens.", 
	stopConversation = "false",
	options = {
		{"Don't worry, I'll help you.", "start_quest"},
		{"Did you see how many Tuskens there were?", "information_three"},
		{"This doesn't seem like my problem.", "decline"},
	}
}
jawaRescueGiverConvoTemplate:addScreen(information_two);

information_three = ConvoScreen:new {
	id = "information_three",
	customDialogText = "I don't know, but there were a lot! When I arrived they were working my friends hard, it looks like they were building a turret for them.", 
	stopConversation = "false",
	options = {
		{"Don't worry, I'll help you.", "start_quest"},
		{"This doesn't seem like my problem.", "decline"},
	}
}
jawaRescueGiverConvoTemplate:addScreen(information_three);

start_quest = ConvoScreen:new {
	id = "start_quest",
	customDialogText = "You will? Thank the dune seas!", 
	stopConversation = "true",
	options = {
	}
}
jawaRescueGiverConvoTemplate:addScreen(start_quest);

return_quest = ConvoScreen:new {
	id = "return_quest",
	customDialogText = "The captain arrived here not too long ago and told me everything those blasted Tuskens did.", 
	stopConversation = "false",
	options = {
		{"I'm sorry I could only rescue your captain.", "complete_quest"},
	}
}
jawaRescueGiverConvoTemplate:addScreen(return_quest);

quest_in_progress = ConvoScreen:new {
	id = "quest_in_progress",
	customDialogText = "Please hurry up and help my crew!", 
	stopConversation = "true",
	options = {
	}
}
jawaRescueGiverConvoTemplate:addScreen(quest_in_progress);

quest_completed = ConvoScreen:new {
	id = "quest_completed",
	customDialogText = "Thank you for all your help!", 
	stopConversation = "true",
	options = {
	}
}
jawaRescueGiverConvoTemplate:addScreen(quest_completed);

complete_quest = ConvoScreen:new {
	id = "complete_quest",
	customDialogText = "I thank you for your help, as thanks I will give you a blueprint for a sandcrawler.", 
	stopConversation = "true",
	options = {
	}
}
jawaRescueGiverConvoTemplate:addScreen(complete_quest);

decline = ConvoScreen:new {
	id = "decline",
	customDialogText = "Ahhhh! I can't help them alone, please!", 
	stopConversation = "true",
	options = {
	}
}
jawaRescueGiverConvoTemplate:addScreen(decline);

addConversationTemplate("jawaRescueGiverConvoTemplate", jawaRescueGiverConvoTemplate);
