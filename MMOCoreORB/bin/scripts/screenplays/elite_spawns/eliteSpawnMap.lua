eliteSpawnMap = {
	{
		planet = "endor", mobile = "gorax", respawnTime = 90,
		spawnArea = {
			{x = 5050, y = 4678, radius = 2500},
		},
		mechanics = {
			mechanic = "patrolling",
			--spawnAdds = true, addsToSpawn = 1, addMobile = "minor_gorax",
		},
	},
	{
		planet = "endor", mobile = "elite_mandalorian_supercommando", respawnTime = 120,
		spawnArea = {
			{x = 5050, y = 4678, radius = 3000}, --Temporary
		},
		mechanics = {
			mechanic = "patrolling",
			--spawnAdds = true, addsToSpawn = 1, addMobile = "minor_gorax",
		},
	},
	{
		planet = "dathomir", mobile = "elite_nightbrother_elder", respawnTime = 120,
		spawnArea = {
			{x = 2520, y = -6000, radius = 4000},
		},
		mechanics = {
			mechanic = "patrolling",
			--spawnAdds = true, addsToSpawn = 1, addMobile = "minor_gorax",
		},
	},
	{
		planet = "dathomir", mobile = "singing_mountain_clan_councilwoman", respawnTime = 90,
		spawnArea = {
			{x = -4020, y = -6000, radius = 4000},
		},
		mechanics = {
			mechanic = "patrolling",
			--spawnAdds = true, addsToSpawn = 1, addMobile = "minor_gorax",
		},
	},
	{
		planet = "yavin4", mobile = "poison_acklay", respawnTime = 120,
		spawnArea = {
			{x = -10, y = -6000, radius = 4000},
		},
		mechanics = {
			mechanic = "patrolling",
			--spawnAdds = true, addsToSpawn = 1, addMobile = "minor_gorax",
		},
	},
	{
		planet = "yavin4", mobile = "poison_acklay", respawnTime = 120,
		spawnArea = {
			{x = 2500, y = -1000, radius = 4000},
		},
		mechanics = {
			mechanic = "patrolling",
			--spawnAdds = true, addsToSpawn = 1, addMobile = "minor_gorax",
		},
	},
	{
		planet = "tatooine", mobile = "tusken_executioner", respawnTime = 90,
		spawnArea = {
			{x = 500, y = -1000, radius = 4000},
		},
		mechanics = {
			mechanic = "patrolling",
			--spawnAdds = true, addsToSpawn = 1, addMobile = "minor_gorax",
		},
	},
	{
		planet = "tatooine", mobile = "tusken_executioner", respawnTime = 120,
		spawnArea = {
			{x = 2500, y = 2500, radius = 4000},
		},
		mechanics = {
			mechanic = "patrolling",
			--spawnAdds = true, addsToSpawn = 1, addMobile = "minor_gorax",
		},
	},
	{
		planet = "tatooine", mobile = "krayt_dragon_ancient", respawnTime = 90,
		spawnArea = {
			{x = 500, y = -1000, radius = 1000},
		},
		mechanics = {
			mechanic = "patrolling",
			--spawnAdds = true, addsToSpawn = 1, addMobile = "minor_gorax",
		},
	},
	{
		planet = "lok", mobile = "nym_elder_bunker", respawnTime = 90,
		spawnArea = {
			{x = 100, y = 2700, radius = 3000},
		},
		mechanics = {
			mechanic = "patrolling",
			--spawnAdds = true, addsToSpawn = 1, addMobile = "minor_gorax",
		},
	},
	{
		planet = "dantooine", mobile = "elite_mandalorian_supercommando", respawnTime = 120,
		spawnArea = {
			{x = 5050, y = 4678, radius = 1500}, --Temporary
		},
		mechanics = {
			mechanic = "patrolling",
			--spawnAdds = true, addsToSpawn = 1, addMobile = "minor_gorax",
		},
	},
	{
		planet = "naboo", mobile = "elite_mandalorian_supercommando", respawnTime = 90,
		spawnArea = {
			{x = -5075, y = 0, radius = 3500}, --Temporary
		},
		mechanics = {
			mechanic = "patrolling",
			--spawnAdds = true, addsToSpawn = 1, addMobile = "minor_gorax",
		},
	},
	{
		planet = "dathomir", mobile = "nightsister_elder", respawnTime = 90,
		idleWander = false,
		spawnArea = {
			{x = 5050, y = 4678, radius = 2500},
		},
		mechanics = {
			mechanic = "addWaves",
			numberOfWaves = 3, addsPerWave = 2, addMobile = "nightsister_protector",
			spawnAdds = true, addsToSpawn = 3, initialAddMobile = "nightsister_stalker",
		},
	},
	{
		planet = "dantooine", mobile = "dark_jedi_master", respawnTime = 90,
		spawnArea = {
			{x = 5050, y = 4678, radius = 1500},
		},
		spawnTheater = true,
		flattenLayer = true,
		theater = {
			{ template = "object/static/structure/dathomir/mtn_clan_hut_s01.iff", xDiff = 0.896, zDiff = 0.236, yDiff = -0.272, heading = 0 },
			{ template = "object/static/structure/general/camp_campfire_logs_smoldering_s01.iff", xDiff = 0.0886, zDiff = 0.008, yDiff = 0.682, heading = -16.464 },
			{ template = "object/static/structure/general/prp_junk_s8.iff", xDiff = 0.513, zDiff = 0.247, yDiff = -2.335, heading = 0 },
			{ template = "object/static/structure/general/camp_stool_short_s01.iff", xDiff = 0.400, zDiff = -0.040, yDiff = 1.733, heading = 0 },
			{ template = "object/static/structure/general/camp_stool_short_s01.iff", xDiff = -1.521, zDiff = -0.209, yDiff = 0.653, heading = 0 },
			{ template = "object/static/structure/general/camp_stool_short_s01.iff", xDiff = -0.376, zDiff = -0.242, yDiff = -0.460, heading = 0 },
		},
		spawnAdds = true,
		adds = {
			{ template = "dark_adept", xDiff = 1, yDiff = -0.272, heading = 0, idleWander = false },
		},
		awardBadge = false, badgeToAward = BDG_RACING_AGRILAT_SWAMP,
	},
}
