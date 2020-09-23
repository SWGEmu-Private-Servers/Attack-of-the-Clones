meatlump_clod = Creature:new {
	objectName = "@mob/creature_names:meatlump_clod",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "meatlump",
	faction = "meatlump",
	level = 8,
	chanceHit = 0.270000,
	damageMin = 70,
	damageMax = 75,
	baseXp = 235,
	baseHAM = 405,
	baseHAMmax = 495,
	armor = 0,
	resists = {0,0,0,0,0,0,0,-1,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0.000000,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = PACK,
	diet = HERBIVORE,

	templates = {
		"object/mobile/dressed_meatlump_female_01.iff",
		"object/mobile/dressed_meatlump_female_02.iff",
		"object/mobile/dressed_meatlump_female_03.iff",
		"object/mobile/dressed_meatlump_female_04.iff",
		"object/mobile/dressed_meatlump_female_05.iff",
		"object/mobile/dressed_meatlump_female_06.iff",
		"object/mobile/dressed_meatlump_male_01.iff",
		"object/mobile/dressed_meatlump_male_02.iff",
		"object/mobile/dressed_meatlump_male_03.iff",
		"object/mobile/dressed_meatlump_male_04.iff",
		"object/mobile/dressed_meatlump_male_05.iff",
		"object/mobile/dressed_meatlump_male_06.iff",
	},
	lootGroups = {
		{
			groups = {
				{group = "junk", chance = 2900000},
				{group = "loot_kit_parts", chance = 1500000},
				{group = "color_crystals", chance = 100000},
				{group = "tailor_components", chance = 500000},
				{group = "meatlump_common", chance = 5000000}
			}
		}
	},
	weapons = {"pirate_weapons_light"},
	reactionStf = "@npc_reaction/slang",
	attacks = merge(brawlernovice,marksmannovice)
}

CreatureTemplates:addCreatureTemplate(meatlump_clod, "meatlump_clod")
