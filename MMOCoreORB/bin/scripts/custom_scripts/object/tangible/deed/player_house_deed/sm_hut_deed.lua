object_tangible_deed_player_house_deed_sm_hut_deed = object_tangible_deed_player_house_deed_shared_sm_hut_deed:new {
	templateType = STRUCTUREDEED,
	placeStructureComponent = "PlaceStructureComponent",
	generatedObjectTemplate = "object/building/dathomir/player_house_wod_sm_hut.iff",


	numberExperimentalProperties = {1, 1, 1},
	experimentalProperties = {"XX", "XX", "DR"},
	experimentalWeights = {1, 1, 1},
	experimentalGroupTitles = {"null", "null", "exp_durability"},
	experimentalSubGroupTitles = {"null", "null", "hitpoints"},
	experimentalMin = {0, 0, 21000},
	experimentalMax = {0, 0, 39000},
	experimentalPrecision = {0, 0, 0},
	experimentalCombineType = {0, 0, 4},
}

ObjectTemplates:addTemplate(object_tangible_deed_player_house_deed_sm_hut_deed, "object/tangible/deed/player_house_deed/sm_hut_deed.iff")
