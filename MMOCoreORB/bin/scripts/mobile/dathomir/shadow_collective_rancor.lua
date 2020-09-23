shadow_collective_rancor = Creature:new {
	objectName = "@mob/creature_names:ancient_bull_rancor",
	socialGroup = "shadow_collective",
	faction = "",
	level = 178,
	chanceHit = 0.925,
	damageMin = 1020,
	damageMax = 1550,
	baseXp = 19336,
	baseHAM = 55000,
	baseHAMmax = 75000,
	armor = 2,
	resists = {150,165,0,200,200,200,0,0,-1},
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
	scale = 1.25,
	lootGroups = {
		{
			groups = {
				{group = "rancor_common", chance = 5000000},
				{group = "armor_all", chance = 1000000},
				{group = "wearables_all", chance = 4000000}
			},
			lootChance = 5960000
		}
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"creatureareableeding",""},
		{"creatureareacombo",""}
	}
}

CreatureTemplates:addCreatureTemplate(shadow_collective_rancor, "shadow_collective_rancor")
