shadow_collective_assassin = Creature:new {
	customName = "a Shadow Collective assassin",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "shadow_collective",
	level = 161,
	chanceHit = 4,
	damageMin = 970,
	damageMax = 1250,
	baseXp = 22424,
	baseHAM = 50000,
	baseHAMmax = 61000,
	armor = 2,
	resists = {55,200,55,200,200,200,200,200,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_bountyhunter_trainer_03.iff",
	"object/mobile/dressed_black_sun_thug.iff",
	"object/mobile/dressed_black_sun_guard.iff",
	"object/mobile/dressed_black_sun_assassin.iff"},

	lootGroups = {
		{
			groups = {
				{group = "noob_weapons", chance = 3000000},
				{group = "armor_attachments", chance = 3500000},
				{group = "clothing_attachments", chance = 3500000},
			},
			lootChance = 8500000
		}
	},
	weapons = {"pistoleer_weapons","boba_fett_weapons"},
	conversationTemplate = "",
	reactionStf = "@npc_reaction/slang",
	attacks = merge(quickdraw,carbineermaster,bountyhuntermaster)
}

CreatureTemplates:addCreatureTemplate(shadow_collective_assassin, "shadow_collective_assassin")
