elite_clone_scout_trooper_501 = Creature:new {
	objectName = "@mob/creature_names:elite_clone_scout_trooper_501",
	randomNameType = NAME_SWAMPTROOPER,
	randomNameTag = true,
	socialGroup = "imperial",
	faction = "imperial",
	level = 223,
	chanceHit = 10.35,
	damageMin = 1200,
	damageMax = 1930,
	baseXp = 20006,
	baseHAM = 63000,
	baseHAMmax = 77000,
	armor = 2,
	resists = {75,75,70,70,70,-1,70,-1,-1},
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
		"object/mobile/dressed_clone_arc_501.iff"
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
	weapons = {"clonetrooper_weapons_mix"},
	conversationTemplate = "",
	reactionStf = "@npc_reaction/stormtrooper",
	personalityStf = "@hireling/hireling_stormtrooper",
	attacks = merge(brawlermaster,marksmanmaster)
}

CreatureTemplates:addCreatureTemplate(elite_clone_scout_trooper_501, "elite_clone_scout_trooper_501")
