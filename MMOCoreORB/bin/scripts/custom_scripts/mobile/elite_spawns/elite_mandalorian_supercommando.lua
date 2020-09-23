elite_mandalorian_supercommando = Creature:new {
	customName = "a Mandalorian Supercommando",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "death_watch",
	faction = "",
	level = 300,
	chanceHit = 27.25,
	damageMin = 2000,
	damageMax = 4310,
	baseXp = 27849,
	baseHAM = 1799999,
	baseHAMmax = 2242000,
	armor = 3,
	resists = {80,80,190,80,45,45,190,70,140},
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
	scale = 1.2,

	templates = {"object/mobile/dressed_death_watch_gold.iff"},
	lootGroups = {
		{
			groups = {
				{group = "armor_attachments", chance = 5000000},
				{group = "clothing_attachments", chance = 5000000},
				--Need to add Schematics
				--Need to adjust loot groups for our elite and/or world bosses across the board.
				},
				lootChance = 10000000
		},
		{
			groups = {
					{group = "death_watch_bunker_lieutenants", chance = 10000000},
				},
				lootChance = 10000000
		},
		{
			groups = {
					{group = "death_watch_bunker_pack", chance = 10000000},
				},
				lootChance = 10000000
		},
			{
				groups = {
						{group = "death_watch_bunker_overlord_shared", chance = 5000000},
						{group = "jetpack_base", chance = 5000000},
					},
					lootChance = 9000000
			},
				{
					groups = {
							{group = "death_watch_bunker_commoners", chance = 10000000},
						},
						lootChance = 9000000
				},
			{
				groups = {
						{group = "death_watch_bunker_ingredient_protective", chance = 5000000},
						{group = "death_watch_bunker_ingredient_binary", chance = 5000000},
					},
					lootChance = 1000000
			},
	},
	weapons = {"dark_trooper_weapons"},
	conversationTemplate = "",
	attacks = merge(riflemanmaster,fencermaster,marksmanmaster,brawlermaster)
}

CreatureTemplates:addCreatureTemplate(elite_mandalorian_supercommando, "elite_mandalorian_supercommando")
