theme_palpatine = Creature:new {
	objectName = "@mob/creature_names:theme_chancellor_palpatine",
	socialGroup = "imperial",
	faction = "imperial",
	level = 300,
	chanceHit = 1,
	damageMin = 6450,
	damageMax = 7001,
	baseXp = 9429,
	baseHAM = 240000,
	baseHAMmax = 300000,
	armor = 0,
	resists = {95,95,95,95,95,95,95,95,95},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = NONE,
	creatureBitmask = PACK,
	optionsBitmask = INVULNERABLE + CONVERSABLE,
	diet = HERBIVORE,

	templates = {"object/mobile/palpatine.iff"},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "theme_park_imperial_mission_giver_convotemplate",
	attacks = {
	}
}

CreatureTemplates:addCreatureTemplate(theme_palpatine, "theme_palpatine")
