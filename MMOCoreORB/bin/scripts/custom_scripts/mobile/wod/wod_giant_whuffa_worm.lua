wod_giant_whuffa_worm = Creature:new {
	objectName = "@mob/creature_names:giant_whuffa_worm",
	socialGroup = "kwi",
	faction = "",
	level = 141,
	chanceHit = 6.25,
	damageMin = 945,
	damageMax = 1600,
	baseXp = 13367,
	baseHAM = 62000,
	baseHAMmax = 75000,
	armor = 2,
	resists = {20,20,20,20,20,20,20,20,20},
	meatType = "meat_carnivore",
	meatAmount = 70,
	hideType = "hide_scaley",
	hideAmount = 40,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER + STALKER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/whuffa_worm.iff"},
	hues = {},
	scale = 2,
	lootGroups = {},
	weapons = {"creature_spit_small_yellow"},
	conversationTemplate = "",
	attacks = {
		{"creatureareacombo","stateAccuracyBonus=50"},
		{"creatureareaknockdown","stateAccuracyBonus=50"}
	}
}

CreatureTemplates:addCreatureTemplate(wod_giant_whuffa_worm, "wod_giant_whuffa_worm")
