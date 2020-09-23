fbase_rebel_liberator = Creature:new {
	objectName = "@mob/creature_names:fbase_cis_liberator",
	socialGroup = "rebel",
	faction = "rebel",
	level = 43,
	chanceHit = 0.47,
	damageMin = 360,
	damageMax = 430,
	baseXp = 4300,
	baseHAM = 9600,
	baseHAMmax = 11800,
	armor = 0,
	resists = {5,5,5,-1,130,-1,130,-1,-1},
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
	attacks = merge(marksmanmaster,brawlermaster,riflemannovice)
}

CreatureTemplates:addCreatureTemplate(fbase_rebel_liberator, "fbase_rebel_liberator")
