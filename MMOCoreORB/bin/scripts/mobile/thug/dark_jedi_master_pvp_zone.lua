dark_jedi_master_pvp_zone = Creature:new {
	objectName = "",
	customName = "a battle crazed wielder of the dark side",
	socialGroup = "dark_jedi",
	faction = "",
	level = 291,
	chanceHit = 27.25,
	damageMin = 1800,
	damageMax = 2910,
	baseXp = 27849,
	baseHAM = 70000,
	baseHAMmax = 102000,
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

	templates = { "dark_jedi" },
	lootGroups = {
		{
			groups = {
				{group = "restuss_cis", chance = 1000000},
				--We can replace with a PvP item/Name Crystal, something relevant to the pvp zone.
				{group = "armor_attachments", chance = 4500000},
				{group = "clothing_attachments", chance = 4500000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "restuss_cis", chance = 10000000},
			},
			lootChance = 10000000
		},
	},
	weapons = {"arzo_suun_weapons"},
	conversationTemplate = "",
	attacks = merge(lightsabermaster,forcepowermaster)
}

CreatureTemplates:addCreatureTemplate(dark_jedi_master_pvp_zone, "dark_jedi_master_pvp_zone")
