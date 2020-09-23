cis_magnaguard = Creature:new {
	objectName = "@mob/creature_names:cis_magnaguard",
	customName = "A Magnaguard",
	socialGroup = "self",
	faction = "rebel",
	level = 30,
	chanceHit = 3,
	damageMin = 645,
	damageMax = 1000,
	baseXp = 45,
	baseHAM = 21060,
	baseHAMmax = 23520,
	armor = 1,
	resists = {45,45,45,45,45,45,45,45,45},
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
	optionsBitmask = AIENABLED + FACTIONAGGRO,
	diet = HERBIVORE,

	templates = {
		"object/mobile/magnaguard.iff"
	},
	lootGroups = {
		{
			groups = {
				{group = "junk", chance = 3000000},
				{group = "power_crystals", chance = 800000},
				{group = "color_crystals", chance = 700000},
				{group = "holocron_dark", chance = 1000000},
				{group = "melee_weapons", chance = 1000000},
				{group = "armor_attachments", chance = 1000000},
				{group = "clothing_attachments", chance = 1000000},
				{group = "wearables_all", chance = 1400000},
				{group = "force_hunter_rare", chance = 100000}
			}
		}
	},
	weapons = {"magnaguard_weapons"},
	conversationTemplate = "",
	attacks = merge(lightsabermaster,pikemanmaster)
}

CreatureTemplates:addCreatureTemplate(cis_magnaguard, "cis_magnaguard")
