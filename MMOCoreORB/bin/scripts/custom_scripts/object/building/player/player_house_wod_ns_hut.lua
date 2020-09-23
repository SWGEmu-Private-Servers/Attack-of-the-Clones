object_building_player_player_house_wod_ns_hut = object_building_player_shared_player_house_wod_ns_hut:new {
	lotSize = 1,
	baseMaintenanceRate = 6,
	allowedZones = {"corellia", "dantooine", "lok", "naboo", "rori", "talus", "tatooine"},
	publicStructure = 0,
	skillMods = {
		{"private_medical_rating", 100},
		{"private_buff_mind", 100},
		{"private_med_battle_fatigue", 5},
		{"private_safe_logout", 1}
	},
	childObjects = {
			{templateFile = "object/tangible/sign/player/house_address.iff", x = -1.55, z = 2.7, y =5.92, ox = 0, oy = -1, oz = 0, ow = 0, cellid = -1, containmentType = -1},
			{templateFile = "object/tangible/terminal/terminal_player_structure.iff", x = 1.96633, z = 0.752993, y = 2.12718, ow = 0, ox = 0, oz = 0, oy = -1, cellid = 1, containmentType = -1},
		},
	shopSigns = {
		{templateFile = "object/tangible/sign/player/house_address.iff", x = -1.55, z = 2.7, y = 5.92, ox = 0, oy = -1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:house_address"},
		{templateFile = "object/tangible/sign/player/shop_sign_s01.iff", x = -9.13, z = 0.79, y = 6.43, ox = 0, oy = 0, oz = 0, ow =  1, cellid = -1, containmentType = -1, requiredSkill = "crafting_merchant_management_01", suiItem = "@player_structure:shop_sign1"},
		{templateFile = "object/tangible/sign/player/shop_sign_s02.iff", x = -9.13, z = 0.79, y = 6.43, ox = 0, oy = 0, oz = 0, ow =  1, cellid = -1, containmentType = -1, requiredSkill = "crafting_merchant_management_02", suiItem = "@player_structure:shop_sign2"},
		{templateFile = "object/tangible/sign/player/shop_sign_s03.iff", x = -9.13, z = 0.79, y = 6.43, ox = 0, oy = 0, oz = 0, ow =  1, cellid = -1, containmentType = -1, requiredSkill = "crafting_merchant_management_03", suiItem = "@player_structure:shop_sign3"},
		{templateFile = "object/tangible/sign/player/shop_sign_s04.iff", x = -9.13, z = 0.79, y = 6.43, ox = 0, oy = 0, oz = 0, ow =  1, cellid = -1, containmentType = -1, requiredSkill = "crafting_merchant_management_04", suiItem = "@player_structure:shop_sign4"},
		{templateFile = "object/tangible/sign/player/wod_sm_hanging_sign_01.iff", x = -1.55, z = 2.7, y = 5.92, ox = 0, oy = -1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "loot_sign_01", suiItem = "@player_structure:wod_sm_hanging_sign_01"},
		{templateFile = "object/tangible/sign/player/wod_sm_standing_sign_01.iff", x = -9.13, z = 0.79, y = 6.43, ox = 0, oy = 0, oz = 0, ow =  1, cellid = -1, containmentType = -1, requiredSkill = "loot_sign_02", suiItem = "@player_structure:wod_sm_standing_sign_01"},
		{templateFile = "object/tangible/sign/player/wod_sm_banner_sign_01.iff", x = -1.55, z = 2.7, y = 5.92, ox = 0, oy = -1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "loot_sign_03", suiItem = "@player_structure:wod_sm_banner_sign_01"},
		{templateFile = "object/tangible/sign/player/wod_sm_banner_sign_02.iff", x = -1.55, z = 2.7, y = 5.92, ox = 0, oy = -1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "loot_sign_04", suiItem = "@player_structure:wod_sm_banner_sign_02"},
		{templateFile = "object/tangible/sign/player/wod_sm_banner_sign_03.iff", x = -1.55, z = 2.7, y = 5.92, ox = 0, oy = -1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "loot_sign_05", suiItem = "@player_structure:wod_sm_banner_sign_03"},
	}
}

ObjectTemplates:addTemplate(object_building_player_player_house_wod_ns_hut, "object/building/player/player_house_wod_ns_hut.iff")
