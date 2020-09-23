drakka_judarrl = Creature:new {
	objectName = "",
	customName = "Drakka Judarrl",
	socialGroup = "imperial",
	faction = "imperial",
	level = 100,
	chanceHit = 1,
	damageMin = 1645,
	damageMax = 2600,
	baseXp = 9429,
	baseHAM = 264000,
	baseHAMmax = 294000,
	armor = 1,
	resists = {45,45,45,45,45,45,45,45,45},
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
	creatureBitmask = PACK,
	optionsBitmask = AIENABLED + CONVERSABLE,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_drakka_judarrl.iff"},
	lootGroups = {},
	weapons = {"light_jedi_weapons_basic"},
	conversationTemplate = "drakka_judarrl_mission_giver_convotemplate",
	attacks = merge(lightsabermaster)
}

CreatureTemplates:addCreatureTemplate(drakka_judarrl, "drakka_judarrl")
