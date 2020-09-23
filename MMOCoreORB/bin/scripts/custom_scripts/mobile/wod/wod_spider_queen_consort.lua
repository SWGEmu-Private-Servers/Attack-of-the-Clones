wod_spider_queen_consort = Creature:new {
	objectName = "@mob/creature_names:wod_spider_queen_consort",
	socialGroup = "spider_nightsister",
	faction = "spider_nightsister",
	level = 105,
	chanceHit = 10.0,
	damageMin = 1270,
	damageMax = 5250,
	baseXp = 28549,
	baseHAM = 40000,
	baseHAMmax = 51000,
	armor = 1,
	resists = {165,165,165,165,165,165,165,165,150},
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
	scale = 3,

	templates = {"object/mobile/spider_queen_consort.iff"},
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

CreatureTemplates:addCreatureTemplate(wod_spider_queen_consort, "wod_spider_queen_consort")
