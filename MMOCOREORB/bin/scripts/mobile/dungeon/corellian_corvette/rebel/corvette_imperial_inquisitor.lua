corvette_imperial_inquisitor = Creature:new {
	objectName = "@mob/creature_names:rep_jedi_knight",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "imperial",
	faction = "imperial",
	level = 226,
	chanceHit = 19.75,
	damageMin = 1270,
	damageMax = 2250,
	baseXp = 21533,
	baseHAM = 308000,
	baseHAMmax = 354000,
	armor = 1,
	resists = {65,65,65,65,65,65,65,65,65},
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
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {
		"object/mobile/dressed_jedi_knight_01.iff",
		"object/mobile/dressed_jedi_knight_02.iff",
		"object/mobile/dressed_neja_bertolo.iff"
		},

	lootGroups = {
		{
			groups = {
				{group = "color_crystals", chance = 600000},
				{group = "junk", chance = 6650000},
				{group = "clothing_attachments", chance = 575000},
				{group = "armor_attachments", chance = 575000},
				{group = "wearables_all", chance = 1600000}
			}
		}
	},
	weapons = {"light_jedi_weapons_basic"},
	conversationTemplate = "",
	reactionStf = "@npc_reaction/military",
	personalityStf = "@hireling/hireling_military",
	attacks = merge(lightsabermaster,forcepowermaster)
}

CreatureTemplates:addCreatureTemplate(corvette_imperial_inquisitor, "corvette_imperial_inquisitor")
