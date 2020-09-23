wod_spiderclan_matron = Creature:new {
	objectName = "@mob/creature_names:spiderclan_matron",
	socialGroup = "",
	faction = "",
	level = 100,
	chanceHit = 0.39,
	damageMin = 290,
	damageMax = 300,
	baseXp = 2914,
	baseHAM = 8400,
	baseHAMmax = 10200,
	armor = 0,
	resists = {-1,-1,-1,-1,-1,-1,-1,-1,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = 0,
	pvpBitmask = NONE,
	creatureBitmask = NONE,
	optionsBitmask = AIENABLED + INVULNERABLE + CONVERSABLE,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_dathomir_spider_nightsister_mother.iff"},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "wod_queen_mother",
	attacks = {
	}
}

CreatureTemplates:addCreatureTemplate(wod_spiderclan_matron, "wod_spiderclan_matron")
