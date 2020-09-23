factionRewardType = {
	armor = 1,
	weapon = 2,
	uniform = 3,
	furniture = 4,
	container = 5,
	terminal = 6,
	installation = 7,
	hireling = 8,
}

rebelRewardData = {
	weaponsArmorList = {
	"armor_sep_battle_helmet", "armor_sep_battle_chest_plate", "armor_sep_battle_leggings", "armor_sep_battle_boots", "armor_sep_battle_bicep_l", "armor_sep_battle_bicep_r",
	"armor_sep_battle_bracer_l", "armor_sep_battle_bracer_r", "armor_sep_battle_gloves", "armor_sep_battle_utility_belt",
	"weapon_recruiter_electrostaff", "carbine_laser", "pistol_scout_blaster", "rocket_launcher", "mine_drx", "mine_xg",
	},

	weaponsArmor = {
	armor_sep_battle_bicep_l = { type=factionRewardType.armor, display="@craft_item_ingredients_n:armor_sep_battle_bicep_l_schematic", item="object/tangible/loot/loot_schematic/sep_battle_bicep_l_crafted_schematic.iff",cost=20000},
	armor_sep_battle_bicep_r = { type=factionRewardType.armor, display="@craft_item_ingredients_n:armor_sep_battle_bicep_r_schematic", item="object/tangible/loot/loot_schematic/sep_battle_bicep_r_crafted_schematic.iff",cost=20000},
	armor_sep_battle_boots = { type=factionRewardType.armor, display="@craft_item_ingredients_n:armor_sep_battle_boots_schematic", item="object/tangible/loot/loot_schematic/sep_battle_boots_crafted_schematic.iff",cost=20000},
	armor_sep_battle_chest_plate = { type=factionRewardType.armor, display="@craft_item_ingredients_n:armor_sep_battle_chest_schematic", item="object/tangible/loot/loot_schematic/sep_battle_chest_plate_crafted_schematic.iff", cost=20000},
	armor_sep_battle_helmet = { type=factionRewardType.armor, display="@craft_item_ingredients_n:armor_sep_battle_helmet_schematic", item="object/tangible/loot/loot_schematic/sep_battle_helmet_crafted_schematic.iff", cost=20000},
	armor_sep_battle_leggings = { type=factionRewardType.armor, display="@craft_item_ingredients_n:armor_sep_battle_leggings_schematic", item="object/tangible/loot/loot_schematic/sep_battle_leggings_crafted_schematic.iff",cost=20000},
	armor_sep_battle_bracer_l = { type=factionRewardType.armor, display="@craft_item_ingredients_n:armor_sep_battle_bracer_l_schematic", item="object/tangible/loot/loot_schematic/sep_battle_bracer_l_crafted_schematic.iff",cost=20000},
	armor_sep_battle_bracer_r = { type=factionRewardType.armor, display="@craft_item_ingredients_n:armor_sep_battle_bracer_r_schematic", item="object/tangible/loot/loot_schematic/sep_battle_bracer_r_crafted_schematic.iff",cost=20000},
	armor_sep_battle_gloves = { type=factionRewardType.armor, display="@craft_item_ingredients_n:armor_sep_battle_gloves_schematic", item="object/tangible/loot/loot_schematic/sep_battle_gloves_crafted_schematic.iff",cost=20000},
	armor_sep_battle_utility_belt = { type=factionRewardType.armor, display="@craft_item_ingredients_n:armor_sep_battle_belt_schematic", item="object/tangible/loot/loot_schematic/sep_battle_utility_belt_crafted_schematic.iff",cost=1400},
		carbine_laser = { index=7, type=factionRewardType.weapon, display="@weapon_name:carbine_laser", item="object/weapon/ranged/carbine/carbine_laser.iff", cost=1500},
		pistol_scout_blaster = { index=11, type=factionRewardType.weapon, display="@weapon_name:pistol_scout_blaster", item="object/weapon/ranged/pistol/pistol_scout_blaster.iff", cost=1000},
		metal_staff = { index=9, type=factionRewardType.weapon, display="@weapon_name:sword_02", item="object/weapon/ranged/melee/sword/sword_02.iff", cost=1000},
		rocket_launcher = { index=10, type=factionRewardType.weapon, display="@weapon_name:rocket_launcher", item="object/weapon/ranged/heavy/heavy_rocket_launcher.iff", cost=5000},
		weapon_recruiter_electrostaff = { index=8, type=factionRewardType.weapon, display="@wearables_name:weapon_recruiter_electrostaff", item="object/weapon/melee/polearm/lance_staff_magna_guard.iff", cost=2000},
		mine_drx = { type=factionRewardType.weapon, display="@weapon_name:mine_drx", item="object/weapon/mine/wp_mine_drx55.iff", cost=350},
		mine_xg = { type=factionRewardType.weapon, display="@weapon_name:mine_xg", item="object/weapon/mine/wp_mine_xg.iff", cost=350},
	},

	installationsList = {
		"hq_s01_rebel", "hq_s02_rebel", "hq_s03_rebel", "hq_s04_rebel",
		"covert_detector_32m",
		"minefield_1x1",
	},

	installations = {
		hq_s01_rebel = {type=factionRewardType.installation, display="@deed:hq_s01_rebel", item="object/tangible/deed/faction_perk/hq/hq_s01.iff", generatedObjectTemplate="object/building/faction_perk/hq/hq_s01_rebel.iff", cost=10000},
		hq_s02_rebel = {type=factionRewardType.installation, display="@deed:hq_s02_rebel", item="object/tangible/deed/faction_perk/hq/hq_s02.iff", generatedObjectTemplate="object/building/faction_perk/hq/hq_s02_rebel.iff", cost=20000},
		hq_s03_rebel = {type=factionRewardType.installation, display="@deed:hq_s03_rebel", item="object/tangible/deed/faction_perk/hq/hq_s03.iff", generatedObjectTemplate="object/building/faction_perk/hq/hq_s03_rebel.iff", cost=22500},
		hq_s04_rebel = {type=factionRewardType.installation, display="@deed:hq_s04_rebel", item="object/tangible/deed/faction_perk/hq/hq_s04.iff", generatedObjectTemplate="object/building/faction_perk/hq/hq_s04_rebel.iff", cost=30000},
		covert_detector_32m = { type=factionRewardType.installation, display="@deed:covert_detector_32m", item="object/tangible/deed/faction_perk/covert_detector/detector_32m_deed.iff", generatedObjectTemplate="object/installation/faction_perk/covert_detector/detector_base.iff", cost=3000 },
		minefield_1x1 = { type=factionRewardType.installation, display="@deed:minefield_1x1", item="object/tangible/deed/faction_perk/minefield/field_1x1_deed.iff", generatedObjectTemplate="object/installation/faction_perk/minefield/field_1x1.iff", cost=5000 },
	},

	furnitureList = {
		"tech_armoire", "tech_bookcase", "frn_cabinet", "tech_chair", "tech_chest", "frn_coffee_table", "frn_couch", "frn_end_table", "frn_vet_rug_rebel"
	},

	furniture = {
		tech_armoire = { type=factionRewardType.container, display="@container_name:tech_armoire", item="object/tangible/furniture/technical/armoire_s01.iff", cost=1400},
		tech_bookcase = { type=factionRewardType.container, display="@container_name:tech_bookcase", item="object/tangible/furniture/technical/bookcase_s01.iff", cost=1400},
		frn_cabinet = { type=factionRewardType.furniture, display="@frn_n:frn_cabinet", item="object/tangible/furniture/technical/cabinet_s01.iff", cost=200},
		tech_chair = { type=factionRewardType.furniture, display="@frn_n:frn_chair", item="object/tangible/furniture/technical/chair_s01.iff", cost=1000},
		tech_chest =  { type=factionRewardType.container, display="@container_name:tech_chest", item="object/tangible/furniture/technical/chest_s01.iff", cost=1000},
		frn_coffee_table = { type=factionRewardType.furniture, display="@frn_n:frn_coffee_table", item="object/tangible/furniture/technical/coffee_table_s01.iff", cost=1200},
		frn_couch = { type=factionRewardType.furniture, display="@frn_n:frn_couch", item="object/tangible/furniture/technical/couch_s01.iff", cost=1200},
		frn_end_table = { type=factionRewardType.furniture, display="@frn_n:frn_end_table", item="object/tangible/furniture/technical/end_table_s01.iff", cost=1000},
		frn_vet_rug_rebel = { type=factionRewardType.furniture, display="@frn_n:vet_rug_rebel", item="object/tangible/veteran_reward/frn_vet_rug_rebel.iff", cost=5000},
	},

	hirelingList = {
		"battle_droid", "battle_droid_squad_leader", "battle_droid_specforce", "battle_droid_commando", "sbd", "magnaguard", "hailfire"
	},

	hirelings = {
		battle_droid = { type=factionRewardType.hireling, display="@mob/creature_names:cis_battle_droid", item="object/intangible/pet/pet_control.iff", controlledObjectTemplate="cis_battle_droid", cost=150},
		battle_droid_squad_leader = { type=factionRewardType.hireling, display="@mob/creature_names:cis_battle_droid_squad_leader", item="object/intangible/pet/pet_control.iff", controlledObjectTemplate="cis_battle_droid_squad_leader", cost=220},
		battle_droid_specforce = { type=factionRewardType.hireling, display="@mob/creature_names:cis_battle_droid_specforce", item="object/intangible/pet/pet_control.iff", controlledObjectTemplate="cis_battle_droid_specforce", cost=420},
		battle_droid_commando = { type=factionRewardType.hireling, display="@mob/creature_names:cis_battle_droid_commando", item="object/intangible/pet/pet_control.iff", controlledObjectTemplate="cis_battle_droid_commando", cost=420},
		sbd = { type=factionRewardType.hireling, display="@mob/creature_names:cis_sbd", item="object/intangible/pet/pet_control.iff", controlledObjectTemplate="cis_sbd", cost=820},
		magnaguard = { type=factionRewardType.hireling, display="@mob/creature_names:cis_magnaguard", item="object/intangible/pet/pet_control.iff", controlledObjectTemplate="cis_magnaguard", cost=2120},
		hailfire = { type=factionRewardType.hireling, display="@mob/creature_names:recruiter_hailfire", item="object/intangible/pet/pet_control.iff", controlledObjectTemplate="cis_hailfire_pet", cost=9450},
	}
}

imperialRewardData = {
	weaponsArmorList = {
		"armor_clonetrooper_helmet", "armor_clonetrooper_chest_plate", "armor_clonetrooper_leggings", "armor_clonetrooper_boots", "armor_clonetrooper_bicep_l", "armor_clonetrooper_bicep_r",
		"armor_clonetrooper_bracer_l", "armor_clonetrooper_bracer_r", "armor_clonetrooper_gloves", "armor_clonetrooper_utility_belt", "carbine_dc15", "pistol_power5", "sword_02",
		"rocket_launcher", "mine_drx", "mine_xg",
	},

	weaponsArmor = {
			armor_clonetrooper_bicep_l = { type=factionRewardType.armor, display="@craft_item_ingredients_n:armor_clonetrooper_bicep_l_schematic", item="object/tangible/loot/loot_schematic/clonetrooper_bicep_l_crafted_schematic.iff",cost=20000},
			armor_clonetrooper_bicep_r = { type=factionRewardType.armor, display="@craft_item_ingredients_n:armor_clonetrooper_bicep_r_schematic", item="object/tangible/loot/loot_schematic/clonetrooper_bicep_r_crafted_schematic.iff",cost=20000},
			armor_clonetrooper_boots = { type=factionRewardType.armor, display="@craft_item_ingredients_n:armor_clonetrooper_boots_schematic", item="object/tangible/loot/loot_schematic/clonetrooper_boots_crafted_schematic.iff",cost=20000},
			armor_clonetrooper_chest_plate = { type=factionRewardType.armor, display="@craft_item_ingredients_n:armor_clonetrooper_chest_schematic", item="object/tangible/loot/loot_schematic/clonetrooper_chest_plate_crafted_schematic.iff", cost=20000},
			armor_clonetrooper_helmet = { type=factionRewardType.armor, display="@craft_item_ingredients_n:armor_clonetrooper_helmet_schematic", item="object/tangible/loot/loot_schematic/clonetrooper_helmet_crafted_schematic.iff", cost=20000},
			armor_clonetrooper_leggings = { type=factionRewardType.armor, display="@craft_item_ingredients_n:armor_clonetrooper_leggings_schematic", item="object/tangible/loot/loot_schematic/clonetrooper_leggings_crafted_schematic.iff",cost=20000},
			armor_clonetrooper_bracer_l = { type=factionRewardType.armor, display="@craft_item_ingredients_n:armor_clonetrooper_bracer_l_schematic", item="object/tangible/loot/loot_schematic/clonetrooper_bracer_l_crafted_schematic.iff",cost=20000},
			armor_clonetrooper_bracer_r = { type=factionRewardType.armor, display="@craft_item_ingredients_n:armor_clonetrooper_bracer_r_schematic", item="object/tangible/loot/loot_schematic/clonetrooper_bracer_r_crafted_schematic.iff",cost=20000},
			armor_clonetrooper_gloves = { type=factionRewardType.armor, display="@craft_item_ingredients_n:armor_clonetrooper_gloves_schematic", item="object/tangible/loot/loot_schematic/clonetrooper_gloves_crafted_schematic.iff",cost=20000},
			armor_clonetrooper_utility_belt = { type=factionRewardType.armor, display="@craft_item_ingredients_n:armor_clonetrooper_belt_schematic", item="object/tangible/loot/loot_schematic/clonetrooper_utility_belt_crafted_schematic.iff",cost=1400},
		--armor_stormtrooper_backpack = { type=factionRewardType.armor, display="@wearables_name:armor_stormtrooper_backpack", item="object/tangible/wearables/armor/stormtrooper/armor_stormtrooper_backpack.iff",cost=1500},
		--armor_212_bicep_l = { type=factionRewardType.armor, display="@wearables_name:armor_clonetrooper_b_bicep_l", item="object/tangible/wearables/armor/clone_trooper/armor_clone_trooper_imperial_s01_bicep_l.iff",cost=20000},
		--armor_212_bicep_r = { type=factionRewardType.armor, display="@wearables_name:armor_clonetrooper_b_bicep_r", item="object/tangible/wearables/armor/clone_trooper/armor_clone_trooper_imperial_s01_bicep_r.iff",cost=20000},
		--armor_212_boots = { type=factionRewardType.armor, display="@wearables_name:armor_clonetrooper_b_boots", item="object/tangible/wearables/armor/clone_trooper/armor_clone_trooper_imperial_s01_boots.iff",cost=20000},
		--armor_212_chest_plate = { type=factionRewardType.armor, display="@wearables_name:armor_clonetrooper_b_chest_plate", item="object/tangible/wearables/armor/clone_trooper/armor_clone_trooper_imperial_s01_chest_plate.iff", cost=20000},
		--armor_212_helmet = { type=factionRewardType.armor, display="@wearables_name:armor_clonetrooper_b_helmet", item="object/tangible/wearables/armor/clone_trooper/armor_clone_trooper_imperial_s01_helmet.iff", cost=20000},
		--armor_212_leggings = { type=factionRewardType.armor, display="@wearables_name:armor_clonetrooper_b_leggings", item="object/tangible/wearables/armor/clone_trooper/armor_clone_trooper_imperial_s01_leggings.iff",cost=20000},
		--armor_212_bracer_l = { type=factionRewardType.armor, display="@wearables_name:armor_clonetrooper_b_bracer_l", item="object/tangible/wearables/armor/clone_trooper/armor_clone_trooper_imperial_s01_bracer_l.iff",cost=20000},
		--armor_212_bracer_r = { type=factionRewardType.armor, display="@wearables_name:armor_clonetrooper_b_bracer_r", item="object/tangible/wearables/armor/clone_trooper/armor_clone_trooper_imperial_s01_bracer_r.iff",cost=20000},
		--armor_212_gloves = { type=factionRewardType.armor, display="@wearables_name:armor_clonetrooper_b_gloves", item="object/tangible/wearables/armor/clone_trooper/armor_clone_trooper_imperial_s01_gloves.iff",cost=20000},
		--armor_212_utility_belt = { type=factionRewardType.armor, display="@wearables_name:armor_clonetrooper_b_utility_belt", item="object/tangible/wearables/armor/clone_trooper/armor_clone_trooper_imperial_s01_belt.iff",cost=1400},
		--armor_coruscant_bicep_l = { type=factionRewardType.armor, display="@wearables_name:armor_clonetrooper_r_bicep_l", item="object/tangible/wearables/armor/clone_trooper/armor_clone_trooper_rebel_s01_bicep_l.iff",cost=20000},
		--armor_coruscant_bicep_r = { type=factionRewardType.armor, display="@wearables_name:armor_clonetrooper_r_bicep_r", item="object/tangible/wearables/armor/clone_trooper/armor_clone_trooper_rebel_s01_bicep_r.iff",cost=20000},
		--armor_coruscant_boots = { type=factionRewardType.armor, display="@wearables_name:armor_clonetrooper_r_boots", item="object/tangible/wearables/armor/clone_trooper/armor_clone_trooper_rebel_s01_boots.iff",cost=20000},
		--armor_coruscant_chest_plate = { type=factionRewardType.armor, display="@wearables_name:armor_clonetrooper_r_chest_plate", item="object/tangible/wearables/armor/clone_trooper/armor_clone_trooper_rebel_s01_chest_plate.iff", cost=20000},
		--armor_coruscant_helmet = { type=factionRewardType.armor, display="@wearables_name:armor_clonetrooper_r_helmet", item="object/tangible/wearables/armor/clone_trooper/armor_clone_trooper_rebel_s01_helmet.iff", cost=20000},
		--armor_coruscant_leggings = { type=factionRewardType.armor, display="@wearables_name:armor_clonetrooper_r_leggings", item="object/tangible/wearables/armor/clone_trooper/armor_clone_trooper_rebel_s01_leggings.iff",cost=20000},
		--armor_coruscant_bracer_l = { type=factionRewardType.armor, display="@wearables_name:armor_clonetrooper_r_bracer_l", item="object/tangible/wearables/armor/clone_trooper/armor_clone_trooper_rebel_s01_bracer_l.iff",cost=20000},
		--armor_coruscant_bracer_r = { type=factionRewardType.armor, display="@wearables_name:armor_clonetrooper_r_bracer_r", item="object/tangible/wearables/armor/clone_trooper/armor_clone_trooper_rebel_s01_bracer_r.iff",cost=20000},
		--armor_coruscant_gloves = { type=factionRewardType.armor, display="@wearables_name:armor_clonetrooper_r_gloves", item="object/tangible/wearables/armor/clone_trooper/armor_clone_trooper_rebel_s01_gloves.iff",cost=20000},
		--armor_coruscant_utility_belt = { type=factionRewardType.armor, display="@wearables_name:armor_clonetrooper_r_utility_belt", item="object/tangible/wearables/armor/clone_trooper/armor_clone_trooper_rebel_s01_belt.iff",cost=1400},
		pistol_power5 = { type=factionRewardType.weapon, display="@weapon_name:pistol_power5", item="object/weapon/ranged/pistol/pistol_power5.iff", cost=700},
		carbine_dc15 = { type=factionRewardType.weapon, display="@weapon_name:carbine_dc15", item="object/weapon/ranged/carbine/ep3/carbine_dc15.iff", cost=1050},
		sword_02 = { type=factionRewardType.weapon, display="@weapon_name:sword_02", item="object/weapon/melee/sword/sword_02.iff", cost=600},
		rocket_launcher = { type=factionRewardType.weapon, display="@weapon_name:rocket_launcher", item="object/weapon/ranged/heavy/heavy_rocket_launcher.iff", cost=3500},
		mine_drx = { type=factionRewardType.weapon, display="@weapon_name:mine_drx", item="object/weapon/mine/wp_mine_drx55.iff", cost=350},
		mine_xg = { type=factionRewardType.weapon, display="@weapon_name:mine_xg", item="object/weapon/mine/wp_mine_xg.iff", cost=350},
	},

	uniformList = {
		"boots_s14", "hat_imp_s01", "jacket_s03", "pants_s15",
	},

	uniforms = {
		boots_s14 = { type=factionRewardType.uniform, display="@wearables_name:boots_s14", item="object/tangible/wearables/boots/boots_s14.iff", cost=140 },
		hat_imp_s01 = { type=factionRewardType.uniform, display="@wearables_name:hat_imp_s01", item="object/tangible/wearables/hat/hat_imp_s01.iff", cost=140 },
		jacket_s03 = { type=factionRewardType.uniform, display="@wearables_name:jacket_s03", item="object/tangible/wearables/jacket/jacket_s03.iff", cost=140 },
		pants_s15  = { type=factionRewardType.uniform, display="@wearables_name:pants_s15", item="object/tangible/wearables/pants/pants_s15.iff", cost=140 },
	},

	installationsList = {
		"hq_s01_imperial", "hq_s02_imperial", "hq_s03_imperial", "hq_s04_imperial",
		"covert_detector_32m",
		"minefield_1x1",
	},

	installations = {
		hq_s01_imperial = {type=factionRewardType.installation, display="@deed:hq_s01_imperial", item="object/tangible/deed/faction_perk/hq/hq_s01.iff", generatedObjectTemplate="object/building/faction_perk/hq/hq_s01_imp.iff", cost=7000},
		hq_s02_imperial = {type=factionRewardType.installation, display="@deed:hq_s02_imperial", item="object/tangible/deed/faction_perk/hq/hq_s02.iff", generatedObjectTemplate="object/building/faction_perk/hq/hq_s02_imp.iff", cost=14000},
		hq_s03_imperial = {type=factionRewardType.installation, display="@deed:hq_s03_imperial", item="object/tangible/deed/faction_perk/hq/hq_s03.iff", generatedObjectTemplate="object/building/faction_perk/hq/hq_s03_imp.iff", cost=15750},
		hq_s04_imperial = {type=factionRewardType.installation, display="@deed:hq_s04_imperial", item="object/tangible/deed/faction_perk/hq/hq_s04.iff", generatedObjectTemplate="object/building/faction_perk/hq/hq_s04_imp.iff", cost=21000 },
		covert_detector_32m = { type=factionRewardType.installation, display="@deed:covert_detector_32m", item="object/tangible/deed/faction_perk/covert_detector/detector_32m_deed.iff", generatedObjectTemplate="object/installation/faction_perk/covert_detector/detector_base.iff", cost=3000 },
		minefield_1x1 = { type=factionRewardType.installation, display="@deed:minefield_1x1", item="object/tangible/deed/faction_perk/minefield/field_1x1_deed.iff", generatedObjectTemplate="object/installation/faction_perk/minefield/field_1x1.iff", cost=350 },
	},

	furnitureList = {
		"data_terminal_s1", "data_terminal_s2", "data_terminal_s3", "data_terminal_s4", "frn_table", "tech_armoire", "tech_bookcase", "frn_cabinet", "tech_chair",
		"tech_chest", "frn_coffee_table", "frn_couch", "frn_end_table", "frn_vet_rug_imperial"
	},

	furniture = {
		data_terminal_s1 = { type=factionRewardType.terminal, display="@frn_n:frn_data_terminal", item="object/tangible/furniture/imperial/data_terminal_s1.iff",cost=560},
		data_terminal_s2 = { type=factionRewardType.terminal, display="@frn_n:frn_data_terminal", item="object/tangible/furniture/imperial/data_terminal_s2.iff",cost=700},
		data_terminal_s3 = { type=factionRewardType.terminal, display="@frn_n:frn_data_terminal", item="object/tangible/furniture/imperial/data_terminal_s3.iff",cost=840},
		data_terminal_s4 = { type=factionRewardType.terminal, display="@frn_n:frn_data_terminal", item="object/tangible/furniture/imperial/data_terminal_s4.iff",cost=980},
		frn_table = { type=factionRewardType.furniture, display="@frn_n:frn_table", item="object/tangible/furniture/imperial/table_s1.iff",cost=700},
		tech_armoire = { type=factionRewardType.container, display="@container_name:tech_armoire", item="object/tangible/furniture/technical/armoire_s01.iff", cost=980},
		tech_bookcase = { type=factionRewardType.container, display="@container_name:tech_bookcase", item="object/tangible/furniture/technical/bookcase_s01.iff", cost=980},
		frn_cabinet = { type=factionRewardType.furniture, display="@frn_n:frn_cabinet", item="object/tangible/furniture/technical/cabinet_s01.iff", cost=200},
		tech_chair = { type=factionRewardType.furniture, display="@frn_n:frn_chair", item="object/tangible/furniture/technical/chair_s01.iff", cost=700},
		tech_chest =  { type=factionRewardType.container, display="@container_name:tech_chest", item="object/tangible/furniture/technical/chest_s01.iff", cost=700},
		frn_coffee_table = { type=factionRewardType.furniture, display="@frn_n:frn_coffee_table", item="object/tangible/furniture/technical/coffee_table_s01.iff", cost=700},
		frn_couch = { type=factionRewardType.furniture, display="@frn_n:frn_couch", item="object/tangible/furniture/technical/couch_s01.iff", cost=1050},
		frn_end_table = { type=factionRewardType.furniture, display="@frn_n:frn_end_table", item="object/tangible/furniture/technical/end_table_s01.iff", cost=700},
		frn_vet_rug_imperial = { type=factionRewardType.furniture, display="@frn_n:vet_rug_imperial", item="object/tangible/veteran_reward/frn_vet_rug_imperial.iff", cost=5000},
	},

	hirelingList = {
		"clonetrooper", "clonetrooper_bombardier", "clonetrooper_medic", "swamp_trooper", "clonetrooper_sniper", "clone_commando", "at_xt"
	},

	hirelings = {
		clonetrooper = { type=factionRewardType.hireling, display="@mob/creature_names:clonetrooper", item="object/intangible/pet/pet_control.iff", controlledObjectTemplate="clonetrooper", cost=420},
		clonetrooper_bombardier = { type=factionRewardType.hireling, display="@mob/creature_names:clonetrooper_bombardier", item="object/intangible/pet/pet_control.iff", controlledObjectTemplate="clonetrooper_bombardier", cost=420},
		clonetrooper_medic = { type=factionRewardType.hireling, display="@mob/creature_names:clonetrooper_medic", item="object/intangible/pet/pet_control.iff", controlledObjectTemplate="clonetrooper_medic", cost=420},
		swamp_trooper = { type=factionRewardType.hireling, display="@mob/creature_names:swamp_trooper", item="object/intangible/pet/pet_control.iff", controlledObjectTemplate="swamp_trooper", cost=420},
		clonetrooper_sniper = { type=factionRewardType.hireling, display="@mob/creature_names:clonetrooper_sniper", item="object/intangible/pet/pet_control.iff", controlledObjectTemplate="clonetrooper_sniper", cost=420},
		clone_commando = { type=factionRewardType.hireling, display="@mob/creature_names:clonetrooper_commando", item="object/intangible/pet/pet_control.iff", controlledObjectTemplate="clone_commando", cost=2120},
		at_xt = { type=factionRewardType.hireling, display="@mob/creature_names:at_xt", item="object/intangible/pet/pet_control.iff", controlledObjectTemplate="rep_at_xt_pet", cost=9450},
	},
}
