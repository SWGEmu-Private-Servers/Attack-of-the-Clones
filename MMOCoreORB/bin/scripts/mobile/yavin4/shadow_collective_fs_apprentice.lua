shadow_collective_fs_apprentice = Creature:new {
	customName = "a Shadow Collective initiate",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "shadow_collective",
	faction = "",
	level = 236,
	chanceHit = 4.85,
	damageMin = 2570,
	damageMax = 3250,
	baseXp = 27202,
	baseHAM = 235000,
	baseHAMmax = 360000,
	armor = 2,
	resists = {75,75,70,70,75,195,180,180,125},
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
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,
	scale = 1,

	templates = {"object/mobile/dressed_mauler.iff"},
	lootGroups = {
		{
			groups = {
				{group = "krayt_pearls", chance = 1500000},
				{group = "wearables_scarce", chance = 3500000},
				{group = "armor_attachments", chance = 2500000},
				{group = "clothing_attachments", chance = 2500000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "krayt_pearls", chance = 1000000},
				{group = "wearables_scarce", chance = 2000000},
				{group = "armor_attachments", chance = 3500000},
				{group = "clothing_attachments", chance = 3500000}
			},
			lootChance = 7000000
		},
		{
			groups = {
				{group = "krayt_pearls", chance = 1000000},
				{group = "holocron_dark", chance = 2000000},
				{group = "armor_attachments", chance = 3500000},
				{group = "clothing_attachments", chance = 3500000}
			},
			lootChance = 3000000
		},

	},
	weapons = {"pikeman_weapons", "dark_jedi_gen4_pike"},
	conversationTemplate = "",
	attacks = merge(lightsabermaster,elitepikemanmaster)
}

CreatureTemplates:addCreatureTemplate(shadow_collective_fs_apprentice, "shadow_collective_fs_apprentice")
