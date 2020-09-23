fbase_rebel_squad_leader = Creature:new {
	objectName = "@mob/creature_names:fbase_cis_squad_leader",
	socialGroup = "rebel",
	faction = "rebel",
	level = 42,
	chanceHit = 0.46,
	damageMin = 355,
	damageMax = 420,
	baseXp = 4200,
	baseHAM = 9500,
	baseHAMmax = 11700,
	armor = 0,
	resists = {110,110,40,40,130,40,130,-1,-1},
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
	creatureBitmask = PACK,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

templates = {"object/mobile/battle_droid_red.iff"},

	lootGroups = {
		{
			groups = {
				{group = "color_crystals", chance = 200000},
				{group = "junk", chance = 6000000},
				{group = "weapons_all", chance = 1250000},
				{group = "armor_all", chance = 1250000},
				{group = "clothing_attachments", chance = 150000},
				{group = "armor_attachments", chance = 150000},
				{group = "wearables_all", chance = 1000000}
			}
		}
	},
	weapons = {"rebel_weapons_medium"},
	conversationTemplate = "",
	reactionStf = "@npc_reaction/military",
	attacks = merge(brawlermaster,marksmanmaster,carbineernovice)
}

CreatureTemplates:addCreatureTemplate(fbase_rebel_squad_leader, "fbase_rebel_squad_leader")
