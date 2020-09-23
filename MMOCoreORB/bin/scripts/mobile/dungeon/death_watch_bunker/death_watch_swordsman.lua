death_watch_swordsman = Creature:new {
	objectName = "@mob/creature_names:death_watch_swordsman",
	randomNameType = NAME_GENERIC,
		randomNameTag = true,
	socialGroup = "death_watch",
	faction = "",
	level = 229,
	chanceHit = 9.5,
	damageMin = 2050,
	damageMax = 2750,
	baseXp = 15314,
	baseHAM = 35000,
	baseHAMmax = 55000,
	armor = 2,
	resists = {75,75,70,70,55,75,75,50,-1},
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

	templates = {"object/mobile/dressed_death_watch_silver.iff"},
	lootGroups = {
		{
			groups = {
				{group = "death_watch_bunker_commoners",   chance = 5500000},
				{group = "death_watch_bunker_lieutenants", chance = 2500000},
				{group = "clothing_attachments", chance = 500000},
				{group = "armor_attachments", chance = 500000},
				{group = "bounty_hunter_armor", chance = 1000000},

			},
			lootChance = 5500000
		}
	},
	weapons = {"twohand_weapons"},
	conversationTemplate = "",
	attacks = merge(elite2hmaster)
}

CreatureTemplates:addCreatureTemplate(death_watch_swordsman, "death_watch_swordsman")
