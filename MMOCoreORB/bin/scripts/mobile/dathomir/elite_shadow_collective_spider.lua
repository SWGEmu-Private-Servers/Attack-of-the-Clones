elite_shadow_collective_spider = Creature:new {
	objectName = "@mob/creature_names:elite_shadow_collective_spider",
	socialGroup = "shadow_collective",
	faction = "",
	level = 126,
	chanceHit = 4.75,
	damageMin = 1230,
	damageMax = 1970,
	baseXp = 11953,
	baseHAM = 141000,
	baseHAMmax = 199000,
	armor = 2,
	resists = {175,175,135,130,130,130,15,130,-1},
	meatType = "meat_insect",
	meatAmount = 1111,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 8,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER + STALKER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/gaping_spider_recluse_giant_kiin_dray.iff"},
	hues = { 17, 18, 19, 20, 21, 22, 23, 24 },
	scale = 2.67,
	lootGroups = {
		{
			groups = {
					{group = "fire_breathing_spider", chance = 4000000},
					{group = "rancor_common", chance = 3000000},
					{group = "armor_all", chance = 1000000},
					{group = "wearables_all", chance = 2000000}
					},
			lootChance = 5780000
		}
	},
	weapons = {"creature_spit_small_toxicgreen"},
	conversationTemplate = "",
	attacks = {
		{"creatureareapoison",""},
		{"strongpoison",""}
	}
}

CreatureTemplates:addCreatureTemplate(elite_shadow_collective_spider, "elite_shadow_collective_spider")
