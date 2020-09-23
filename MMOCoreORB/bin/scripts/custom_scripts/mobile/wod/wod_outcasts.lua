function createOutcastNPC(num)
	wod_outcast = Creature:new {
	objectName = "@mob/creature_names:wod_outcast",
		socialGroup = "",
		faction = "",
		level = 100,
		chanceHit = 0.39,
		damageMin = 290,
		damageMax = 300,
		baseXp = 2914,
		baseHAM = 8400,
		baseHAMmax = 10200,
		armor = 0,
		resists = {-1,-1,-1,-1,-1,-1,-1,-1,-1},
		meatType = "",
		meatAmount = 0,
		hideType = "",
		hideAmount = 0,
		boneType = "",
		boneAmount = 0,
		milk = 0,
		tamingChance = 0,
		ferocity = 0,
		pvpBitmask = NONE,
		creatureBitmask = NONE,
		optionsBitmask = AIENABLED + INVULNERABLE + CONVERSABLE,
		diet = HERBIVORE,
	
		templates = {
			"object/mobile/dressed_wod_gray_outcast_01.iff",
			"object/mobile/dressed_wod_gray_outcast_02.iff",
			"object/mobile/dressed_wod_gray_outcast_03.iff",
			"object/mobile/dressed_wod_gray_outcast_04.iff",
			"object/mobile/dressed_wod_gray_outcast_05.iff",
			"object/mobile/dressed_wod_gray_outcast_06.iff",
			"object/mobile/dressed_wod_gray_outcast_07.iff",
			"object/mobile/dressed_wod_gray_outcast_08.iff",
			"object/mobile/dressed_wod_gray_outcast_09.iff",
			"object/mobile/dressed_wod_gray_outcast_10.iff",
		},
		lootGroups = {},
		weapons = {},
		conversationTemplate = "wod_prologue_outcast_" .. num,
		attacks = {
		}
	}
	
	CreatureTemplates:addCreatureTemplate(wod_outcast, "wod_outcast_0" .. num)
end

createOutcastNPC("1")
createOutcastNPC("2")
createOutcastNPC("3")
createOutcastNPC("4")
createOutcastNPC("5")
createOutcastNPC("6")
createOutcastNPC("7")
