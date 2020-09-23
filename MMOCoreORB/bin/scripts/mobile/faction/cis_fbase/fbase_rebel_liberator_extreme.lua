fbase_rebel_liberator_extreme = Creature:new {
	objectName = "@mob/creature_names:fbase_cis_liberator_extreme",
	socialGroup = "rebel",
	faction = "rebel",
	level = 172,
	chanceHit = 8.2,
	damageMin = 1005,
	damageMax = 1720,
	baseXp = 17200,
	baseHAM = 53500,
	baseHAMmax = 75000,
	armor = 2,
	resists = {25,25,25,-1,130,-1,130,-1,-1},
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
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {
		"object/mobile/death_watch_battle_droid.iff"
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
	weapons = {"rebel_weapons_medium"},
	conversationTemplate = "",
	reactionStf = "@npc_reaction/military",
	attacks = merge(marksmanmaster,brawlermaster,riflemanmaster)
}

CreatureTemplates:addCreatureTemplate(fbase_rebel_liberator_extreme, "fbase_rebel_liberator_extreme")
