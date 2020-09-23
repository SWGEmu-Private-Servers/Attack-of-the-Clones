cad_bane = Creature:new {
	customName = "Cad Bane",
	--randomNameType = NAME_GENERIC,
	--randomNameTag = true,
	socialGroup = "shadow_collective",
	faction = "",
	level = 278,
	chanceHit = 8.5,
	damageMin = 1895,
	damageMax = 4500,
	baseXp = 14314,
	baseHAM = 510000,
	baseHAMmax = 920000,
	armor = 3,
	resists = {90,95,80,80,70,75,70,80,25},
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
	creatureBitmask = KILLER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,
	scale = .75,

	templates = {
	"object/mobile/cad_bane.iff",
	},

	lootGroups = {
		{
			groups = {
				{group = "dath_schems", chance = 2000000},
				{group = "blacksun_rare", chance = 500000},
				{group = "tfa_paintings", chance = 100000},
				{group = "weapon_components", chance = 2000000},
				{group = "skill_buffs", chance = 4000000},
				{group = "junk", chance = 1400000}
			},
			lootChance = 10000000
		}
	},

	weapons = {"pirate_weapons_heavy","pistoleer_weapons"},
	conversationTemplate = "",
	attacks = merge(bountyhuntermaster,marksmanmaster,brawlermaster,pistoleermaster)
}

CreatureTemplates:addCreatureTemplate(cad_bane, "cad_bane")
