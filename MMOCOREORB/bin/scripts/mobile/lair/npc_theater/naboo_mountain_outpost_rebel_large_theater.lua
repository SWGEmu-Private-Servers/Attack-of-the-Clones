naboo_mountain_outpost_rebel_large_theater = Lair:new {
	mobiles = {
		{"cis_magnaguard",1},
		{"cis_sbd",1},
		{"cis_battle_droid_captain",1},
		{"rebel_medic",1},
		{"cis_battle_droid_scout",4},
		{"cis_battle_droid_squad_leader",2},
		{"cis_battle_droid",4}
	},
	spawnLimit = 15,
	buildingsVeryEasy = {"object/building/poi/anywhere_rebel_base_large_1.iff","object/building/poi/anywhere_rebel_camp_large_1.iff"},
	buildingsEasy = {"object/building/poi/anywhere_rebel_base_large_1.iff","object/building/poi/anywhere_rebel_camp_large_1.iff"},
	buildingsMedium = {"object/building/poi/anywhere_rebel_base_large_1.iff","object/building/poi/anywhere_rebel_camp_large_1.iff"},
	buildingsHard = {"object/building/poi/anywhere_rebel_base_large_1.iff","object/building/poi/anywhere_rebel_camp_large_1.iff"},
	buildingsVeryHard = {"object/building/poi/anywhere_rebel_base_large_1.iff","object/building/poi/anywhere_rebel_camp_large_1.iff"},
	mobType = "npc",
	buildingType = "theater"
}

addLairTemplate("naboo_mountain_outpost_rebel_large_theater", naboo_mountain_outpost_rebel_large_theater)
