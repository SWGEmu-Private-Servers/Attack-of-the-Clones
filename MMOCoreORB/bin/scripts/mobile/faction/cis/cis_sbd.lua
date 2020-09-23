cis_sbd = Creature:new {
	objectName = "@mob/creature_names:cis_sbd",
	customName = "A Super Battle Droid",
	socialGroup = "rebel",
	faction = "rebel",
	level = 20,
	chanceHit = 0.33,
	damageMin = 290,
	damageMax = 300,
	baseXp = 2006,
	baseHAM = 10000,
	baseHAMmax = 16100,
	armor = 1,
	resists = {40,40,40,40,40,40,40,40,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED + FACTIONAGGRO,
	diet = HERBIVORE,
	scale = 1.10,

	templates = {
			"object/mobile/death_watch_s_battle_droid_02.iff"
	},
	lootGroups = {
	{
		groups = {
			{group = "noob_weapons", chance = 10000000},
		},
		lootChance = 5500000,
	},

	},
	defaultWeapon = "object/weapon/ranged/droid/droid_droideka_ranged.iff",
	conversationTemplate = "",
	reactionStf = "",
	personalityStf = "@hireling/hireling_military",
	attacks = merge(brawlermaster,marksmanmaster)
}

CreatureTemplates:addCreatureTemplate(cis_sbd, "cis_sbd")
