--Automatically generated by SWGEmu Spawn Tool v0.12 loot editor.

armor_battle_leggings = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "Kamino Assault Leggings",
	directObjectTemplate = "object/tangible/wearables/armor/sep_battle_theme/armor_sep_theme_leggings.iff",
	craftingValues = {
		{"armor_rating",1,1,0},
					{"armor_effectiveness",30,30,0},
					{"energyeffectiveness",5,5,0},
					{"kineticeffectiveness",10,10,0},
					{"blasteffectiveness",5,5,0},
	        {"armor_integrity",45000,45000,0},
	        {"armor_health_encumbrance",175,175,0},
	        {"armor_action_encumbrance",300,300,0},
	        {"armor_mind_encumbrance",175,175,0},
	},
	customizationStringNames = {},
	customizationValues = {},
	skillMods = {{"dizzy_defense", 5}, {"melee_defense", 3}}
}

addLootItemTemplate("armor_battle_leggings", armor_battle_leggings)