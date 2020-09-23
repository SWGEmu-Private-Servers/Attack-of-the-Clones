fbase_stormtrooper_captain_extreme = Creature:new {
	objectName = "@mob/creature_names:fbase_stormtrooper_captain_extreme",
	randomNameType = NAME_SWAMPTROOPER,
	randomNameTag = true,
	socialGroup = "imperial",
	faction = "imperial",
	level = 180,
	chanceHit = 9.0,
	damageMin = 1045,
	damageMax = 1800,
	baseXp = 18000,
	baseHAM = 60000,
	baseHAMmax = 82500,
	armor = 3,
	resists = {40,40,40,-1,130,-1,130,-1,-1},
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
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,
	scale = 1.05,

	templates = {"object/mobile/dressed_clonetrooper_m.iff",
		     "object/mobile/dressed_clonetrooper_blue_m.iff",
		     "object/mobile/dressed_scout_trooper_white_white.iff",
		     "object/mobile/dressed_clonetrooper_blue_nh_m.iff"
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
				{group = "imperial_officer_common", chance = 500000},
				{group = "wearables_all", chance = 900000}
			}
		}
	},
	weapons = {"clonetrooper_weapons"},
	conversationTemplate = "",
	reactionStf = "@npc_reaction/stormtrooper",
	attacks = merge(carbineermaster,brawlermaster,marksmanmaster,riflemanmid)
}

CreatureTemplates:addCreatureTemplate(fbase_stormtrooper_captain_extreme, "fbase_stormtrooper_captain_extreme")
