raxa_binn_missions =
	{
		{
			missionType = "assassinate",
			primarySpawns =
			{
				{ npcTemplate = "clonetrooper_captain", npcName = "" }
			},
			secondarySpawns = {
				{ npcTemplate = "clonetrooper", npcName = "" },
				{ npcTemplate = "clonetrooper", npcName = "" },
				{ npcTemplate = "clonetrooper", npcName = "" }
			},
			itemSpawns = {},
			rewards =
			{
				{ rewardType = "credits", amount = 1000 },
				{ rewardType = "faction", faction = "rebel", amount = 200 },
			}
		},
		{
			missionType = "escort",
			primarySpawns =
			{
				{ npcTemplate = "raxa_rebel_scout", npcName = "Separatist Scout" }
			},
			secondarySpawns = {
				{ npcTemplate = "clone_commando", npcName = "" },
				{ npcTemplate = "clone_commando", npcName = "" }
			},
			itemSpawns = {},
			rewards =
			{
				{ rewardType = "credits", amount = 1000 },
				{ rewardType = "faction", faction = "rebel", amount = 200 },
			}
		},
		{
			missionType = "assassinate",
			primarySpawns =
			{
				{ npcTemplate = "clonetrooper_captain", npcName = "" }
			},
			secondarySpawns = {
				{ npcTemplate = "clone_commando", npcName = "" },
				{ npcTemplate = "clone_commando", npcName = "" },
				{ npcTemplate = "clone_commando", npcName = "" },
				{ npcTemplate = "clone_commando", npcName = "" },
				{ npcTemplate = "clone_commando", npcName = "" },
				{ npcTemplate = "clone_commando", npcName = "" }
			},
			itemSpawns = {},
			rewards =
			{
				{ rewardType = "credits", amount = 2000 },
				{ rewardType = "faction", faction = "rebel", amount = 300 },
			}
		},
	}

npcMapRaxaBinn =
	{
		{
			spawnData = { npcTemplate = "raxa_binn", x = -4.0, z = 0.1, y = -4.2, direction = 140, cellID = 4505669, position = SIT },
			worldPosition = { x = 3643, y = -6465 },
			npcNumber = 1,
			stfFile = "@static_npc/rori/rori_rebeloutpost_raxa_binn",
			missions = raxa_binn_missions
		},

	}

RaxaBinn = ThemeParkLogic:new {
	npcMap = npcMapRaxaBinn,
	className = "RaxaBinn",
	screenPlayState = "raxa_binn_quest",
	planetName = "rori",
	distance = 400,
	faction = FACTIONREBEL
}

registerScreenPlay("RaxaBinn", true)

raxa_binn_mission_giver_conv_handler = mission_giver_conv_handler:new {
	themePark = RaxaBinn
}
raxa_binn_mission_target_conv_handler = mission_target_conv_handler:new {
	themePark = RaxaBinn
}
