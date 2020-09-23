boss_nass_missions =
	{
		{
			missionType = "deliver",
			primarySpawns =
			{
				{ npcTemplate = "pol_revver", npcName = "Pol Revver" }
			},
			secondarySpawns =
			{
				{ npcTemplate = "cis_battle_droid", npcName = "" },
				{ npcTemplate = "cis_battle_droid", npcName = "" },
			},
			itemSpawns =
			{
				{ itemTemplate = "object/tangible/mission/quest_item/nass_q1_needed.iff", itemName = "Datadisc" }
			},
			rewards =
			{
				{ rewardType = "credits", amount = 5000 },
			}
		},
		{
			missionType = "escort",
			primarySpawns =
			{
				{ npcTemplate = "jaanie", npcName = "Jaanie" }
			},
			secondarySpawns = {},
			itemSpawns = {},
			rewards =
			{
				{ rewardType = "credits", amount = 15000 },
			}
		},
		{
			missionType = "escort",
			primarySpawns =
			{
				{ npcTemplate = "fassa", npcName = "Fassa" }
			},
			secondarySpawns =
			{
				{ npcTemplate = "cis_battle_droid", npcName = "" },
				{ npcTemplate = "cis_battle_droid", npcName = "" },
			},
			itemSpawns = {},
			rewards =
			{
				{ rewardType = "credits", amount = 25000 },
			}
		},
		{
			missionType = "assassinate",
			primarySpawns =
			{
				{ npcTemplate = "cis_battle_droid_squad_leader", npcName = "" }
			},
			secondarySpawns =
			{
				{ npcTemplate = "cis_battle_droid", npcName = "" },
				{ npcTemplate = "cis_battle_droid", npcName = "" },
				{ npcTemplate = "cis_battle_droid", npcName = "" },
				{ npcTemplate = "cis_battle_droid", npcName = "" },
				{ npcTemplate = "cis_battle_droid", npcName = "" }
			},
			itemSpawns = {},
			rewards =
			{
				{ rewardType = "credits", amount = 50000 },
			}
		},
	}

npcMapBossNass =
	{
		{
			spawnData = { npcTemplate = "boss_nass", x = -1991, z = 5.3, y = -5422, direction = -114, cellID = 0, position = STAND },
			worldPosition = { x = -1991, y = -5422 },
			npcNumber = 1,
			stfFile = "@static_npc/naboo/boss_nass",
			missions = boss_nass_missions
		}
	}

BossNass = ThemeParkLogic:new {
	npcMap = npcMapBossNass,
	className = "BossNass",
	screenPlayState = "boss_nass_quest",
	planetName = "naboo",
	distance = 1000,
	faction = FACTIONIMPERIAL
}

registerScreenPlay("BossNass", true)

boss_nass_mission_giver_conv_handler = mission_giver_conv_handler:new {
	themePark = BossNass
}
boss_nass_mission_target_conv_handler = mission_target_conv_handler:new {
	themePark = BossNass
}
