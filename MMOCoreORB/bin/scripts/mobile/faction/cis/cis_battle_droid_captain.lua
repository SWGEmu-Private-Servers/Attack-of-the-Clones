cis_battle_droid_captain = Creature:new {
	objectName = "@mob/creature_names:cis_battle_droid",
	customName = "A Battle Droid Captain",
	socialGroup = "rebel",
	faction = "rebel",
	level = 22,
	chanceHit = 0.34,
	damageMin = 200,
	damageMax = 210,
	baseXp = 2006,
	baseHAM = 5400,
	baseHAMmax = 6600,
	armor = 0,
	resists = {25,25,25,25,25,25,25,25,-1},
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
	optionsBitmask = AIENABLED + FACTIONAGGRO + CONVERSABLE,
	diet = HERBIVORE,

	templates = {
		"object/mobile/battle_droid_yellow.iff",
		"object/mobile/battle_droid_yellow_geo.iff",
		},
	lootGroups = {
		{
			groups = {
				{group = "noob_weapons", chance = 10000000},
			},
			lootChance = 4000000,
		},
	},
	weapons = {"battle_droid_weapons"},
	defaultAttack = "defaultdroidrangedattack",
	conversationTemplate = "rebelRecruiterConvoTemplate",
	reactionStf = "@npc_reaction/battle_droid",
	attacks = merge(brawlermaster,marksmanmaster)
}

CreatureTemplates:addCreatureTemplate(cis_battle_droid_captain, "cis_battle_droid_captain")
