elite_death_watch_jedi_hunter = Creature:new {
	customName = "a Jedi Hunter",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "death_watch",
	faction = "",
	level = 304,
	chanceHit = 30,
	damageMin = 2400,
	damageMax = 4310,
	baseXp = 27849,
	baseHAM = 425000,
	baseHAMmax = 700000,
	armor = 3,
	resists = {80,85,195,70,70,70,190,70,115},
	--kinetic,energy,blast,heat,cold,electric,acid,stun,ls
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
	scale = 1.1,

	templates = {"object/mobile/dressed_death_watch_gold.iff"},
	lootGroups = {
		{
			groups = {
				{group = "armor_attachments", chance = 5000000},
				{group = "clothing_attachments", chance = 5000000},
				},
				lootChance = 10000000
		},
		{
			groups = {
				{group = "armor_attachments", chance = 5000000},
				{group = "clothing_attachments", chance = 5000000},
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
							{group = "death_watch_weapon_components", chance = 10000000},
						},
						lootChance = 5000000
				},
			{
				groups = {
						{group = "death_watch_bunker_ingredient_protective", chance = 5000000},
						{group = "death_watch_bunker_ingredient_binary", chance = 5000000},
					},
					lootChance = 2000000
			},
	},
	weapons = {"firebat_weapons","jedi_gen4_allcolors"},
	conversationTemplate = "",
	attacks = merge(lightsabermaster,fencermaster,brawlermaster,commandomaster,bountyhuntermaster)
}

CreatureTemplates:addCreatureTemplate(elite_death_watch_jedi_hunter, "elite_death_watch_jedi_hunter")
