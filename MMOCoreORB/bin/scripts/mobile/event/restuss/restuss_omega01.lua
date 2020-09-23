restuss_omega01 = Creature:new {
	objectName = "@mob/creature_names:clonetrooper_commando",
	randomNameType = NAME_DARKTROOPER,
	randomNameTag = true,
	socialGroup = "imperial",
	faction = "imperial",
	level = 100,
	chanceHit = 1,
	damageMin = 645,
	damageMax = 1000,
	baseXp = 9429,
	baseHAM = 24000,
	baseHAMmax = 30000,
	armor = 0,
	resists = {0,0,0,0,0,0,0,0,-1},
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
	optionsBitmask = INVULNERABLE,
	optionsBitmask = INVULNERABLE + CONVERSABLE,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_clone_commando_m.iff"},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "restuss01ConvoTemplate",
	attacks = {
	}
}

CreatureTemplates:addCreatureTemplate(restuss_omega01, "restuss_omega01")