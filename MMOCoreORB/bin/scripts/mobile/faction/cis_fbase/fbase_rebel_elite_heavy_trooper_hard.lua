fbase_rebel_elite_heavy_trooper_hard = Creature:new {
	objectName = "@mob/creature_names:fbase_cis_elite_heavy_trooper_hard",
	socialGroup = "rebel",
	faction = "rebel",
	level = 180,
	chanceHit = 9.0,
	damageMin = 1045,
	damageMax = 1800,
	baseXp = 18000,
	baseHAM = 60000,
	baseHAMmax = 82500,
	armor = 2,
	resists = {140,30,30,150,150,150,150,40,40},
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
	creatureBitmask = PACK + STALKER + KILLER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {
			"object/mobile/death_watch_s_battle_droid_03.iff"
	},
	lootGroups = {
		{
			groups = {
				{group = "color_crystals", chance = 300000},
				{group = "junk", chance = 6000000},
				{group = "holocron_dark", chance = 150000},
				{group = "holocron_light", chance = 150000},
				{group = "weapons_all", chance = 1050000},
				{group = "armor_all", chance = 1050000},
				{group = "clothing_attachments", chance = 150000},
				{group = "armor_attachments", chance = 150000},
				{group = "wearables_all", chance = 1000000}
			}
		}
	},
	defaultWeapon = "object/weapon/ranged/droid/droid_droideka_ranged.iff",
	conversationTemplate = "",
	reactionStf = "@npc_reaction/military",
	attacks = merge(brawlermaster,marksmanmaster,riflemanmaster,teraskasimid)
}

CreatureTemplates:addCreatureTemplate(fbase_rebel_elite_heavy_trooper_hard, "fbase_rebel_elite_heavy_trooper_hard")