nightbrother_acklay = Creature:new {
	objectName = "@mob/creature_names:geonosian_acklay_bunker_boss",
	customName = "a force corrupted Acklay",
	socialGroup = "shadow_collective",
	faction = "",
	level = 220,
	chanceHit = 40,
	damageMin = 2270,
	damageMax = 4250,
	baseXp = 38549,
	baseHAM = 310000,
	baseHAMmax = 501000,
	armor = 3,
	resists = {190,175,175,175,50,160,160,160,10},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 25,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/acklay_hue.iff"},
	lootGroups = {
		{
			groups = {
				{group = "acklay", chance = 10000000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "nightbrother_common", chance = 10000000}
			},
			lootChance = 2500000
		},
		{
			groups = {
				{group = "acklay", chance = 10000000}
			},
			lootChance = 2500000
		}
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"strongpoison","stateAccuracyBonus=200"},
		{"creatureareapoison","stateAccuracyBonus=200"},
		{"posturedownattack","stateAccuracyBonus=50"},
	}
}

CreatureTemplates:addCreatureTemplate(nightbrother_acklay, "nightbrother_acklay")
