fbase_rebel_sharpshooter = Creature:new {
	objectName = "@mob/creature_names:fbase_cis_sharpshooter",
	socialGroup = "rebel",
	faction = "rebel",
	level = 27,
	chanceHit = 0.38,
	damageMin = 260,
	damageMax = 270,
	baseXp = 2700,
	baseHAM = 8100,
	baseHAMmax = 9900,
	armor = 0,
	resists = {5,5,5,5,5,5,5,-1,-1},
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
	creatureBitmask = PACK,
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
	attacks = merge(brawlermaster,riflemannovice,marksmanmaster)
}

CreatureTemplates:addCreatureTemplate(fbase_rebel_sharpshooter, "fbase_rebel_sharpshooter")
