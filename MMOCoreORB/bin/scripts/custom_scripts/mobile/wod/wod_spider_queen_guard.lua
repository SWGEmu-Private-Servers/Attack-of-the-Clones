wod_spider_queen_guard = Creature:new {
	objectName = "@mob/creature_names:wod_spider_queen_guard",
	socialGroup = "spider_nightsister",
	faction = "spider_nightsister",
	level = 107,
	chanceHit = 3.0,
	damageMin = 270,
	damageMax = 450,
	baseXp = 8549,
	baseHAM = 21000,
	baseHAMmax = 25100,
	armor = 1,
	resists = {45,45,45,45,45,45,45,45,45},
	meatType = "meat_insect",
	meatAmount = 100,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 30,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER + STALKER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,
	scale = 2,

	templates = {"object/mobile/spider_queen_guard.iff"},
	hues = {},
	lootGroups = {
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"creatureareacombo","stateAccuracyBonus=100"},
		{"creatureareaknockdown","stateAccuracyBonus=100"}
	}
}

CreatureTemplates:addCreatureTemplate(wod_spider_queen_guard, "wod_spider_queen_guard")
