NightbrotherScreenPlay = ScreenPlay:new {
	numberOfActs = 1,
	screenplayName = "NightbrotherScreenPlay",
}
registerScreenPlay("NightbrotherScreenPlay", true)

function NightbrotherScreenPlay:start()
	if (isZoneEnabled("yavin4")) then
		self:spawnMobiles()
	end
end

function NightbrotherScreenPlay:spawnMobiles()
spawnMobile("yavin4", "elite_nightbrother_elder", 600, 5026.1, 78.8025, 5895.46, 206, 0) --door

spawnMobile("yavin4", "nightbrother_archer", 600, 2.7799, 0.759882, 19.1665, 295, 620002499)
spawnMobile("yavin4", "nightbrother_assasin", 600, -3.67003, 0.759882, 15.6799, 27, 620002499)
spawnMobile("yavin4", "nightbrother_assasin", 600, 5.32635, 0.759882, 13.1496, 333, 620002499)

spawnMobile("yavin4", "nightbrother_creature_handler", 600, 0.210278, 0.759886, 0.366009, 2, 620002500)
spawnMobile("yavin4", "adolescent_acklay", 600, -6.80746, 0.759886, 1.89389, 93, 620002500)
spawnMobile("yavin4", "adolescent_acklay", 600, 8.66115, 0.759886, 2.6378, 203, 620002500)

spawnMobile("yavin4", "elite_nightbrother_elder", 600, -1.4934, 0.759886, -14.0788, 31, 620002501)
spawnMobile("yavin4", "elite_nightbrother_weapons_master", 600, 17.0543, 0.759882, -16.5098, 259, 620002502)
spawnMobile("yavin4", "elite_nightbrother_weapons_master", 600, 11.2725, 0.759882, -36.1407, 329, 620002502)
spawnMobile("yavin4", "nightbrother_assasin", 600, 14.3321, 0.759882, -27.7422, 296, 620002502)
spawnMobile("yavin4", "elite_nightbrother_elder", 600, -16.3165, 0.759882, -16.7822, 90, 620002503)
spawnMobile("yavin4", "elite_nightbrother_weapons_master", 600, -18.655, 0.759882, -26.8997, 86, 620002503)
spawnMobile("yavin4", "nightbrother_archer", 600, -9.69657, 0.759882, -37.2838, 330, 620002503)

-- Pit Area --
spawnMobile("yavin4", "nightbrother_assasin", 600, 4943.13, 90.8282, 5871.1, 92, 0)
spawnMobile("yavin4", "nightbrother_archer", 600, 4904.72, 92.6283, 5848.08, 4, 0)
spawnMobile("yavin4", "nightbrother_assasin", 600, 4862.61, 97.798, 5860.76, 308, 0)
spawnMobile("yavin4", "nightbrother_archer", 600, 4843.93, 93.6065, 5898.21, 346, 0)
spawnMobile("yavin4", "nightbrother_assasin", 600, 4829.46, 93.8994, 5937.93, 354, 0)
spawnMobile("yavin4", "nightbrother_archer", 600, 4827.48, 90.1463, 5978.45, 40, 0)
spawnMobile("yavin4", "nightbrother_assasin", 600, 4832.06, 89.1851, 6000.49, 102, 0)
spawnMobile("yavin4", "nightbrother_archer", 600, 4870.01, 88.4712, 6012.69, 132, 0)
spawnMobile("yavin4", "nightbrother_assasin", 600, 4893.16, 89.2007, 6015.19, 102, 0)
spawnMobile("yavin4", "nightbrother_archer", 600, 4910.28, 89.2964, 6017.31, 80, 0)
spawnMobile("yavin4", "nightbrother_assasin", 600, 4950.78, 86.7143, 6021.12, 180, 0)
spawnMobile("yavin4", "nightbrother_archer", 600, 4983.73, 85.0813, 6011.32, 214, 0)
spawnMobile("yavin4", "adolescent_acklay", 300, 4926.64, 72.3377, 5993.61, 0, 0)
spawnMobile("yavin4", "adolescent_acklay", 300, 4944.77, 72.4504, 5986.61, 332, 0)
spawnMobile("yavin4", "adolescent_acklay", 300, 4861.63, 71.8559, 5973.27, 282, 0)
spawnMobile("yavin4", "adolescent_acklay", 300, 4865.4, 74.2821, 5939.76, 70, 0)
spawnMobile("yavin4", "adolescent_acklay", 300, 4894.42, 75.1988, 5936.2, 78, 0)
spawnMobile("yavin4", "adolescent_acklay", 300, 4899.59, 70.874, 5983.08, 356, 0)
spawnMobile("yavin4", "adolescent_acklay", 300, 4920.39, 72.8766, 5979.54, 69, 0)
spawnMobile("yavin4", "adolescent_acklay", 300, 4890.36, 74.6388, 5958.35, 21, 0)

---Arzro Spawner---
local pAzSpawner = spawnMobile("yavin4", "elite_nightbrother_weapons_master", 3600, -0.238551, 0.759882, -53.0528, 357, 620002504)
	createObserver(OBJECTDESTRUCTION, "NightbrotherScreenPlay", "pAzSpawnerMobDead", pAzSpawner)
---CH Boss/Pet Area---
local pCHSpawnerMob = spawnMobile("yavin4", "nightbrother_creature_handler", 7200, 4969.04, 80.9555, 5917.64, 131, 0)
	createObserver(OBJECTDESTRUCTION, "NightbrotherScreenPlay", "notifypCHSpawnerMobDead", pCHSpawnerMob)
end


function NightbrotherScreenPlay:notifypCHSpawnerMobDead(pCHSpawnerMob, pKiller)
	if (readData("nbcreaturehandler:acklay") and (readData("nbcreaturehandler:adolacklay") == 0)) then
			local pNBBossStart =	spawnMobile("yavin4", "nightbrother_acklay", 0, 4913.41, 73.1407, 5959.89, 147, 0)
			local pNBBossAdds = spawnMobile("yavin4", "adolescent_acklay", 0, 4925.14, 73.5686, 5951.25, 283, 0)
			createObserver(OBJECTDESTRUCTION, "NightbrotherScreenPlay", "notifyNBBossStartDead", pNBBossStart)
			createObserver(OBJECTDESTRUCTION, "NightbrotherScreenPlay", "notifyNBBossStartDead", pNBBossAdds)
			writeData("nbcreaturehandler:acklay", 1)
			writeData("nbcreaturehandler:adolacklay", 1)
	end

	return 0
end

function NightbrotherScreenPlay:notifyNBBossStartDead(pNBBossStart, pKiller)
	deleteData("nbcreaturehandler:acklay")
	deleteData("nbcreaturehandler:adolacklay")

	return 1
end

function NightbrotherScreenPlay:pAzSpawnerMobDead(pAzSpawner, nbKiller)
	if (readData("nb_arzo:boss") == 0) then
				local pAzroStart = 	spawnMobile("yavin4", "boss_nightbrother_arzo_suun", 0, -0.848643, 7.21901, -20.3226, 180, 620002506),-- boss
					spawnMobile("yavin4", "shadow_collective_sbd", 0, 3.18375, 7.219, -15.8182, 189, 620002506) -- next to arzo, droid or sniper
					createObserver(OBJECTDESTRUCTION, "NightbrotherScreenPlay", "notifyAzroStartDead", pAzroStart)
				writeData("nb_arzo:boss", 1)
		end
		return 0
end

function NightbrotherScreenPlay:notifyAzroStartDead(pAzroStart, nbKiller)
	deleteData("nb_arzo:boss")

	return 1
end
