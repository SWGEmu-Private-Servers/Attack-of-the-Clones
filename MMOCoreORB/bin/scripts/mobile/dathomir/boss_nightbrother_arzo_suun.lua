boss_nightbrother_arzo_suun = Creature:new {
	objectName = "",
	customName = "Arzo Suun (a Nightbrother Leader)",
	socialGroup = "shadow_collective",
	faction = "",
	level = 291,
	chanceHit = 30.25,
	damageMin = 1800,
	damageMax = 3310,
	baseXp = 37849,
	baseHAM = 301000,
	baseHAMmax = 420000,
	armor = 3,
	resists = {90,90,90,90,90,90,90,90,25},
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
	creatureBitmask = KILLER + STALKER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = { "object/mobile/dressed_corsair_captain_zab_m.iff" },
	lootGroups = {
		{
			groups = {
				{group = "wearables_scarce", chance = 2000000}, --Eventual cosmetic slot?
				{group = "armor_attachments", chance = 4000000},
				{group = "clothing_attachments", chance = 4000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "power_crystals", chance = 5000000},
				{group = "krayt_pearls", chance = 5000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
					{group = "nightbrother_tooth", chance = 10000000},
			},
			lootChance = 10000000
		}
	},
	weapons = {"arzo_suun_weapons"},
	conversationTemplate = "",
	attacks = merge(lightsabermaster)
}

CreatureTemplates:addCreatureTemplate(boss_nightbrother_arzo_suun, "boss_nightbrother_arzo_suun")
