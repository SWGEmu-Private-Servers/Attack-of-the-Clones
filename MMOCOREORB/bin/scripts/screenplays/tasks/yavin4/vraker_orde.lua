vraker_orde_missions =
	{
		{
			missionType = "assassinate",
			primarySpawns =
			{
				{ npcTemplate = "cis_resistance_separatist", npcName = "Scout Leader" }
			},
			secondarySpawns =
			{
				{ npcTemplate = "cis_battle_droid_scout", npcName = "" },
				{ npcTemplate = "cis_battle_droid_scout", npcName = "" },
				{ npcTemplate = "cis_battle_droid_scout", npcName = "" }
			},
			itemSpawns =
			{
			},
			rewards =
			{
				{ rewardType = "credits", amount = 50 },
				{ rewardType = "faction", faction = "imperial", amount = 15 },
			}
		},
		{
			missionType = "assassinate",
			primarySpawns =
			{
				{ npcTemplate = "rebel_medic", npcName = "Rescue Leader" }
			},
			secondarySpawns =
			{
				{ npcTemplate = "cis_battle_droid_commando", npcName = "" },
				{ npcTemplate = "cis_battle_droid_commando", npcName = "" },
				{ npcTemplate = "cis_battle_droid_commando", npcName = "" }
			},
			itemSpawns =
			{
			},
			rewards =
			{
				{ rewardType = "credits", amount = 75 },
				{ rewardType = "faction", faction = "imperial", amount = 30 },
			}
		},
		{
			missionType = "assassinate",
			primarySpawns =
			{
				{ npcTemplate = "cis_magnaguard", npcName = "Base Leader" }
			},
			secondarySpawns =
			{
				{ npcTemplate = "cis_surface_marshall", npcName = "" },
				{ npcTemplate = "cis_battle_droid_commando", npcName = "" },
				{ npcTemplate = "cis_battle_droid_commando", npcName = "" },
				{ npcTemplate = "cis_battle_droid_commando", npcName = "" }
			},
			itemSpawns =
			{
			},
			rewards =
			{
				{ rewardType = "credits", amount = 100 },
				{ rewardType = "faction", faction = "imperial", amount = 45 },
			}
		}
	}

npcMapVrakerOrde =
	{
		{
			spawnData = { npcTemplate = "vraker_orde", x = 4050.5, z = 37.0, y = -6256.1, direction = 49, cellID = 0, position = STAND },
			npcNumber = 1,
			stfFile = "@static_npc/yavin/yavin_imperialgarrison_vraker_orde",
			missions = vraker_orde_missions
		},
	}

VrakerOrde = ThemeParkLogic:new {
	npcMap = npcMapVrakerOrde,
	className = "VrakerOrde",
	screenPlayState = "vraker_orde_tasks",
	planetName = "yavin4",
	distance = 900,
	faction = FACTIONIMPERIAL
}

registerScreenPlay("VrakerOrde", true)

vraker_orde_mission_giver_conv_handler = mission_giver_conv_handler:new {
	themePark = VrakerOrde
}
vraker_orde_mission_target_conv_handler = mission_target_conv_handler:new {
	themePark = VrakerOrde
}
