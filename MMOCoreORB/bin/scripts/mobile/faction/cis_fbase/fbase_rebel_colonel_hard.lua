fbase_rebel_colonel_hard = Creature:new {
	objectName = "@mob/creature_names:fbase_cis_colonel_hard",
	socialGroup = "rebel",
	faction = "rebel",
	level = 180,
	chanceHit = 9,
	damageMin = 1100,
	damageMax = 1800,
	baseXp = 18000,
	baseHAM = 55500,
	baseHAMmax = 60500,
	armor = 2,
	resists = {75,75,75,75,75,75,75,75,35},
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
		"object/mobile/magnaguard.iff"
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
	weapons = {"magnaguard_weapons"},
	conversationTemplate = "rebelRecruiterConvoTemplate",
	attacks = merge(lightsabermaster,pikemanmaster)
}

CreatureTemplates:addCreatureTemplate(fbase_rebel_colonel_hard, "fbase_rebel_colonel_hard")
