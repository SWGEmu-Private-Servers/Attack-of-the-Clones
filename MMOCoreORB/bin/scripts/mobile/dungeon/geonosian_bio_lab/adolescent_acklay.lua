adolescent_acklay = Creature:new {
	objectName = "@mob/creature_names:geonosian_acklay_bunker_boss",
	customName = "an adolescent Acklay",
	socialGroup = "shadow_collective",
	faction = "",
	level = 125,
	chanceHit = 40,
	damageMin = 1470,
	damageMax = 2250,
	baseXp = 28549,
	baseHAM = 71000,
	baseHAMmax = 104000,
	armor = 3,
	resists = {160,155,155,155,20,140,140,140,-1},
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
	scale = .35,
	lootGroups = {
		{
			groups = {
				{group = "nightbrother_common", chance = 10000000}
			},
			lootChance = 5000000
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

CreatureTemplates:addCreatureTemplate(adolescent_acklay, "adolescent_acklay")
