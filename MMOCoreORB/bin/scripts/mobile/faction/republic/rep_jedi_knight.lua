rep_jedi_knight = Creature:new {
	objectName = "@mob/creature_names:rep_jedi_knight",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "self",
	faction = "imperial",
	level = 30,
	chanceHit = 3,
	damageMin = 645,
	damageMax = 1000,
	baseXp = 45,
	baseHAM = 21060,
	baseHAMmax = 23520,
	armor = 1,
	resists = {45,45,45,45,45,45,45,45,45},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED + CONVERSABLE,
	diet = HERBIVORE,

	templates = {
		"object/mobile/dressed_jedi_knight_01.iff",--knight robe, blonde 
		"object/mobile/dressed_jedi_knight_02.iff", --dathomirian
		"object/mobile/dressed_neja_bertolo.iff", --twilek grey robes
		"object/mobile/dressed_jedi_knight_03.iff", --elder robe 
		"object/mobile/dressed_jedi_knight_04.iff", --elder robe
		"object/mobile/dressed_jedi_knight_05.iff", --knight robe --mohawk/red
		"object/mobile/dressed_jedi_knight_06.iff", --knight robe --mohawk/red
		"object/mobile/dressed_jedi_trainer_twilek_female_01.iff", --female twilek cloak
		"object/mobile/dressed_jedi_trainer_nikto_male_01.iff", --nikto male
		"object/mobile/dressed_jedi_trainer_old_human_male_01.iff", --old human male, dark skin
		"object/mobile/dressed_jedi_trainer_chiss_male_01.iff", --chiss
		"object/mobile/kit_fisto_cloak.iff", --nautolan
		"object/mobile/dressed_tiberus_anderlock.iff" --old human male, white
		},

		lootGroups = {
			{
				groups = {
					{group = "junk", chance = 3000000},
					{group = "power_crystals", chance = 800000},
					{group = "color_crystals", chance = 700000},
					{group = "holocron_light", chance = 1000000},
					{group = "melee_weapons", chance = 1000000},
					{group = "armor_attachments", chance = 1000000},
					{group = "clothing_attachments", chance = 1000000},
					{group = "wearables_all", chance = 1400000},
					{group = "force_hunter_rare", chance = 100000}
				}
			}
		},
	weapons = {"light_jedi_weapons_basic"},
	conversationTemplate = "imperialRecruiterConvoTemplate",
	attacks = merge(lightsabermaster,forcepowermaster)
}

CreatureTemplates:addCreatureTemplate(rep_jedi_knight, "rep_jedi_knight")
