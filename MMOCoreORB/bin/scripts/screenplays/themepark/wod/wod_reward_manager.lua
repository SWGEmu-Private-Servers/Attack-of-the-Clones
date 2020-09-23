wodPrologueRewardManager = {
	herbs = {
		credits = 2000,
		extraCredits = 100,
		rewardOnce = false, --Award reward only once. Default setting: false
		rewardInterval = 1, --Set how often rewards are granted. Reward is always granted on first completion. Default setting: 1
		rewardType = "all", --Set reward type, "all", "random", "pick"
		reward = {
			"object/tangible/furniture/all/wod_pro_seed_jar.iff",
		},
		collectionRewardOnce = false, --Award reward only once. Default setting: false
		collectionCount = 1,--Prod Setting: 5
		collectionRewardType = "random", --Set collection reward type, "all", "random", "pick"
		collectionRewardSM = {
			"object/tangible/furniture/all/wod_pro_sm_seed_jar_01.iff",
			"object/tangible/furniture/all/wod_pro_sm_seed_jar_02.iff",
			"object/tangible/furniture/all/wod_pro_sm_seed_jar_03.iff",
			"object/tangible/furniture/all/wod_pro_sm_seed_jar_04.iff",
			"object/tangible/furniture/all/wod_pro_sm_seed_jar_05.iff",
			"object/tangible/furniture/all/wod_pro_sm_seed_jar_06.iff",
			"object/tangible/furniture/all/wod_pro_sm_seed_jar_07.iff",
			"object/tangible/furniture/all/wod_pro_sm_seed_jar_08.iff",
		},
		collectionRewardNS = {
			"object/tangible/furniture/all/wod_pro_ns_seed_jar_01.iff",
			"object/tangible/furniture/all/wod_pro_ns_seed_jar_02.iff",
			"object/tangible/furniture/all/wod_pro_ns_seed_jar_03.iff",
			"object/tangible/furniture/all/wod_pro_ns_seed_jar_04.iff",
			"object/tangible/furniture/all/wod_pro_ns_seed_jar_05.iff",
			"object/tangible/furniture/all/wod_pro_ns_seed_jar_06.iff",
			"object/tangible/furniture/all/wod_pro_ns_seed_jar_07.iff",
			"object/tangible/furniture/all/wod_pro_ns_seed_jar_08.iff",
		}
	},
	
	enemiesRancor = {
		rewardOnce = false, --Award reward only once. Default setting: false
		rewardInterval = 1, --Set how often rewards (every x completions) are granted. Reward is always granted on first completion. Default setting: 1
		rewardType = "pick",
		reward = { -- Players pick a reward from the list below.
			{"object/tangible/veteran_reward/frn_reptilian_flyer_toy.iff", "Miniature Reptilian Flyer"},
			{"object/tangible/veteran_reward/frn_shear_mite_toy.iff", "Miniature Shear Mite"},
			{"object/tangible/veteran_reward/frn_malkloc_toy.iff", "Miniature Malkloc"},
		},
		collectionRewardOnce = false,
		collectionCount = 1,--Prod Setting: 5
		collectionRewardType = "all",
		collectionReward = {
			"object/tangible/veteran_reward/frn_mutated_rancor_toy.iff",
		}
	},
	
	enemiesSpiderclan = {
		rewardOnce = false,
		rewardInterval = 1,
		rewardType = "pick",
		reward = {
			{"object/tangible/veteran_reward/frn_reptilian_flyer_toy.iff", "Miniature Reptilian Flyer"},
			{"object/tangible/veteran_reward/frn_shear_mite_toy.iff", "Miniature Shear Mite"},
			{"object/tangible/veteran_reward/frn_malkloc_toy.iff", "Miniature Malkloc"},
		},
		collectionRewardOnce = false,
		collectionCount = 1,--Prod Setting: 5
		collectionRewardType = "all",
		collectionReward = {
			"object/tangible/veteran_reward/frn_gaping_spider_toy.iff",
		}
	},
	
	wisdom = {
		rewardOnce = false,
		rewardInterval = 1,
		rewardType = "pick",
		reward = {
			{"object/tangible/painting/painting_wod_scene_01.iff", "Dathomir Forest Scenery"},
			{"object/tangible/painting/painting_wod_scene_02.iff", "Dathomir Plains Scenery"},
			{"object/tangible/painting/painting_wod_scene_03.iff", "Dathomirian Portal"},
			{"object/tangible/painting/painting_wod_scene_04.iff", "Dathomir Mountain Scenery"},
		},
		collectionRewardOnce = false,
		collectionCount = 1,--Prod Setting: 5
		collectionRewardType = "all",
		collectionRewardSM = {
			"object/tangible/painting/painting_wod_sm_02.iff",
		},
		collectionRewardNS = {
			"object/tangible/painting/painting_wod_ns_02.iff",
		}
	},
}

wodRewardManager = {
	herbs = {
		extraCredits = 100,
		rewardOnce = false, --Award reward only once. Default setting: false
		rewardInterval = 1, --Set how often rewards are granted. Reward is always granted on first completion. Default setting: 1
		rewardType = "all", --Set reward type, "all", "random", "pick"
		reward = {
			"object/tangible/furniture/all/wod_seed_jar.iff",
			"object/tangible/furniture/all/wod_seed_jar.iff",
		},
		rewardRandomValuable = 2, --Set how many random valuables (tokens) should be rewarded.
		collectionRewardOnce = false,
		collectionCount = 1,--Prod Setting: 5
		collectionRewardType = "all",
		collectionRewardNS = {
			"object/tangible/furniture/all/wod_ns_seed_jar.iff",
		},
		collectionRewardSM = {
			"object/tangible/furniture/all/wod_sm_seed_jar.iff",
		},
	},
	
	enemiesOtherclan = {
		rewardOnce = false,
		rewardInterval = 1,
		rewardType = "pick",
		tokenCount = 3, --Set the amount of tokens rewarded
		reward = { -- Players pick a reward from the list below.
			{"object/tangible/content/wod_token_1.iff", "Dathomir Amber"},
			{"object/tangible/content/wod_token_2.iff", "Spider Silk"},
			{"object/tangible/content/wod_token_3.iff", "Rancor Teeth"},
			{"object/tangible/content/wod_token_4.iff", "Whuffa Leather"},
			{"object/tangible/content/wod_token_5.iff", "Rare Dried Herbs"},
		},
		collectionRewardOnce = true,
		collectionCount = 1,--Prod Setting: 7
		collectionNSBadgeToAward = 162,
		collectionSMBadgeToAward = 155,
	},
	
	enemiesSpiderclan = {
		rewardOnce = false,
		rewardInterval = 1,
		rewardType = "pick",
		tokenCount = 3,
		reward = { 
			{"object/tangible/content/wod_token_1.iff", "Dathomir Amber"},
			{"object/tangible/content/wod_token_2.iff", "Spider Silk"},
			{"object/tangible/content/wod_token_3.iff", "Rancor Teeth"},
			{"object/tangible/content/wod_token_4.iff", "Whuffa Leather"},
			{"object/tangible/content/wod_token_5.iff", "Rare Dried Herbs"},
		},
		collectionRewardOnce = true,
		collectionCount = 1,--Prod Setting: 7
		collectionNSBadgeToAward = 163,
		collectionSMBadgeToAward = 156,
	},
	
	hunting = {
		rewardOnce = false,
		rewardInterval = 1,
		rewardType = "all",
		reward = {
			"object/tangible/content/wod_token_4.iff",
		},
		rewardRandomValuable = 1,
		collectionRewardOnce = true,
		collectionCount = 1,--Prod Setting: 7
		collectionNSBadgeToAward = 165,
		collectionSMBadgeToAward = 158,
	},

	fishing = {
		rewardOnce = false,
		rewardInterval = 1,
		rewardType = "pick",
		tokenCount = 3,
		reward = { 
			{"object/tangible/content/wod_token_1.iff", "Dathomir Amber"},
			{"object/tangible/content/wod_token_2.iff", "Spider Silk"},
			{"object/tangible/content/wod_token_3.iff", "Rancor Teeth"},
			{"object/tangible/content/wod_token_4.iff", "Whuffa Leather"},
			{"object/tangible/content/wod_token_5.iff", "Rare Dried Herbs"},
		},
		collectionRewardOnce = true,
		collectionCount = 1,--Prod Setting: 7
		collectionNSBadgeToAward = 166,
		collectionSMBadgeToAward = 159,
	},
	
	rancorTamer = {
		rewardOnce = false,
		rewardInterval = 1,
		rewardType = "all",
		tokenCount = 2,
		reward = { 
			"object/tangible/content/wod_token_1.iff",
			"object/tangible/content/wod_token_2.iff",
		},
		rewardRandomValuable = 2,
		collectionRewardOnce = true,
		collectionCount = 1,--Prod Setting: 7
		collectionNSBadgeToAward = 167,
		collectionSMBadgeToAward = 160,
	},
	
	repairAltar1 = {
		rewardType = "all",
		tokenCount = 4,
		reward = { 
			"object/tangible/content/wod_token_4.iff",
		},
		rewardRandomValuable = 2,
	},
	
	repairAltar2 = {
		rewardType = "all",
		tokenCount = 4,
		reward = { 
			"object/tangible/content/wod_token_4.iff",
		},
		rewardRandomValuable = 2,
	},
	
	repairAltar3 = {
		rewardType = "all",
		tokenCount = 4,
		reward = { 
			"object/tangible/content/wod_token_2.iff",
		},
		rewardRandomValuable = 2,
	},
	
	repairAltar4 = {
		rewardType = "all",
		tokenCount = 4,
		reward = { 
			"object/tangible/content/wod_token_2.iff",
			"object/tangible/theme_park/wod/wod_crafting_template.iff",
		},
		rewardRandomValuable = 2,
	},
	
	firstSister = {
		rewardType = "all",
		tokenCount = 4,
		reward = { 
			"object/tangible/content/wod_token_1.iff",
		},
		rewardRandomValuable = 4,
	},
	
	secondSister = {
		rewardType = "all",
		tokenCount = 4,
		reward = { 
			"object/tangible/content/wod_token_1.iff",
		},
		rewardRandomValuable = 4,
	},
	
	thirdSister = {
		rewardType = "all",
		tokenCount = 6,
		reward = { 
			"object/tangible/content/wod_token_1.iff",
			"object/tangible/furniture/decorative/wod_deco_mask.iff",
		},
		rewardRandomValuable = 4,
	},
	
	ghostReward = {
		rewardType = "all",
		tokenCount = 3,
		reward = { 
			"object/tangible/content/wod_token_1.iff",
		},
		rewardRandomValuable = 3,
	},
	
	wholeTruth1 = {
		rewardType = "all",
		tokenCount = 4,
		reward = { 
			"object/tangible/content/wod_token_3.iff",
		},
		rewardRandomValuable = 4,
	},
	
	wholeTruth2 = {
		rewardType = "all",
		tokenCount = 4,
		reward = { 
			"object/tangible/content/wod_token_3.iff",
		},
		rewardRandomValuable = 4,
	},
	
	greaterGood = {
		credits = 4000,
		rewardType = "all",
		tokenCount = 6,
		reward = { 
			"object/tangible/content/wod_token_3.iff",
		},
		rewardRandomValuable = 3,
	},
	
	lostE01 = {
		rewardType = "all",
		tokenCount = 2,
		reward = { 
			"object/tangible/content/wod_token_2.iff",
		},
		rewardRandomValuable = 2,
	},
	
	lostE02 = {
		rewardType = "all",
		tokenCount = 3,
		reward = { 
			"object/tangible/content/wod_token_2.iff",
		},
		rewardRandomValuable = 3,
	},
	
	ehs = {
		rewardType = "all",
		tokenCount = 3,
		reward = { 
			"object/tangible/content/wod_token_2.iff",
		},
		rewardRandomValuable = 3,
	},
	
	huntingParty = {
		credits = 4000,
		rewardType = "all",
		tokenCount = 6,
		reward = { 
			"object/tangible/content/wod_token_2.iff",
		},
		rewardRandomValuable = 3,
	},
	
	leftBehind = {
		rewardType = "all",
		tokenCount = 3,
		reward = { 
			"object/tangible/content/wod_token_4.iff",
			"object/tangible/painting/painting_wod_outcast.iff",
		},
		rewardRandomValuable = 3,
	},
}
