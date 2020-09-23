death_watch_pikeman = Creature:new {
	objectName = "@mob/creature_names:death_watch_pikeman",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "death_watch",
	faction = "",
	level = 229,
	chanceHit = 10.5,
	damageMin = 1150,
	damageMax = 1700,
	baseXp = 15314,
	baseHAM = 65000,
	baseHAMmax = 90000,
	armor = 2,
	resists = {75,75,50,50,75,75,75,50,-1},
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
	scale = 1.20,

	templates = {"object/mobile/dressed_death_watch_red.iff"},
	lootGroups = {
		{
			groups = {
				{group = "death_watch_bunker_commoners",   chance = 5500000},
				{group = "death_watch_bunker_lieutenants", chance = 2500000},
				{group = "clothing_attachments", chance = 500000},
				{group = "armor_attachments", chance = 500000},
				{group = "bounty_hunter_armor", chance = 1000000},
			},
			lootChance = 5500000
		}
	},
	weapons = {"pikeman_weapons"},
	conversationTemplate = "",
	attacks = merge(brawlermaster,elitepikemanmaster)
}

CreatureTemplates:addCreatureTemplate(death_watch_pikeman,"death_watch_pikeman")
