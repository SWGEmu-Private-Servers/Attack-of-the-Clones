death_watch_sniper = Creature:new {
	objectName = "@mob/creature_names:death_watch_sniper",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "death_watch",
	faction = "",
	level = 229,
	chanceHit = 12.5,
	damageMin = 1750,
	damageMax = 3500,
	baseXp = 14314,
	baseHAM = 45000,
	baseHAMmax = 65000,
	armor = 2,
	resists = {75,75,60,60,55,55,55,50,-1},
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
	scale = 0.90,

	templates = {"object/mobile/dressed_death_watch_grey.iff"},
	lootGroups = {
		{
			groups = {
				{group = "death_watch_bunker_commoners",   chance = 5600000},
				{group = "death_watch_bunker_lieutenants", chance = 2000000},
				{group = "clothing_attachments", chance = 1000000},
				{group = "armor_attachments", chance = 1000000},
				{group = "death_watch_bunker_ingredient_protective",  chance = 200000},
				{group = "death_watch_bunker_ingredient_binary",  chance = 200000}
			},
			lootChance = 5500000
		}
	},
	weapons = {"sniper_weapons"},
	conversationTemplate = "",
	attacks = merge(riflemanmaster,fencermaster)
}

CreatureTemplates:addCreatureTemplate(death_watch_sniper, "death_watch_sniper")
