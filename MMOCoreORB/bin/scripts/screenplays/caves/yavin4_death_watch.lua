yavin4_death_watch = ScreenPlay:new {
	numberOfActs = 1,

	screenplayName = "yavin4_death_watch",

}

registerScreenPlay("yavin4_death_watch", true)

function yavin4_death_watch:start()
	if (isZoneEnabled("yavin4")) then
		self:spawnMobiles()
		self:initializeLootContainers()
		self:spawnSceneObjects()

	end
end

function yavin4_death_watch:spawnSceneObjects()

--spawnSceneObject("yavin4", "object/static/structure/corellia/corl_tent_hut_s01.iff", 1384.588, 35.87411, -6476.536, 0, 0.3077694, 0, 0.951461, 0)
end

function yavin4_death_watch:spawnMobiles()

	--Outside
	  spawnMobile("yavin4", "death_watch_sniper", 1800, 1404.9, 35.9559, -6464.01, 308, 0)
  	spawnMobile("yavin4", "death_watch_sniper", 1800, 1409.79, 36.7795, -6445.08, 238, 0)
  	spawnMobile("yavin4", "death_watch_assualt", 1800, 1390.5, 37.0562, -6448.18, 83, 0)
		spawnMobile("yavin4", "acklay", 7200, 1459.32, 35.7806, -6482.73, 307, 0)

	--Inside
	 spawnMobile("yavin4", "death_watch_pikeman", 900, -4.34907, 0.25, 3.88793, 133, 620001853)
	 spawnMobile("yavin4", "death_watch_sniper", 900, -1.52314, 0.25, -4.8703, 31, 620001854)
	 spawnMobile("yavin4", "death_watch_tkm", 900, 2.66623, 0, 0.67112, 265, 620001855)
	 spawnMobile("yavin4", "death_watch_pistoleer", 900, -1.78589, -12, 27.1009, 49, 620001856)
	 spawnMobile("yavin4", "death_watch_commando", 1800, 3.84557, -12, 65.9047, 174, 620001856)
	 spawnMobile("yavin4", "death_watch_sniper", 900, 25.8368, -12, 40.305, 305, 620001856)
	 spawnMobile("yavin4", "death_watch_tkm", 900, 35.9165, -12, 46.8585, 275, 620001861)
	 spawnMobile("yavin4", "death_watch_pistoleer", 900, 23.1038, -12, 35.1033, 169, 620001861)
	 spawnMobile("yavin4", "death_watch_wraith", 900, 24.7738, -12, 9.3887, 102, 620001865)
	 spawnMobile("yavin4", "death_watch_bloodguard", 900, 42.4495, -12, 20.8788, 165, 620001865)
	 spawnMobile("yavin4", "death_watch_bloodguard", 900, 56.0717, -12, 1.90806, 5, 620001865)
	 spawnMobile("yavin4", "death_watch_ghost", 900, 16.9482, -12, -0.213087, 267, 620001865)
	 spawnMobile("yavin4", "death_watch_commando", 1800, -11.4899, -20, 2.81076, 86, 620001867)
	 spawnMobile("yavin4", "death_watch_sniper", 900, -31.3891, -20, 2.59549, 92, 620001868)
	 spawnMobile("yavin4", "death_watch_swordsman", 900, -30.8991, -20, 37.165, 13, 620001869)
	 spawnMobile("yavin4", "death_watch_swordsman", 900, -30.3349, -20, 70.6893, 178, 620001869)
	 spawnMobile("yavin4", "death_watch_commando", 1800, -34.5049, -20, 100.221, 157, 620001870)
	 spawnMobile("yavin4", "death_watch_sniper", 900, -9.65722, -20, 102.66, 255, 620001870)
	 spawnMobile("yavin4", "death_watch_swordsman", 900, -14.5439, -20, 84.949, 75, 620001871)
	 spawnMobile("yavin4", "death_watch_swordsman", 900, -2.25923, -20, 80.7988, 194, 620001871)
	 spawnMobile("yavin4", "death_watch_assualt", 900, 3.35053, -20, 66.8237, 325, 620001872)
	 spawnMobile("yavin4", "death_watch_pikeman", 900, 31.5198, -12, 71.2181, 86, 620001861)
	 spawnMobile("yavin4", "death_watch_tkm", 900, 35.3991, -12, 82.7736, 171, 620001861)
	 spawnMobile("yavin4", "death_watch_tkm", 900, 35.3481, -20, 114.135, 178, 620001864)
	 spawnMobile("yavin4", "death_watch_assualt", 1800, 36.2978, -20, 136.312, 182, 620001864)
	 spawnMobile("yavin4", "death_watch_commando", 1800, 14.8378, -20, 137.449, 102, 620001864)
	 spawnMobile("yavin4", "death_watch_pistoleer", 900, 44.9573, -12, 86.1064, 219, 620001862)
	 spawnMobile("yavin4", "death_watch_ghost", 900, 71.8227, -12, 82.9515, 96, 620001862)
	 spawnMobile("yavin4", "death_watch_wraith", 900, 55.133, -12, 82.9797, 275, 620001862)
	 spawnMobile("yavin4", "death_watch_pikeman", 900, 45.4159, -12, 60.6483, 203, 620001863)
	 spawnMobile("yavin4", "death_watch_wraith", 900, 62.0759, -12, 59.6983, 257, 620001863)
	 spawnMobile("yavin4", "death_watch_ghost", 900, 73.5934, -12, 58.8806, 112, 620001863)
	 spawnMobile("yavin4", "death_watch_sniper", 900, -16.7953, -12, 51.1361, 123, 620001856)
	 spawnMobile("yavin4", "death_watch_pistoleer", 900, -43.1906, -20, 47.4723, 90, 620001857)
 	 spawnMobile("yavin4", "death_watch_commando", 1800, -71.0052, -20, 47.4852, 89, 620001858)
 	 spawnMobile("yavin4", "death_watch_sniper", 900, -70.8005, -20, 43.9598, 92, 620001858)
   spawnMobile("yavin4", "death_watch_wraith", 900, -55.9915, -20, 12.8475, 91, 620001859)
	 spawnMobile("yavin4", "death_watch_ghost", 900, -64.4938, -20, 8.88454, 286, 620001859)
	 spawnMobile("yavin4", "death_watch_ghost", 900, -65.9076, -20, 14.6704, 286, 620001859)
	 spawnMobile("yavin4", "death_watch_grevious", 150, -50.0764, -20, 86.7832, 205, 620001860)
	 --spawnMobile("yavin4", "death_watch_sbd", 900, -63.5154, -20, 74.3714, 281, 620001860)

	 --- Boss Start ---
	 local pMandoStart = spawnMobile("yavin4", "death_watch_assualt", 3600, -73.3105, -20, 80.9141, 156, 620001860)
	 createObserver(OBJECTDESTRUCTION, "yavin4_death_watch", "notifypMandoStartDead", pMandoStart)

	 end

	 function yavin4_death_watch:notifypMandoStartDead(pMandoStart, pKiller)
	 if (readData("mandocave:jediboss") == 0) then
		 	local pMandoBossStart =
					spawnMobile("yavin4", "elite_death_watch_jedi_hunter", 0, -48.1512, -20, 81.0847, 268, 620001860)
		 			createObserver(OBJECTDESTRUCTION, "yavin4_death_watch", "notifypMandoBossStartDead", pMandoBossStart)
		 			writeData("mandocave:jediboss", 1)
	 			end
				return 0
	 end

	 function yavin4_death_watch:notifypMandoBossStartDead(pMandoBossStart, pKiller)
		 deleteData("mandocave:jediboss")

		 return 1
	 end
