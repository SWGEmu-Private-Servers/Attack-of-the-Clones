fbase_rebel_grenadier_extreme = Creature:new {
	objectName = "@mob/creature_names:fbase_cis_grenadier_extreme",
	socialGroup = "rebel",
	faction = "rebel",
	level = 148,
	chanceHit = 5.8,
	damageMin = 885,
	damageMax = 1480,
	baseXp = 14800,
	baseHAM = 36000,
	baseHAMmax = 51000,
	armor = 2,
	resists = {30,30,30,130,30,130,-1,-1,-1},
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

	templates = {
			"object/mobile/death_watch_battle_droid_02.iff"
			},
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
	weapons = {"rebel_weapons_heavy"},
	conversationTemplate = "",
	reactionStf = "@npc_reaction/military",
	attacks = merge(marksmanmaster,brawlermaster,commandomaster)
}

CreatureTemplates:addCreatureTemplate(fbase_rebel_grenadier_extreme, "fbase_rebel_grenadier_extreme")
