death_watch_commando = Creature:new {
	objectName = "@mob/creature_names:death_watch_elite_commando",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "death_watch",
	faction = "",
	level = 300,
	chanceHit = 17.50,
	damageMin = 1020,
	damageMax = 1550,
	baseXp = 16794,
	baseHAM = 95000,
	baseHAMmax = 120000,
	armor = 2,
	resists = {80,80,40,40,95,90,60,75,-1},
		-- kin,eng,elect,stun,blast,heat,cold,acid,lightsaber
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
	scale = 1.25,

	templates = {"object/mobile/dressed_death_watch_gold.iff"},
	lootGroups = {
		{
			groups = {
				{group = "death_watch_bunker_commoners",   chance = 1500000},
				{group = "death_watch_bunker_ingredient_protective",  chance = 500000},
				{group = "death_watch_bunker_ingredient_binary",  chance = 500000},
				{group = "krayt_tissue_rare", chance = 1500000},
				{group = "clothing_attachments", chance = 3000000},
				{group = "armor_attachments", chance = 3000000},
			},
			lootChance = 7000000
		},
		{
			groups = {
				{group = "death_watch_bunker_commoners",   chance = 10000000},
			},
			lootChance = 3000000
		},
	},
	weapons = {"firebat_weapons"},
	conversationTemplate = "",
	attacks = merge(marksmanmaster,brawlermaster,commandomaster)
}

CreatureTemplates:addCreatureTemplate(death_watch_commando, "death_watch_commando")
