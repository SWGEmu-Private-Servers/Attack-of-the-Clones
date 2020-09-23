force_corrupt_spider = Creature:new {
	objectName = "",
	customName = "a force corrupted beast",
	socialGroup = "dark_jedi",
	faction = "",
	level = 146,
	chanceHit = 4.75,
	damageMin = 1030,
	damageMax = 1670,
	baseXp = 21953,
	baseHAM = 91000,
	baseHAMmax = 150000,
	armor = 2,
	resists = {155,155,135,130,130,130,15,130,40},
	meatType = "meat_insect",
	meatAmount = 110,
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
	scale = 2.0,
	lootGroups = {
		{
			groups = {
					{group = "fire_breathing_spider", chance = 7000000},
					{group = "noob_weapons", chance = 3000000},
					},
			lootChance = 7780000
		}
	},
	weapons = {"creature_spit_small_toxicgreen"},
	conversationTemplate = "",
	attacks = {
		{"creatureareapoison",""},
		{"strongpoison",""}
	}
}

CreatureTemplates:addCreatureTemplate(force_corrupt_spider, "force_corrupt_spider")
