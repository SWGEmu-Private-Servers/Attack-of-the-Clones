elite_nightbrother_weapons_master = Creature:new {
	objectName = "@mob/creature_names:elite_nightbrother_weapons_master",
	randomNameType = NAME_GENERIC,
		randomNameTag = true,
	socialGroup = "shadow_collective",
	faction = "",
	level = 229,
	chanceHit = 9.5,
	damageMin = 2050,
	damageMax = 2750,
	baseXp = 15314,
	baseHAM = 215000,
	baseHAMmax = 255000,
	armor = 3,
	resists = {75,75,70,70,55,75,75,50,25},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = KILLER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,
	scale = 1.10,
	hues = {19, 20, 21, 22, 23, 24, 25, 26},

	templates = {"object/mobile/dressed_aakuan_champion_zabrak_male_01.iff"},

	lootGroups = {
		{
			groups = {
				{group = "clothing_attachments", chance = 5000000},
				{group = "armor_attachments", chance = 5000000},
				--{group = "bounty_hunter_armor", chance = 1000000},
			},
			lootChance = 1000000
		}
	},
	weapons = {"twohand_weapons"},
	conversationTemplate = "",
	attacks = merge(elite2hmaster)
}

CreatureTemplates:addCreatureTemplate(elite_nightbrother_weapons_master, "elite_nightbrother_weapons_master")
