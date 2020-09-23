drakka_judarrl_missions =
{
	{
		missionType = "assassinate",
		primarySpawns =
		{
			{ npcTemplate = "cis_battle_droid_squad_leader", npcName = "" }
		},
		secondarySpawns =
		{
				{ npcTemplate = "cis_battle_droid", npcName = "" },
				{ npcTemplate = "cis_battle_droid", npcName = "" }
		},
		itemSpawns = {},
		rewards =
		{
			{ rewardType = "credits", amount = 5000 },
			{ rewardType = "faction", faction = "imperial", amount = 150 },
		}
	},
	{
		missionType = "escort",
		primarySpawns =
		{
			{ npcTemplate = "aroho_preni", npcName = "Aroho Preni (a Dantari Raider)" }
		},
		secondarySpawns =
		{
				{ npcTemplate = "cis_battle_droid_commando", npcName = "" },
				{ npcTemplate = "cis_battle_droid_commando", npcName = "" },
				{ npcTemplate = "cis_battle_droid_commando", npcName = "" },
				{ npcTemplate = "cis_battle_droid_commando", npcName = "" }
		},
		itemSpawns = {},
		rewards =
		{
			{ rewardType = "credits", amount = 6500 },
			{ rewardType = "faction", faction = "rebel", amount = 150 },
		}
	},
	{
		missionType = "assassinate",
		primarySpawns =
		{
			{ npcTemplate = "force_crystal_hunter", npcName = "Deelomae Raede (a force crystal hunter)" }
		},
		secondarySpawns =
		{
				{ npcTemplate = "dark_side_savage", npcName = "random" },
				{ npcTemplate = "dark_side_savage", npcName = "random" },
				{ npcTemplate = "dark_side_savage", npcName = "random" }
		},
		itemSpawns = {},
		rewards =
		{
			{ rewardType = "faction", faction = "imperial", amount = 2000 },
			{ rewardType = "loot", lootGroup = "task_reward_drakka_judarrl" },
		}
	}
}

npcMapDrakkaJudarrl =
{
	{
		spawnData = { npcTemplate = "drakka_judarrl", x = 73.1, z = -46, y = -141, direction = 97, cellID = 8535548, position = STAND },
		worldPosition = { x = 4221.2, y = 4959.3 },
		npcNumber = 1,
		stfFile = "@static_npc/dantooine/dantooine_remotehaven_drakka_judarrl",
		missions = drakka_judarrl_missions
	},
}

DrakkaJudarrl = ThemeParkLogic:new {
	npcMap = npcMapDrakkaJudarrl,
	className = "DrakkaJudarrl",
	screenPlayState = "drakka_judarrl_quest",
	planetName = "dantooine",
	distance = 1000,
	faction = FACTIONIMPERIAL
}

registerScreenPlay("DrakkaJudarrl", true)

drakka_judarrl_mission_giver_conv_handler = mission_giver_conv_handler:new {
	themePark = DrakkaJudarrl
}
drakka_judarrl_mission_target_conv_handler = mission_target_conv_handler:new {
	themePark = DrakkaJudarrl
}
