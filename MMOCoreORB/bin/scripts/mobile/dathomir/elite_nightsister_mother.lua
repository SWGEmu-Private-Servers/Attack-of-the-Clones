elite_nightsister_mother = Creature:new {
	objectName = "@mob/creature_names:elite_nightsister_mother",
	socialGroup = "shadow_collective",
	faction = "nightsister",
	level = 302,
	chanceHit = 26.5,
	damageMin = 1888,
	damageMax = 2500,
	specialDamageMult = 4.0,
	baseXp = 28549,
	baseHAM = 285000,
	baseHAMmax = 420000,
	armor = 3,
	resists = {75,155,155,90,70,70,70,70,-1},
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
	creatureBitmask = PACK + KILLER + HEALER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_dathomir_nightsister_spellweaver.iff"},
	lootGroups = {
		{
			groups = {
				{group = "nightsister_common", chance = 7000000},
				{group = "armor_attachments", chance = 1500000},
				{group = "clothing_attachments", chance = 1500000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "power_crystals", chance = 2000000},
				{group = "wearables_rare", chance = 800000}
			},
			lootChance = 10000000
		},
	},
	weapons = {"mixed_force_weapons"},
	conversationTemplate = "",
	attacks = merge(tkamaster,pikemanmaster,brawlermaster,forcepowermaster)
}

CreatureTemplates:addCreatureTemplate(elite_nightsister_mother, "elite_nightsister_mother")
