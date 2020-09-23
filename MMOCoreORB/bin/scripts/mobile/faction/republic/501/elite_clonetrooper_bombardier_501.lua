elite_clonetrooper_bombardier_501 = Creature:new {
	objectName = "@mob/creature_names:elite_clonetrooper_bombardier_501",
	randomNameType = NAME_SWAMPTROOPER,
	randomNameTag = true,
	socialGroup = "imperial",
	faction = "imperial",
	level = 225,
	chanceHit = 0.36,
	damageMin = 350,
	damageMax = 370,
	baseXp = 2637,
	baseHAM = 109900,
	baseHAMmax = 122200,
	armor = 2,
	resists = {75,75,90,65,65,75,75,-1,10},
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
	scale = 1.25,

	templates = {
		"object/mobile/dressed_clonetrooper_heavy_501.iff"
	},
	lootGroups = {
		{
			groups = {
			{group = "clothing_attachments", chance = 2500000},
			{group = "armor_attachments", chance = 2500000},
			{group = "noob_weapons", chance = 5000000}
			}
		}
	},
	weapons = {"st_bombardier_weapons"},
	conversationTemplate = "",
	reactionStf = "@npc_reaction/stormtrooper",
	personalityStf = "@hireling/hireling_stormtrooper",
	attacks = merge(commandomaster,marksmanmaster,brawlermaster)
}

CreatureTemplates:addCreatureTemplate(elite_clonetrooper_bombardier_501, "elite_clonetrooper_bombardier_501")
