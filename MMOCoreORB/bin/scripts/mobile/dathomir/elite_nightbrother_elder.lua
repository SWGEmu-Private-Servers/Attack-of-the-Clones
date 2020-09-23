elite_nightbrother_elder = Creature:new {
	objectName = "@mob/creature_names:elite_nightbrother_elder",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "shadow_collective",
	faction = "",
	level = 278,
	chanceHit = 27.25,
	damageMin = 1520,
	damageMax = 2750,
	baseXp = 26654,
	baseHAM = 321000,
	baseHAMmax = 392000,
	armor = 3,
	resists = {75,25,25,200,200,200,200,200,-1},
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
	"object/mobile/dressed_emperors_hand_zabrak_male_01.iff",
	--"object/mobile/dressed_spice_collective_eliteguard_zabrak_male_01",
	},

	lootGroups = {
		{
			groups = {
				{group = "nightbrother_tooth", chance = 2000000},
				{group = "nightbrother_common", chance = 3000000},
				{group = "armor_attachments", chance = 2500000},
				{group = "clothing_attachments", chance = 2500000},
				--{group = "wearables_scarce", chance = 1000000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "nightbrother_tooth", chance = 7000000},
				{group = "nightbrother_common", chance = 3000000},
			},
			lootChance = 5000000
		}
	},
	weapons = {"unarmed_weapons"},
	conversationTemplate = "",
	attacks = merge(tkamaster,brawlermaster,forcepowermaster)
}

CreatureTemplates:addCreatureTemplate(elite_nightbrother_elder, "elite_nightbrother_elder")
