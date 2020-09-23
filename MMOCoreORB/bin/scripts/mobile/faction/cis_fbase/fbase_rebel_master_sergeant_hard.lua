fbase_rebel_master_sergeant_hard = Creature:new {
	objectName = "@mob/creature_names:fbase_cis_master_sergeant_hard",
	socialGroup = "rebel",
	faction = "rebel",
	level = 57,
	chanceHit = 0.57,
	damageMin = 430,
	damageMax = 570,
	baseXp = 5700,
	baseHAM = 11000,
	baseHAMmax = 15000,
	armor = 1,
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
	optionsBitmask = AIENABLED + CONVERSABLE,
	diet = HERBIVORE,

templates = {"object/mobile/battle_droid_red.iff"},
	lootGroups = {
		{
			groups = {
				{group = "color_crystals", chance = 100000},
				{group = "junk", chance = 6000000},
				{group = "weapons_all", chance = 1100000},
				{group = "armor_all", chance = 1100000},
				{group = "clothing_attachments", chance = 150000},
				{group = "armor_attachments", chance = 150000},
				{group = "rebel_officer_common", chance = 400000},
				{group = "wearables_all", chance = 1000000}
			}
		}
	},
	weapons = {"rebel_weapons_medium"},
	conversationTemplate = "rebelRecruiterConvoTemplate",
	reactionStf = "@npc_reaction/military",
	attacks = merge(brawlermaster,marksmanmaster,carbineermid)
}

CreatureTemplates:addCreatureTemplate(fbase_rebel_master_sergeant_hard, "fbase_rebel_master_sergeant_hard")
