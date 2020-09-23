death_watch_assualt = Creature:new {
	objectName = "@mob/creature_names:death_watch_elite_ranged",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "death_watch",
	faction = "",
	level = 300,
	chanceHit = 17.25,
	damageMin = 2240,
	damageMax = 3200,
	baseXp = 14314,
	baseHAM = 75000,
	baseHAMmax = 80000,
	armor = 2,
	resists = {75,75,70,35,75,75,75,70,-1},
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
	scale = 1.00,

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
		lootChance = 6500000
		}
	},
	weapons = {"assault_weapons"},
	conversationTemplate = "",
	attacks = merge(carbineermaster,mastermarksman)
}

CreatureTemplates:addCreatureTemplate(death_watch_assualt,"death_watch_assualt")
