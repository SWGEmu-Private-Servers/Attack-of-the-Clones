talus_death_watch = ScreenPlay:new {
	numberOfActs = 1,

	screenplayName = "talus_death_watch",

}

registerScreenPlay("talus_death_watch", true)

function talus_death_watch:start()
	if (isZoneEnabled("talus")) then
		self:spawnMobiles()
		self:initializeLootContainers()
	end
end

function talus_death_watch:spawnMobiles()
	--Outside
		spawnMobile("talus", "death_watch_pikeman", 900, -4826.01, 33.092, -1908.61, 72, 0)
		spawnMobile("talus", "death_watch_pikeman", 900, -4826.75, 34.0876, -1901.82, 100, 0)


	--Inside

	spawnMobile("talus", "death_watch_assualt", 1800, 14.6953, -11.5, -19.8617, 359, 620001576)
	spawnMobile("talus", "death_watch_commando", 1800, 18.0659, -13.7584, -14.565, 329, 620001576)
	spawnMobile("talus", "death_watch_pistoleer", 900, 14.2152, -13.7584, 6.89133, 258, 620001575)
	spawnMobile("talus", "death_watch_swordsman", 900, 13.8419, -13.7584, 14.4659, 128, 620001575)
	spawnMobile("talus", "death_watch_pistoleer", 900, 3.06864, -13.7584, 11.3169, 172, 620001574)
	spawnMobile("talus", "death_watch_pikeman", 900, -5.86559, -13.7584, 9.25, 33, 620001574)
	spawnMobile("talus", "death_watch_tkm", 900, -5.50085, -13.7499, 6.34957, 167, 620001573)
	spawnMobile("talus", "death_watch_sniper", 900, -0.794278, -13.75, -3.41727, 186, 620001573)
	spawnMobile("talus", "death_watch_pikeman", 900, -6.36179, -13.75, -13.3024, 353, 620001573)
	spawnMobile("talus", "death_watch_pikeman", 900, -0.476633, -13.75, -13.0466, 334, 620001573)
	spawnMobile("talus", "death_watch_tkm", 900, 3.83379, -10.25, -18.0453, 8, 620001572)
	spawnMobile("talus", "death_watch_pikeman", 900, 2.00444, -6.75, -9.2967, 23, 620001571)
	spawnMobile("talus", "death_watch_swordsman", 900, 7.23568, -6.75, -0.412889, 211, 620001571)
	spawnMobile("talus", "death_watch_swordsman", 900, 2.00379, -6.75, -0.0172585, 133, 620001571)
	spawnMobile("talus", "death_watch_pistoleer", 900, -3.24211, 0.25, -3.9996, 83, 620001569)
	spawnMobile("talus", "death_watch_swordsman", 900, 3.70839, 0.25, -0.0690051, 4, 620001568)


end
