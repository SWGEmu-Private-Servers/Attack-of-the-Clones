wod_spider_queen = Creature:new {
	objectName = "@mob/creature_names:wod_spider_queen",
	socialGroup = "spider_nightsister",
	faction = "spider_nightsister",
	level = 336,
	chanceHit = 30.0,
	damageMin = 2270,
	damageMax = 3250,
	baseXp = 28549,
	baseHAM = 210000,
	baseHAMmax = 251000,
	armor = 2,
	resists = {195,195,195,195,165,195,195,195,175},
	meatType = "meat_insect",
	meatAmount = 500,
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
	scale = 6,

	templates = {"object/mobile/spiderclan_queen_mother.iff"},
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

CreatureTemplates:addCreatureTemplate(wod_spider_queen, "wod_spider_queen")
