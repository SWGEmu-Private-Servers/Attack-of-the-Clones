elite_clonetrooper_captain_501 = Creature:new {
	objectName = "@mob/creature_names:elite_clonetrooper_captain_501",
	randomNameType = NAME_SWAMPTROOPER,
	randomNameTag = true,
	socialGroup = "imperial",
	faction = "imperial",
	level = 239,
	chanceHit = 24.38,
	damageMin = 2600,
	damageMax = 2910,
	baseXp = 30005,
	baseHAM = 199000,
	baseHAMmax = 249900,
	armor = 3,
	resists = {70,70,70,70,70,70,90,40,-1},
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
	creatureBitmask = PACK + KILLER + AGGRESSIVE,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,
	scale = 1.30,

	templates = {
		"object/mobile/dressed_clone_arc_501.iff"
		--"object/mobile/dressed_clone_arc_nh_501.iff"
	},
	lootGroups = {
		{
			groups = {
			{group = "clothing_attachments", chance = 3500000},
			{group = "armor_attachments", chance = 3500000},
			{group = "noob_weapons", chance = 3000000}
			},
			lootChance = 10000000
		},
	},
	weapons = {"clonetrooper_weapons_mix"},
	conversationTemplate = "",
	reactionStf = "@npc_reaction/stormtrooper",
	personalityStf = "@hireling/hireling_stormtrooper",
	attacks = merge(riflemanmaster,carbineermaster,brawlermaster)
}

CreatureTemplates:addCreatureTemplate(elite_clonetrooper_captain_501, "elite_clonetrooper_captain_501")
