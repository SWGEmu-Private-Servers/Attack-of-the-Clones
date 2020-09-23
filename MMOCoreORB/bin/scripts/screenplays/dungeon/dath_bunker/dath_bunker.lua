DathBunkerScreenPlay = ScreenPlay:new {
	numberOfActs = 1,

	screenplayName = "DathBunkerScreenPlay",

registerScreenPlay("DathBunkerScreenPlay", true)

}

function DathBunkerScreenPlay:start()
	if (isZoneEnabled("dathomir")) then
                self:spawnMobiles()
				self:spawnSceneObjects()
                --self:initializeLootContainers()
        end
end

function DathBunkerScreenPlay:spawnSceneObjects()


end

function DathBunkerScreenPlay:spawnMobiles()

--Inside
spawnMobile("dathomir", "nilyahin_apprentice", 900, -3008.29, 77, -5679.2, 356, 0)
spawnMobile("dathomir", "nilyahin_apprentice", 900, -3001.81, 77, -5679.2, 359, 0)
spawnMobile("dathomir", "nilyahin_assassin", 900, -3017.37, 77, -5676.83, 339, 0)
spawnMobile("dathomir", "nilyahin_assassin", 900, -3017.91, 77, -5675.22, 152, 0)
spawnMobile("dathomir", "nilyahin_apprentice", 900, -3015.33, 77, -5662.06, 95, 0)
spawnMobile("dathomir", "nilyahin_assassin", 900, -2988.6, 77, -5660.21, 267, 0)
spawnMobile("dathomir", "nilyahin_smuggler", 900, -2990.48, 77, -5667.52, 176, 0)
spawnMobile("dathomir", "nilyahin_specialist", 900, -2990.37, 77, -5669.67, 1, 0)
spawnMobile("dathomir", "nilyahin_assassin", 900, -2989.96, 77, -5675.75, 300, 0)
spawnMobile("dathomir", "nilyahin_apprentice", 900, 3.52592, 0.25, -4.0734, 271, 610001009)
spawnMobile("dathomir", "nilyahin_assassin", 900, 2.39479, -12, 30.545, 167, 610001011)
spawnMobile("dathomir", "nilyahin_specialist", 900, -12.4357, -12, 40.7943, 181, 610001011)
spawnMobile("dathomir", "nilyahin_old_guard", 900, -7.13368, -12, 50.7706, 107, 610001011)
spawnMobile("dathomir", "nilyahin_apprentice", 900, 3.54831, -12, 65.4137, 176, 610001011)
spawnMobile("dathomir", "nilyahin_mentor", 900, 5.65389, -12, 62.9842, 270, 610001011)
spawnMobile("dathomir", "nilyahin_specialist", 900, 3.6656, -12, 61.0378, 1, 610001011)
spawnMobile("dathomir", "nilyahin_assassin", 900, 24.2768, -12, 43.039, 39, 610001011)
spawnMobile("dathomir", "nilyahin_old_guard", 900, 12.9237, -12, 45.6655, 208, 610001011)
spawnMobile("dathomir", "nilyahin_apprentice", 900, 53.8342, -12, 0.770959, 90, 610001020)
spawnMobile("dathomir", "nilyahin_assassin", 900, 57.8195, -12, 0.727627, 257, 610001020)
spawnMobile("dathomir", "nilyahin_smuggler", 900, 41.202, -12, 20.399, 265, 610001020)
spawnMobile("dathomir", "nilyahin_smuggler", 900, 27.4715, -12, 20.4544, 325, 610001020)
spawnMobile("dathomir", "nilyahin_sentinel_droid", 900, 23.5257, -12, 6.82044, 185, 610001020)
spawnMobile("dathomir", "nilyahin_smuggler", 900, 23.4864, -12, 4.72352, 1, 610001020)
spawnMobile("dathomir", "nilyahin_old_guard", 900, -22.1878, -20, -2.47607, 82, 610001022)
spawnMobile("dathomir", "nilyahin_bulwark_defense_droid", 900, -15.9878, -20, 1.60224, 82, 610001022)
spawnMobile("dathomir", "nilyahin_apprentice", 900, -15.9579, -20, 3.75461, 96, 610001022)
spawnMobile("dathomir", "nilyahin_smuggler", 900, -30.294, -20, 30.4626, 183, 610001024)
spawnMobile("dathomir", "nilyahin_bulwark_defense_droid", 900, -30.3665, -20, 84.201, 180, 610001024)
spawnMobile("dathomir", "nilyahin_mentor", 900, -7.8678, -20, 102.217, 247, 610001025)
spawnMobile("dathomir", "nilyahin_master_smuggler", 900, -22.3889, -20, 103.871, 356, 610001025)
spawnMobile("dathomir", "nilyahin_apprentice", 900, -4.9696, -20, 75.6276, 0, 610001027)
spawnMobile("dathomir", "nilyahin_bulwark_defense_droid", 900, 2.49947, -20, 70.9164, 88, 610001027)
spawnMobile("dathomir", "nilyahin_assassin", 900, 6.357408, -20, 70.8583, 2, 610001028)
spawnMobile("dathomir", "nilyahin_smuggler", 900, 73.7731, -12, 58.6577, 98, 610001018)
spawnMobile("dathomir", "nilyahin_old_guard", 900, 48.5636, -12, 58.9051, 268, 610001018)
spawnMobile("dathomir", "nilyahin_sentinel_droid", 900, 52.7377, -12, 81.9344, 175, 610001017)
spawnMobile("dathomir", "nilyahin_mentor", 900, 70.6092, -12, 82.9978, 271, 610001017)
spawnMobile("dathomir", "nilyahin_master_smuggler", 900, 35.3565, -12, 70.8913, 180, 610001016)
spawnMobile("dathomir", "nilyahin_apprentice", 900, 37.7127, -20, 125.248, 189, 610001019)
spawnMobile("dathomir", "nilyahin_smuggler", 900, 35.9771, -20, 142.627, 178, 610001019)
spawnMobile("dathomir", "nilyahin_mentor", 900, 32.5684, -20, 119.99, 147, 610001019)
spawnMobile("dathomir", "nilyahin_bulwark_defense_droid", 900, 19.2238, -20, 116.052, 174, 610001019)
spawnMobile("dathomir", "nilyahin_specialist", 900, 34.1445, -20, 136.172, 207, 610001019)
spawnMobile("dathomir", "nilyahin_master_smuggler", 900, -52.1899, -20, 44.0252, 60, 610001013)
spawnMobile("dathomir", "nilyahin_smuggler", 900, -75.904, -20, 47.0358, 91, 610001013)
spawnMobile("dathomir", "nilyahin_assassin", 900, -59.2749, -20, 66.2918, 26, 610001013)
spawnMobile("dathomir", "nilyahin_apprentice", 900, -52.1863, -20, 31.2822, 325, 610001013)
spawnMobile("dathomir", "nilyahin_mentor", 900, -74.6596, -20, 13.0408, 89, 610001014)
spawnMobile("dathomir", "nilyahin_smuggler", 900, -56.1909, -20, 14.4642, 356, 610001014)
spawnMobile("dathomir", "nilyahin_sentinel_droid", 900, -59.9898, -20, 9.00517, 293, 610001014)
spawnMobile("dathomir", "nilyahin_old_guard", 900, -74.7649, -20, 85.7018, 147, 610001015)
spawnMobile("dathomir", "nilyahin_mentor", 900, -48.6707, -20, 79.9259, 230, 610001015)
spawnMobile("dathomir", "nilyahin_tribunal", 2400, -27.4558, -20, 115.901, 178, 610001025)
end
