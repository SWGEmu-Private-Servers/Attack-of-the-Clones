fbase_rebel_colonel = Creature:new {
	objectName = "@mob/creature_names:fbase_cis_colonel",
	socialGroup = "rebel",
	faction = "rebel",
	level = 90,
	chanceHit = 0.9,
	damageMin = 600,
	damageMax = 900,
	baseXp = 9000,
	baseHAM = 18700,
	baseHAMmax = 20700,
	armor = 2,
	resists = {30,30,30,30,30,30,30,30,30},
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

CreatureTemplates:addCreatureTemplate(fbase_rebel_colonel, "fbase_rebel_colonel")
