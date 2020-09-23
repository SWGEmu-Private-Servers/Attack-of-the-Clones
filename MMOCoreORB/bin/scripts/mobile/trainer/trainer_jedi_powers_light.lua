trainer_jedi_powers_light = Creature:new {
	objectName = "@mob/creature_names:trainer_jedi_powers_light",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "imperial",
	faction = "imperial",
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
	pvpBitmask = NONE,
	creatureBitmask = NONE,
	optionsBitmask = INVULNERABLE + CONVERSABLE,
	diet = HERBIVORE,

	templates = {
		"object/mobile/dressed_jedi_knight_02.iff", --dathomirian
	},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "jediPowersLightTrainerConvoTemplate",
	attacks = {}
}

CreatureTemplates:addCreatureTemplate(trainer_jedi_powers_light, "trainer_jedi_powers_light")
