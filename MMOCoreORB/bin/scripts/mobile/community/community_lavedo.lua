community_lavedo = Creature:new {
	objectName = "",
	customName = "Lavedoodoo",
	socialGroup = "dark_jedi", -- Of course 
	faction = "",
	level = 300,
	chanceHit = 30.39,
	damageMin = 2500,
	damageMax = 3000,
	baseXp = 38024,
	baseHAM = 1050000,
	baseHAMmax = 1500000,
	armor = 3,
	resists = {175,175,100,175,175,55,55,50,50},
	meatType = "meat_insect",
	meatAmount = 3500,
	hideType = "hide_scaley",
	hideAmount = 7500,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 6,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + HERD + KILLER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/salacious_crumb.iff"},
	hues = { 16, 17, 18, 19, 20, 21, 22, 23 },
	scale = 3,
	lootGroups = {},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"strongpoison",""},
		{"creatureareableeding",""}
		--careful adding attacks, salacious_crumb doesn't have proper animations from the look of it.
	}
}

CreatureTemplates:addCreatureTemplate(community_lavedo, "community_lavedo")
