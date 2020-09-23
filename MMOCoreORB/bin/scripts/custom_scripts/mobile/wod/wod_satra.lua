wod_satra = Creature:new {
	objectName = "@mob/creature_names:satra",
	socialGroup = "nightsister",
	faction = "nightsister",
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

	templates = {"object/mobile/dressed_dathomir_nightsister_herbalist.iff"},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "wod_ns_witch_herbs",
	attacks = {
	}
}

CreatureTemplates:addCreatureTemplate(wod_satra, "wod_satra")
