fbase_rebel_guardsman = Creature:new {
	objectName = "@mob/creature_names:fbase_cis_guardsman",
	socialGroup = "rebel",
	faction = "rebel",
	level = 35,
	chanceHit = 0.42,
	damageMin = 320,
	damageMax = 350,
	baseXp = 3500,
	baseHAM = 8900,
	baseHAMmax = 10900,
	armor = 0,
	resists = {30,30,30,130,30,130,-1,-1,-1},
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
		"object/mobile/battle_droid.iff"
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
	weapons = {"rebel_weapons_heavy"},
	conversationTemplate = "",
	reactionStf = "@npc_reaction/military",
	attacks = merge(marksmanmaster,brawlermaster,commandonovice)
}

CreatureTemplates:addCreatureTemplate(fbase_rebel_guardsman, "fbase_rebel_guardsman")
