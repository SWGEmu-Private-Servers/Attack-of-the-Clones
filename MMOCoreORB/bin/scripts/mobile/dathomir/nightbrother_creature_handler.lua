nightbrother_creature_handler = Creature:new {
	--objectName = "@mob/creature_names:nightbrother_assasin",
	customName = "a Nightbrother Beast Master",
	--randomNameType = NAME_GENERIC,
		--randomNameTag = true,
	socialGroup = "shadow_collective",
	faction = "",
	level = 270,
	chanceHit = 13.5,
	damageMin = 1550,
	damageMax = 2650,
	baseXp = 25314,
	baseHAM = 111000,
	baseHAMmax = 205000,
	armor = 2,
	resists = {75,75,70,70,55,75,75,50,25},
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
	creatureBitmask = KILLER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,
	scale = 1.0,

	templates = {
	--"object/mobile/dressed_spice_collective_eliteguard_zabrak_male_01.iff",
	"object/mobile/dressed_criminal_thug_zabrak_male_01.iff",


	},

	lootGroups = {
		{
			groups = {
				{group = "clothing_attachments", chance = 4000000},
				{group = "armor_attachments", chance = 4000000},
				{group = "bounty_hunter_armor", chance = 2000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "clothing_attachments", chance = 5000000},
				{group = "nightbrother_common", chance = 5000000},
			},
			lootChance = 10000000
		}
	},
	weapons = {"twohand_weapons"},
	conversationTemplate = "",
	attacks = merge(elite2hmaster)
}

CreatureTemplates:addCreatureTemplate(nightbrother_creature_handler, "nightbrother_creature_handler")
