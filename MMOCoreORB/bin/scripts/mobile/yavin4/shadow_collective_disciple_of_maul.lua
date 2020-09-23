shadow_collective_disciple_of_maul = Creature:new {
	customName = "a disciple of Maul",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "shadow_collective",
	level = 291,
	chanceHit = 4.75,
	damageMin = 1700,
	damageMax = 2650,
	baseXp = 22424,
	baseHAM = 500000,
	baseHAMmax = 610000,
	armor = 2,
	resists = {75,200,75,90,200,200,200,200,25},
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

	templates = {
	"object/mobile/dressed_creaturehandler_trainer_zabrak_male_01.iff",
	"object/mobile/dressed_spice_collective_eliteguard_zabrak_male_01.iff",
	},

	lootGroups = {
	{
		groups = {
			{group = "krayt_pearls", chance = 2500000},
			{group = "wearables_scarce", chance = 2500000},
			{group = "armor_attachments", chance = 2500000},
			{group = "clothing_attachments", chance = 2500000}
		},
		lootChance = 10000000
	},
		{
			groups = {
				{group = "holocron_dark", chance = 3000000},
				{group = "armor_attachments", chance = 3500000},
				{group = "clothing_attachments", chance = 3500000},
			},
			lootChance = 5500000
		},
		{
			groups = {
				{group = "holocron_dark", chance = 6000000},
				{group = "noob_weapons", chance = 2000000},
				{group = "armor_attachments", chance = 1000000},
				{group = "clothing_attachments", chance = 1000000},
			},
			lootChance = 4500000
		},
	},
	weapons = {"dark_jedi_gen4_pike"},
	conversationTemplate = "",
	reactionStf = "@npc_reaction/slang",
	attacks = merge(brawlermaster,pikemanmaster,lightsabermaster)
}

CreatureTemplates:addCreatureTemplate(shadow_collective_disciple_of_maul, "shadow_collective_disciple_of_maul")
