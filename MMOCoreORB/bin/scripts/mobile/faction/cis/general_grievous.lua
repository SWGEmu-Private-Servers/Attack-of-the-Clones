general_grievous = Creature:new {
	objectName = "@mob/creature_names:cis_magnaguard",
	customName = "General Grievous",
	socialGroup = "self",
	faction = "rebel",
	level = 300,
	chanceHit = 30,
	damageMin = 3450,
	damageMax = 5000,
	baseXp = 450,
	baseHAM = 3352000,
	baseHAMmax = 3352000,
	armor = 2,
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
	pvpBitmask = ATTACKABLE,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED + FACTIONAGGRO,
	diet = HERBIVORE,

	templates = {
		"object/mobile/ep3/general_grievous.iff"
	},
	lootGroups = {},
	weapons = {"magnaguard_weapons"},
	conversationTemplate = "",
	attacks = merge(lightsabermaster,pikemanmaster)
}

CreatureTemplates:addCreatureTemplate(general_grievous, "general_grievous")
