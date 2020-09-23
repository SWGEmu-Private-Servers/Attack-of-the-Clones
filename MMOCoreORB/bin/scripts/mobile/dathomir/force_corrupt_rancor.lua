force_corrupt_rancor = Creature:new {
	objectName = "",
	customName = "a force corrupted beast",
	socialGroup = "dark_jedi",
	faction = "",
	level = 178,
	chanceHit = 1.025,
	damageMin = 1020,
	damageMax = 1550,
	baseXp = 19336,
	baseHAM = 55000,
	baseHAMmax = 75000,
	armor = 2,
	resists = {170,170,170,60,60,60,60,60,60},
	meatType = "meat_carnivore",
	meatAmount = 1000,
	hideType = "hide_leathery",
	hideAmount = 1000,
	boneType = "bone_mammal",
	boneAmount = 950,
	milk = 0,
	tamingChance = 0,
	ferocity = 20,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/wod_mutant_rancor_boss.iff"},
	--hues = { 12, 13, 14, 15, 16, 17, 18, 19 },
	scale = .75,
	lootGroups = {
		{
			groups = {
				{group = "rancor_common", chance = 10000000},
			},
			lootChance = 8000000
		},
		{
			groups = {
				{group = "noob_weapons", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "wearables_all", chance = 10000000},
				-- TODO: Jedi Cosmetics
			},
			lootChance = 10000000
		},
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"creatureareableeding",""},
		{"creatureareacombo",""}
	}
}

CreatureTemplates:addCreatureTemplate(force_corrupt_rancor, "force_corrupt_rancor")
