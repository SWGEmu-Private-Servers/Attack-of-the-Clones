wod_kwi = Creature:new {
	objectName = "@mob/creature_names:wod_kwi",
	socialGroup = "kwi",
	faction = "",
	level = 101,
	chanceHit = 3.25,
	damageMin = 945,
	damageMax = 1200,
	baseXp = 8367,
	baseHAM = 32000,
	baseHAMmax = 45000,
	armor = 1,
	resists = {20,20,20,20,20,20,20,20,20},
	meatType = "meat_carnivore",
	meatAmount = 500,
	hideType = "hide_leathery",
	hideAmount = 400,
	boneType = "bone_avian",
	boneAmount = 350,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER + STALKER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/wod_kwi.iff"},
	hues = {},
	scale = 1,
	lootGroups = {},
	weapons = {"creature_spit_small_yellow"},
	conversationTemplate = "",
	attacks = {
		{"stunattack",""},
		{"blindattack",""}
	}
}

CreatureTemplates:addCreatureTemplate(wod_kwi, "wod_kwi")
