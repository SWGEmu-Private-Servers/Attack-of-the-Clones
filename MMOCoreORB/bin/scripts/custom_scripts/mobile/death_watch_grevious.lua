death_watch_grevious = Creature:new {
	--objectName = "@mob/creature_names:mand_bunker_super_battle_droid",
	customName = "an experimental training droid",
	socialGroup = "death_watch",
	faction = "",
	level = 304,
	chanceHit = 18,
	damageMin = 1000,
	damageMax = 1500,
	baseXp = 19000,
	baseHAM = 25000,
	baseHAMmax = 75000,
	armor = 3,
	resists = {75,75,90,90,90,65,60,85,5},--kinetic,energy,blast,heat,cold,electric,acid,stun,ls
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
	diet = NONE,
	scale = .90,

	templates = {
	"object/mobile/ep3/general_grievous.iff",
	--"object/mobile/ig_88.iff",
		},
	lootGroups = {
		{
      		groups = {
        		{group = "armor_attachments", chance = 5000000},
        		{group = "clothing_attachments", chance = 5000000}

      		},
      		lootChance = 10000000
    	},
	},
	weapons = {"jedi_gen4_allcolors"},
	conversationTemplate = "",
	attacks = merge(lightsabermaster)
}

CreatureTemplates:addCreatureTemplate(death_watch_grevious, "death_watch_grevious")
