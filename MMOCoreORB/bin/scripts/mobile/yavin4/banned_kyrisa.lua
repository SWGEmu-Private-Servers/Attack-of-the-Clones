banned_kyrisa = Creature:new {
	customName = "Kyrisa, a banished Nightsister",
	--need custom name in tre
	socialGroup = "shadow_collective",
	faction = "",
	level = 333,
	chanceHit = 30,
	damageMin = 4000,
	damageMax = 5500,
	baseXp = 45000,
	baseHAM = 1406000,
	baseHAMmax = 1852000,
	armor = 3,
	resists = {95,95,95,90,90,95,95,95,45},
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
	creatureBitmask = STALKER + KILLER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {
		"object/mobile/kyrisa.iff"},
	lootGroups = {
		{
			groups = {
				{group = "krayt_pearls", chance = 2500000},
				{group = "holocron_dark", chance = 2500000},
				{group = "armor_attachments", chance = 2500000},
				{group = "clothing_attachments", chance = 2500000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "krayt_pearls", chance = 2500000},
				{group = "holocron_dark", chance = 2500000},
				{group = "armor_attachments", chance = 2500000},
				{group = "clothing_attachments", chance = 2500000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "krayt_pearls", chance = 2500000},
				{group = "holocron_dark", chance = 2500000},
				{group = "armor_attachments", chance = 2500000},
				{group = "clothing_attachments", chance = 2500000}
			},
			lootChance = 10000000
		}
	},
	weapons = {"dark_jedi_gen4_pike"},
	conversationTemplate = "",
	attacks = merge(lightsabermaster,forcepowermaster)
}

CreatureTemplates:addCreatureTemplate(banned_kyrisa, "banned_kyrisa")
