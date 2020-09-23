pooja_naberrie_missions =
	{
		{
			missionType = "escort",
			primarySpawns =
			{
				{ npcTemplate = "gizda_ramani", npcName = "Gizda Ramani" }
			},
			secondarySpawns =
			{
				{ npcTemplate = "imperial_trooper", npcName = "" },
				{ npcTemplate = "imperial_trooper", npcName = "" },
			},
			itemSpawns = {
				 { itemTemplate = "object/tangible/mission/quest_item/pooja_naberrie_q1_needed.iff", itemName = "" }
			},
			rewards =
			{
				{ rewardType = "credits", amount = 2500 },
			}
		},
		{
			missionType = "escort",
			primarySpawns =
			{
				{ npcTemplate = "herosk_balfar", npcName = "Herosk Bal'far" }
			},
			secondarySpawns =
			{
				{ npcTemplate = "imperial_sharpshooter", npcName = ""},
				{ npcTemplate = "imperial_sharpshooter", npcName = ""},
			},
			itemSpawns = {},
			rewards =
			{
				{ rewardType = "credits", amount = 5000 },
			}
		},
		{
			missionType = "deliver",
			primarySpawns =
			{
				{ npcTemplate = "jumis", npcName = "Jumis" }
			},
			secondarySpawns =
			{
				{ npcTemplate = "stormtrooper", npcName = "" },
				{ npcTemplate = "imperial_trooper", npcName = "" },
				{ npcTemplate = "stormtrooper", npcName = "" },
				{ npcTemplate = "imperial_trooper", npcName = "" },
			},
			itemSpawns = {
				{ itemTemplate = "object/tangible/mission/quest_item/pooja_naberrie_q2_needed.iff", itemName=""}
			},
			rewards =
			{
				{ rewardType = "credits", amount = 7500 },
			}
		},
		{
			missionType = "escort",
			primarySpawns =
			{
				{ npcTemplate = "turon_idala", npcName = "Turon Adala" }
			},
			secondarySpawns =
			{
				{ npcTemplate = "stormtrooper", npcName = "" },
				{ npcTemplate = "stormtrooper", npcName = "" },
				{ npcTemplate = "stormtrooper", npcName = "" },
				{ npcTemplate = "stormtrooper", npcName = "" },
			},
			itemSpawns = {},
			rewards =
			{
				{ rewardType = "credits", amount = 10000 },
			}
		},
		{
			missionType = "escort",
			primarySpawns =
			{
				{ npcTemplate = "lim_paddu", npcName = "Lim Paddu" }
			},
			secondarySpawns =
			{
				{ npcTemplate = "imperial_staff_corporal", npcName = "" },
				{ npcTemplate = "stormtrooper", npcName = "" },
				{ npcTemplate = "stormtrooper", npcName = "" },
				{ npcTemplate = "stormtrooper", npcName = "" },
			},
			itemSpawns = {},
			rewards =
			{
				{ rewardType = "credits", amount = 12500 },
			}
		},
		{
			missionType = "assassinate",
			primarySpawns =
			{
				{ npcTemplate = "melloc_fitzal", npcName = "Melloc Fitzal" }
			},
			secondarySpawns =
			{
				{ npcTemplate = "storm_commando", npcName = "" },
				{ npcTemplate = "storm_commando", npcName = "" },
				{ npcTemplate = "storm_commando", npcName = "" },
				{ npcTemplate = "storm_commando", npcName = "" },

			},
			itemSpawns = {	},
			rewards =
			{
				{ rewardType = "credits", amount = 15000 },
			}
		},
	}

npcMapPoojaNaberrie =
	{
		{  spawnData = { npcTemplate = "pooja_naberrie", x = 4975, z = 360, y = -1584, direction = -178, cellID = 0, position = STAND },
			npcNumber = 1,
			stfFile = "@static_npc/naboo/pooja_naberrie",
			missions = pooja_naberrie_missions
		}
	}

PoojaNaberrie = ThemeParkLogic:new {
	npcMap = npcMapPoojaNaberrie,
	className = "PoojaNaberrie",
	screenPlayState = "pooja_naberrie_quest",
	planetName = "naboo",
	distance = 650,
	faction = FACTIONREBEL,
}

registerScreenPlay("PoojaNaberrie", false)

pooja_naberrie_mission_giver_conv_handler = mission_giver_conv_handler:new {
	themePark = PoojaNaberrie
}
pooja_naberrie_mission_target_conv_handler = mission_target_conv_handler:new {
	themePark = PoojaNaberrie
}
