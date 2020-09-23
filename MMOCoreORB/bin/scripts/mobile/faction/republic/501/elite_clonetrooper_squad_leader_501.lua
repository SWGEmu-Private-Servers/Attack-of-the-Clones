elite_clonetrooper_squad_leader_501 = Creature:new {
	objectName = "@mob/creature_names:elite_clonetrooper_squad_leader_501",
	randomNameType = NAME_SWAMPTROOPER,
	randomNameTag = true,
	socialGroup = "imperial",
	faction = "imperial",
	level = 227,
	chanceHit = 11.37,
	damageMin = 2000,
	damageMax = 2470,
	baseXp = 28222,
	baseHAM = 82500,
	baseHAMmax = 149000,
	armor = 0,
	resists = {80,80,70,60,80,60,80,30,-1},
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
							--"object/mobile/dressed_clonetrooper_blue_m.iff",
							"object/mobile/dressed_clonetrooper_blue_nh_m.iff"
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
	attacks = merge(riflemanmaster,carbineermaster,brawlermaster)
}

CreatureTemplates:addCreatureTemplate(elite_clonetrooper_squad_leader_501, "elite_clonetrooper_squad_leader_501")
