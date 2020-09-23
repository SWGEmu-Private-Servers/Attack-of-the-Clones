fbase_rebel_soldier_extreme = Creature:new {
	objectName = "@mob/creature_names:fbase_cis_soldier_extreme",
	socialGroup = "rebel",
	faction = "rebel",
	level = 160,
	chanceHit = 7.0,
	damageMin = 945,
	damageMax = 1600,
	baseXp = 16000,
	baseHAM = 45000,
	baseHAMmax = 62500,
	armor = 2,
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
	weapons = {"rebel_weapons_medium"},
	conversationTemplate = "",
	reactionStf = "@npc_reaction/military",
	attacks = merge(marksmanmaster,brawlermaster,carbineermaster,tkamaster)
}

CreatureTemplates:addCreatureTemplate(fbase_rebel_soldier_extreme, "fbase_rebel_soldier_extreme")
