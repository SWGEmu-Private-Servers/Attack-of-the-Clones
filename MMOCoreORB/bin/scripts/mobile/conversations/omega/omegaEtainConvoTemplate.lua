omegaEtainConvoTemplate = ConvoTemplate:new {
	initialScreen = "",
	templateType = "Lua",
	luaClassHandler = "omegaEtainConvoHandler",
	screens = {}
}

init = ConvoScreen:new {
	id = "init",
	customDialogText = "You there, did the council send you to help rescue one of our Clone Arc Troopers?",
	stopConversation = "false",
	options = {
		{"Yes, Master. What's going on?", "information_one"},
		{"No, Yoda has sent me on another mission.", "decline"},
	}
}
omegaEtainConvoTemplate:addScreen(init);

information_one = ConvoScreen:new {
	id = "information_one",
	customDialogText = "The Separatists attacked our forward outpost, we received a distress beacon from Clone Arc Trooper who survived. We must save him.",
	stopConversation = "false",
	options = {
		{"I will not fail Master.", "information_two"},
		{"We better wait for backup, this is too risky.", "decline"},
	}
}
omegaEtainConvoTemplate:addScreen(information_one);

information_two = ConvoScreen:new {
	id = "information_two",
	customDialogText = "*I have created you a rescue plan for you. Go to these coordinates.",
	stopConversation = "false",
	options = {
		{"Excellent, I will leave right away.", "start_quest"},
		{"Do you have any additional information to help me?", "information_three"},
		{"I cannot help Master.", "decline"},
	}
}
omegaEtainConvoTemplate:addScreen(information_two);

information_three = ConvoScreen:new {
	id = "information_three",
	customDialogText = "The last communication indicated droids were closing in on his position, we cannot delay.",
	stopConversation = "false",
	options = {
		{"I'll help you Master.", "start_quest"},
		{"This doesn't seem like my problem.", "decline"},
	}
}
omegaEtainConvoTemplate:addScreen(information_three);

start_quest = ConvoScreen:new {
	id = "start_quest",
	customDialogText = "Excellent, the council is counting on you!",
	stopConversation = "true",
	options = {
	}
}
omegaEtainConvoTemplate:addScreen(start_quest);

return_quest = ConvoScreen:new {
	id = "return_quest",
	customDialogText = "You have a great teacher, you handled yourself well, I was just briefed on your rescue operation.",
	stopConversation = "false",
	options = {
		{"Thank you Master Skywalker.", "complete_quest"},
	}
}
omegaEtainConvoTemplate:addScreen(return_quest);

quest_in_progress = ConvoScreen:new {
	id = "quest_in_progress",
	customDialogText = "The council requests an update, what are you waiting on!",
	stopConversation = "true",
	options = {
	}
}
omegaEtainConvoTemplate:addScreen(quest_in_progress);

quest_completed = ConvoScreen:new {
	id = "quest_completed",
	customDialogText = "Thank you for all your help!",
	stopConversation = "true",
	options = {
	}
}
omegaEtainConvoTemplate:addScreen(quest_completed);

complete_quest = ConvoScreen:new {
	id = "complete_quest",
	customDialogText = "I thank you for your help, as thanks I will give you something that will aid you in the fight.",
	stopConversation = "true",
	options = {
	}
}
omegaEtainConvoTemplate:addScreen(complete_quest);

decline = ConvoScreen:new {
	id = "decline",
	customDialogText = "The council needs you!",
	stopConversation = "true",
	options = {
	}
}
omegaEtainConvoTemplate:addScreen(decline);

addConversationTemplate("omegaEtainConvoTemplate", omegaEtainConvoTemplate);
