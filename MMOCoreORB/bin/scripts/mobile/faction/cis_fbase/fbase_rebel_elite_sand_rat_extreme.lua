fbase_rebel_elite_sand_rat_extreme = Creature:new {
	objectName = "@mob/creature_names:fbase_cis_elite_sand_rat_extreme",
	socialGroup = "rebel",
	faction = "rebel",
	level = 210,
	chanceHit = 12.0,
	damageMin = 1195,
	damageMax = 2100,
	baseXp = 21000,
	baseHAM = 82000,
	baseHAMmax = 112500,
	armor = 3,
	resists = {0,0,140,200,-1,-1,-1,-1,-1},
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
	creatureBitmask = PACK + STALKER + KILLER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {
			"object/mobile/death_watch_battle_droid_02.iff"
			},
	lootGroups = {
		{
			groups = {
				{group = "color_crystals", chance = 200000},
				{group = "junk", chance = 6000000},
				{group = "weapons_all", chance = 1250000},
				{group = "armor_all", chance = 1250000},
				{group = "clothing_attachments", chance = 150000},
				{group = "armor_attachments", chance = 150000},
				{group = "wearables_all", chance = 1000000}
			}
		}
	},
	weapons = {"rebel_weapons_light"},
	conversationTemplate = "",
	reactionStf = "@npc_reaction/military",
	attacks = merge(marksmanmaster,brawlermaster,pistoleermaster)
}

CreatureTemplates:addCreatureTemplate(fbase_rebel_elite_sand_rat_extreme, "fbase_rebel_elite_sand_rat_extreme")
