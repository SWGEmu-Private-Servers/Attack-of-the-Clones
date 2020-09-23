global_rebel_base_rebel_large_theater = Lair:new {
	mobiles = {
		{"cis_battle_droid_captain",1},
		{"cis_sbd",2},
		{"cis_battle_droid_squad_leader",2},
		{"cis_battle_droid",4}
	},
	spawnLimit = 15,
	buildingsVeryEasy = {"object/building/poi/anywhere_rebel_base_large_1.iff"},
	buildingsEasy = {"object/building/poi/anywhere_rebel_base_large_1.iff"},
	buildingsMedium = {"object/building/poi/anywhere_rebel_base_large_1.iff"},
	buildingsHard = {"object/building/poi/anywhere_rebel_base_large_1.iff"},
	buildingsVeryHard = {"object/building/poi/anywhere_rebel_base_large_1.iff"},
	missionBuilding = "object/tangible/lair/base/objective_banner_rebel.iff",
	mobType = "npc",
	buildingType = "theater",
	faction = "rebel"
}

addLairTemplate("global_rebel_base_rebel_large_theater", global_rebel_base_rebel_large_theater)
