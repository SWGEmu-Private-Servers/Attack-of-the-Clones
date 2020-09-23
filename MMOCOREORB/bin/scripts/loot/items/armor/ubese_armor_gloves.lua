ubese_armor_gloves = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "Ubese Armor Gloves",
	directObjectTemplate = "object/tangible/wearables/armor/ubese/armor_ubese_gloves.iff",
	craftingValues = {
		{"armor_rating",1,1,0},
		{"kineticeffectiveness",10,28,10},
		{"armor_effectiveness",4,20,10},
		{"armor_integrity",15000, 25000,0},
		{"armor_health_encumbrance",300,250,0},
		{"armor_action_encumbrance",300,250,0},
		{"armor_mind_encumbrance",300,250,0},
	},
	skillMods = {

	},
	--no color pallets for customizing for ubese armor gloves
	customizationStringNames = {},
	customizationValues = {},

	junkDealerTypeNeeded = JUNKGENERIC,
	junkMinValue = 45,
	junkMaxValue = 90
}

addLootItemTemplate("ubese_armor_gloves", ubese_armor_gloves)
