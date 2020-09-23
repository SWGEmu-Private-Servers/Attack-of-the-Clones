fbase_rebel_army_captain = Creature:new {
	objectName = "@mob/creature_names:fbase_cis_army_captain",
	socialGroup = "rebel",
	faction = "rebel",
	level = 31,
	chanceHit = 0.4,
	damageMin = 300,
	damageMax = 310,
	baseXp = 3100,
	baseHAM = 8500,
	baseHAMmax = 10500,
	armor = 0,
	resists = {10,10,10,10,10,10,10,-1,-1},
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
	optionsBitmask = AIENABLED + CONVERSABLE,
	diet = HERBIVORE,

	templates = {
		"object/mobile/death_watch_battle_droid_03.iff"
	},
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
	attacks = merge(brawlermaster,marksmanmaster,teraskasinovice,carbineernovice)
}

CreatureTemplates:addCreatureTemplate(fbase_rebel_army_captain, "fbase_rebel_army_captain")
