nightbrother_archer = Creature:new {
	objectName = "@mob/creature_names:nightbrother_archer",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "shadow_collective",
	faction = "",
	level = 248,
	chanceHit = 27.25,
	damageMin = 1520,
	damageMax = 2750,
	baseXp = 26654,
	baseHAM = 101000,
	baseHAMmax = 202000,
	armor = 3,
	resists = {75,75,75,200,200,200,200,200,10},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER + HEALER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {
	"object/mobile/dressed_creaturehandler_trainer_zabrak_male_01.iff",
	},

	lootGroups = {
		{
			groups = {
				{group = "nightbrother_common", chance = 4000000},
				{group = "armor_attachments", chance = 3000000},
				{group = "clothing_attachments", chance = 3000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "nightbrother_common", chance = 3000000},
				{group = "armor_attachments", chance = 3000000},
				{group = "clothing_attachments", chance = 3000000},
				{group = "wearables_scarce", chance = 1000000}
			},
			lootChance = 5000000
		},
	},
	weapons = {"sniper_weapons"},
	conversationTemplate = "",
	attacks = merge(brawlermaster,fencermaster,riflemanmaster)
}

CreatureTemplates:addCreatureTemplate(nightbrother_archer, "nightbrother_archer")
