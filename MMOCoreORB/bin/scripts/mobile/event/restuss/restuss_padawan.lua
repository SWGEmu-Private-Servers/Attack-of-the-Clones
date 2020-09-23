restuss_padawan = Creature:new {
	objectName = "@mob/creature_names:restuss_padawan",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "self",
	faction = "imperial",
	level = 60,
	chanceHit = 3,
	damageMin = 645,
	damageMax = 1250,
	baseXp = 45,
	baseHAM = 41060,
	baseHAMmax = 43520,
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
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,
	scale = 0.80,

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
					{group = "restuss_republic", chance = 10000000}
				},
				lootChance = 10000000
			}
		},
		
	weapons = {"light_jedi_weapons_basic"},
	conversationTemplate = "",
	attacks = merge(lightsabermaster,forcepowermaster)
}

CreatureTemplates:addCreatureTemplate(restuss_padawan, "restuss_padawan")
