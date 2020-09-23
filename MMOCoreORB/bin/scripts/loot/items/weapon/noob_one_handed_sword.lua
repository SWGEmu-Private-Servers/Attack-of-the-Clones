noob_one_handed_sword = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "Blunted Sword",
	directObjectTemplate = "object/weapon/melee/sword/sword_01.iff",
	craftingValues = {
		{"mindamage",50,62,0},
		{"maxdamage",63,150,0},
		{"attackspeed",3.5,1.9,1},
		{"woundchance",9,18,0},
		{"hitpoints",250,400,0},
		{"zerorangemod",5,15,0},
		{"maxrangemod",5,15,0},
		{"midrange",3,3,0},
		{"midrangemod",5,15,0},
		{"maxrange",4,4,0},
		{"attackhealthcost",60,35,0},
		{"attackactioncost",60,25,0},
		{"attackmindcost",35,20,0},
	},
	customizationStringNames = {},
	customizationValues = {},

	-- randomDotChance: The chance of this weapon object dropping with a random dot on it. Higher number means less chance. Set to 0 to always have a random dot.
	randomDotChance = 1000,
	junkDealerTypeNeeded = JUNKARMS,
	junkMinValue = 500,
	junkMaxValue = 900

}

addLootItemTemplate("noob_one_handed_sword", noob_one_handed_sword)
