poison_acklay = Creature:new {
	objectName = "@mob/creature_names:geonosian_acklay_bunker_boss",
	customName = "a deranged Acklay",
	socialGroup = "geonosian_creature",
	faction = "",
	level = 157,
	chanceHit = 40,
	damageMin = 2270,
	damageMax = 4250,
	baseXp = 28549,
	baseHAM = 210000,
	baseHAMmax = 301000,
	armor = 3,
	resists = {190,165,175,175,30,150,150,150,-1},
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

CreatureTemplates:addCreatureTemplate(poison_acklay, "poison_acklay")
