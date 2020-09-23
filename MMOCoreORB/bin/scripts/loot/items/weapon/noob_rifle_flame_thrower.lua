noob_rifle_flame_thrower = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "Makeshift Flamethrower",
	directObjectTemplate = "object/weapon/ranged/rifle/rifle_flame_thrower.iff",
	craftingValues = {
		{"mindamage",24,180,0},
		{"maxdamage",181,325,0},
		{"attackspeed",4.9,1.9,1},
		{"woundchance",8.0,16.0,0},
		{"hitpoints",125,300,0},
		{"zerorangemod",20,30,0},
		{"maxrangemod",-65,-35,0},
		{"midrange",50,50,0},
		{"midrangemod",20,30,0},
		{"maxrange",64,64,0},
		{"attackhealthcost",124,70,0},
		{"attackactioncost",60,40,0},
		{"attackmindcost",60,40,0},
	},
	customizationStringNames = {},
	customizationValues = {},

	-- randomDotChance: The chance of this weapon object dropping with a random dot on it. Higher number means less chance. Set to 0 to always have a random dot.
	randomDotChance = 1000,
	junkDealerTypeNeeded = JUNKARMS,
	junkMinValue = 600,
	junkMaxValue = 960

}

addLootItemTemplate("noob_rifle_flame_thrower", noob_rifle_flame_thrower)
