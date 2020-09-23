wod_mutant_rancor = Creature:new {
	objectName = "@mob/creature_names:wod_mutant_rancor",
	socialGroup = "mutant_rancor",
	faction = "",
	level = 120,
	chanceHit = 4.0,
	damageMin = 770,
	damageMax = 1250,
	baseXp = 28549,
	baseHAM = 41000,
	baseHAMmax = 50100,
	armor = 1,
	resists = {145,145,145,145,145,145,145,145,125},
	meatType = "meat_carnivore",
	meatAmount = 500,
	hideType = "hide_bristley",
	hideAmount = 450,
	boneType = "bone_mammal",
	boneAmount = 405,
	milk = 0,
	tamingChance = 0,
	ferocity = 30,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = KILLER + STALKER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/mutant_rancor_static.iff"},
	hues = {},
	lootGroups = {
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"creatureareacombo","stateAccuracyBonus=50"},
		{"creatureareaknockdown","stateAccuracyBonus=50"}
	}
}

CreatureTemplates:addCreatureTemplate(wod_mutant_rancor, "wod_mutant_rancor")
