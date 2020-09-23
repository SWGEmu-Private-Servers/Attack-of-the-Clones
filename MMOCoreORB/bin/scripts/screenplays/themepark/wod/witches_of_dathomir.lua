--Authour: The Tiny Pebble

witchesOfDathomirScreenplay = ScreenPlay:new {
	spawnZones = {
		{ --Mutant rancor prologue location
			x = -5536, 
			y = 3968, 
			spawnCount = 15, 
			radius = 50, 
			respawnTimer = 300,
			spawnTemplates = {
				"mutant_rancor"
			},
		}, 
		{ --Spiderclan prologue location
			x = -1887, 
			y = 5721, 
			spawnCount = 15, 
			radius = 100, 
			respawnTimer = 300,
			spawnTemplates = {
				"spiderclan_acolyte",
				"spiderclan_auspex",
				"spiderclan_crawler",
				"spiderclan_elder",
				"spiderclan_protector",
				"spiderclan_sentinel",
				"spiderclan_sentry",
				"spiderclan_stalker",
				"spiderclan_web_dancer"
			},
		}, 
		{ --First Sister Malklocs
			x = -5039,
			y = -2768, 
			spawnCount = 20, 
			radius = 250, 
			respawnTimer = 150,
			spawnTemplates = {
				"malkloc_plainswalker",
				"female_malkloc_plainswalker",
				"malkloc_bull",
			},
		}, 
		{ --Breeding Cave Spiderclan
			x = 308,
			y = -190, 
			spawnCount = 10, 
			radius = 150,
			respawnTimer = 300,
			spawnTemplates = {
				"wod_spiderclan_obfuscatrix"
			},
		}, 
	}
}

registerScreenPlay("witchesOfDathomirScreenplay", true)

local QuestManager = require("managers.quest.quest_manager")

--TODO: Spawn Scene Objects
--TODO: Spawn mobiles
--TODO: Reward handling check if inventory is full

function witchesOfDathomirScreenplay:start()
	if (isZoneEnabled("dathomir")) then
		self:spawnMobiles()
		self:spawnSceneObjects()
	end
end

function witchesOfDathomirScreenplay:onPlayerLoggedIn(pPlayer)
	if (pPlayer == nil) then
		return
	end
	
	wodPrologueScreenplay:onPlayerLoggedIn(pPlayer)
	local clan = readScreenPlayData(pPlayer, "witchesOfDathomir", "clanAlignment")
	
	if (clan == "" or clan == nil) then
		return
	end
	
	if (clan == "sm") then
		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_LOST_E02_01)) then
			dropObserver(KILLEDCREATURE, "wodSpiderclanArc", "notifyKilledHuntTarget", pPlayer)
			createObserver(KILLEDCREATURE, "wodSpiderclanArc", "notifyKilledHuntTarget", pPlayer)
		elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_LOST_E02_03)) then
			dropObserver(KILLEDCREATURE, "wodSpiderclanArc", "notifyKilledHuntTarget", pPlayer)
			createObserver(KILLEDCREATURE, "wodSpiderclanArc", "notifyKilledHuntTarget", pPlayer)
		elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_EHS_02)) then
			dropObserver(KILLEDCREATURE, "wodSpiderclanArc", "notifyKilledHuntTarget", pPlayer)
			createObserver(KILLEDCREATURE, "wodSpiderclanArc", "notifyKilledHuntTarget", pPlayer)
		end
		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_HUNTING_01)) then
			dropObserver(KILLEDCREATURE, "wodHunting", "notifyKilledHuntTarget", pPlayer)
			createObserver(KILLEDCREATURE, "wodHunting", "notifyKilledHuntTarget", pPlayer)
		end
		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_FISHING_01)) then
			dropObserver(FISHINGSUCESS, "wodFishing", "notifyFishingSuccess", pPlayer)
			createObserver(FISHINGSUCESS, "wodFishing", "notifyFishingSuccess", pPlayer)
		end
		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_WHOLE_TRUTH_02)) then
			dropObserver(KILLEDCREATURE, "wodWholeTruthArc", "notifyKilledHuntTarget", pPlayer)
			createObserver(KILLEDCREATURE, "wodWholeTruthArc", "notifyKilledHuntTarget", pPlayer)
		end
		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_RANCOR_TAMER_01)) then
			dropObserver(STARTENTERTAIN, "wodEntertainerQuest", "notifyPerformanceObserver", pPlayer)
			if (readData("wodThemepark:rancorTamingActive:" .. SceneObject(pPlayer):getObjectID()) == 1) then
				createObserver(STARTENTERTAIN, "wodEntertainerQuest", "notifyPerformanceObserver", pPlayer)
			end
		end
		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_KILL_CLAN_01)) then
			dropObserver(KILLEDCREATURE, "wodKillOtherClan", "notifyKilledHuntTarget", pPlayer)
			createObserver(KILLEDCREATURE, "wodKillOtherClan", "notifyKilledHuntTarget", pPlayer)
		end
		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_KILL_SPIDERCLAN_01)) then
			dropObserver(KILLEDCREATURE, "wodKillSpiderclan", "notifyKilledHuntTarget", pPlayer)
			createObserver(KILLEDCREATURE, "wodKillSpiderclan", "notifyKilledHuntTarget", pPlayer)
		end
		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_SISTER1_02)) then
			dropObserver(KILLEDCREATURE, "wodTwoClansArc", "notifyKilledHuntTarget", pPlayer)
			createObserver(KILLEDCREATURE, "wodTwoClansArc", "notifyKilledHuntTarget", pPlayer)
		end
	elseif (clan == "ns") then
		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_LOST_E02_01)) then
			dropObserver(KILLEDCREATURE, "wodSpiderclanArc", "notifyKilledHuntTarget", pPlayer)
			createObserver(KILLEDCREATURE, "wodSpiderclanArc", "notifyKilledHuntTarget", pPlayer)
		elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_LOST_E02_03)) then
			dropObserver(KILLEDCREATURE, "wodSpiderclanArc", "notifyKilledHuntTarget", pPlayer)
			createObserver(KILLEDCREATURE, "wodSpiderclanArc", "notifyKilledHuntTarget", pPlayer)
		elseif (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_EHS_02)) then
			dropObserver(KILLEDCREATURE, "wodSpiderclanArc", "notifyKilledHuntTarget", pPlayer)
			createObserver(KILLEDCREATURE, "wodSpiderclanArc", "notifyKilledHuntTarget", pPlayer)
		end
		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_HUNTING_01)) then
			dropObserver(KILLEDCREATURE, "wodHunting", "notifyKilledHuntTarget", pPlayer)
			createObserver(KILLEDCREATURE, "wodHunting", "notifyKilledHuntTarget", pPlayer)
		end
		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_FISHING_01)) then
			dropObserver(FISHINGSUCESS, "wodFishing", "notifyFishingSuccess", pPlayer)
			createObserver(FISHINGSUCESS, "wodFishing", "notifyFishingSuccess", pPlayer)
		end
		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_WHOLE_TRUTH_02)) then
			dropObserver(KILLEDCREATURE, "wodWholeTruthArc", "notifyKilledHuntTarget", pPlayer)
			createObserver(KILLEDCREATURE, "wodWholeTruthArc", "notifyKilledHuntTarget", pPlayer)
		end
		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_RANCOR_TAMER_01)) then
			dropObserver(STARTENTERTAIN, "wodEntertainerQuest", "notifyPerformanceObserver", pPlayer)
			if (readData("wodThemepark:rancorTamingActive:" .. SceneObject(pPlayer):getObjectID()) == 1) then
				createObserver(STARTENTERTAIN, "wodEntertainerQuest", "notifyPerformanceObserver", pPlayer)
			end
		end
		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_KILL_CLAN_01)) then
			dropObserver(KILLEDCREATURE, "wodKillOtherClan", "notifyKilledHuntTarget", pPlayer)
			createObserver(KILLEDCREATURE, "wodKillOtherClan", "notifyKilledHuntTarget", pPlayer)
		end
		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_KILL_SPIDERCLAN_01)) then
			dropObserver(KILLEDCREATURE, "wodKillSpiderclan", "notifyKilledHuntTarget", pPlayer)
			createObserver(KILLEDCREATURE, "wodKillSpiderclan", "notifyKilledHuntTarget", pPlayer)
		end
		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_SISTER1_02)) then
			dropObserver(KILLEDCREATURE, "wodTwoClansArc", "notifyKilledHuntTarget", pPlayer)
			createObserver(KILLEDCREATURE, "wodTwoClansArc", "notifyKilledHuntTarget", pPlayer)
		end
	end
end

function witchesOfDathomirScreenplay:spawnMobiles()
	--Prologue
	local pAnchor = spawnMobile("dathomir", "wod_omogg_rep", -1, 558, 6, 3073, 29, 0)
	writeData("wodThemepark:anchorID", SceneObject(pAnchor):getObjectID())

	spawnMobile("dathomir", "wod_rubina", -1, -3177, 21.8, 3184, 0, 0)
	spawnMobile("dathomir", "wod_outcast_01", -1, 866, 132, 1095, 162, 0)
	spawnMobile("dathomir", "wod_outcast_02", -1, -1000, 116.2, 862, -131, 0)
	spawnMobile("dathomir", "wod_outcast_03", -1, -2597, 131.3, 4952, 55, 0)
	spawnMobile("dathomir", "wod_outcast_04", -1, 1482, 131.7, 3515, 43, 0)
	spawnMobile("dathomir", "wod_outcast_05", -1, 1125, 135, -1022, -122, 0)
	spawnMobile("dathomir", "wod_outcast_06", -1, -856, 146.7, 2788, -144, 0)
	spawnMobile("dathomir", "wod_outcast_07", -1, -7121, 363.7, 2933, 111, 0)
	--Singing Mountain Clan
	spawnMobile("dathomir", "wod_telo", -1, -25.9, 2.0, -7.4, -153, 2665882)
	spawnMobile("dathomir", "wod_aujante_klee", -1, 3, 3, -5.2, 176, 2665884)
	spawnMobile("dathomir", "wod_azzenaj", -1, -12.0, 2.0, 14.7, 150, 2665880)
	spawnMobile("dathomir", "wod_zideera", -1, -12.3, 2, -8.6, -79, 2665882)
	spawnMobile("dathomir", "theme_park_smc_rancor_pygmy_shando", -1, -12.6, 2, -2, -125, 2665882)
	spawnMobile("dathomir", "theme_park_smc_rancor_pygmy_maufel", -1, -11.5, 2, -5.7, -99, 2665882)
	spawnMobile("dathomir", "wod_vurlene", -1, -11.8, 2, 9.4, 86, 2665880)
	spawnMobile("dathomir", "wod_hazel", -1, -14.2, 1.9, -21, -20, 2665883)
	spawnMobile("dathomir", "wod_vhaunda", -1, -22.3, 2, 5.05, 5, 2665881)
	spawnMobile("dathomir", "wod_izaryx", -1, -12, 2, -4, -110, 2665882)
	spawnMobile("dathomir", "wod_sm_vendor", -1, -27.3, 2.0, 9.0, 66, 2665881)
	--Nightsister
	spawnMobile("dathomir", "wod_saik", -1, 3.2, 0.8, -1.8, -5, 189375)
	spawnMobile("dathomir", "wod_num", -1, -4001.0, 119.0, -62.4, -165, 0)
	spawnMobile("dathomir", "wod_leandra", -1, 7.7, 7.2, -34.2, 22, 189382)
	spawnMobile("dathomir", "wod_ns_vendor", -1, 0.2, 0.8, -54.7, -5, 189379)
	spawnMobile("dathomir", "wod_satra", -1, -13.6, 7.2, -14.4, -164, 189384)
	spawnMobile("dathomir", "wod_fath_hray", -1, -12, 7.2, -36.7, 13, 189384)
	spawnMobile("dathomir", "wod_diax", -1, -20.5, 7.2, -27.4, 140, 189384)
	spawnMobile("dathomir", "wod_kais", -1, 14.2, 7.2, -15, -92, 189382)
	spawnMobile("dathomir", "wod_gethzerion", -1, -2, 7.2, -1, -135, 189383)

	--Ghost guide abandoned village: -6850, -4897
	spawnMobile("dathomir", "wod_ghost_witch", -1, -6894.9, 461.8, -4853.8, 109, 0)
	
	--Other statics
	spawnMobile("dathomir", "wod_rescue_initiate", -1, 1.4, -46.1, -150.6, -11, 3695706)
	spawnMobile("dathomir", "wod_spiderclan_obfuscatrix", 300, -1211.14, 126.731, 6200.72, 219, 0)
	spawnMobile("dathomir", "wod_spiderclan_obfuscatrix", 300, -1158.8, 134.365, 6218.83, 77, 0) 
	spawnMobile("dathomir", "wod_spiderclan_obfuscatrix", 300, -1153.97, 120.224, 6261.31, 229, 0) 
	spawnMobile("dathomir", "wod_spiderclan_obfuscatrix", 300, -1194.61, 127.826, 6312.44, 150, 0) 
	spawnMobile("dathomir", "wod_spiderclan_obfuscatrix", 300, -1235.59, 108.501, 6273.43, 221, 0) 
	
	for i = 1, #self.spawnZones do
		for j = 1, self.spawnZones[i].spawnCount do
			local spawnPoint = getSpawnPoint("dathomir", self.spawnZones[i].x, self.spawnZones[i].y, 0, self.spawnZones[i].radius)
			
			local n = getRandomNumber(1, #self.spawnZones[i].spawnTemplates)
			local pMobile = spawnMobile("dathomir", self.spawnZones[i].spawnTemplates[n], self.spawnZones[i].respawnTimer, spawnPoint[1], spawnPoint[2], spawnPoint[3], math.random(360), 0)
			AiAgent(pMobile):setAiTemplate("idlewander")
		end
	end
	
	--Cave of Mutations (Kyrisa): 1993, 42, 1823
	spawnMobile("dathomir", "wod_kyrisa", 300, -85.9867, -101.108, -146.848, 97, 610001019) 
	spawnMobile("dathomir", "wod_mutant_rancor", 300, 2013.6, 27.1653, 1815.7, 311, 0) 
	spawnMobile("dathomir", "wod_mutant_rancor", 300, 2023.37, 30.0528, 1827.49, 314, 0) 
	spawnMobile("dathomir", "wod_mutant_rancor", 300, -3.64833, -40.3737, -71.9833, 64, 610001014) 
	spawnMobile("dathomir", "wod_mutant_rancor", 300, 21.0084, -43.6678, -61.4665, 242, 610001014) 
	spawnMobile("dathomir", "wod_mutant_rancor", 300, 42.2644, -46.4554, -55.337, 193, 610001015) 
	spawnMobile("dathomir", "wod_mutant_rancor", 300, 43.2449, -46.0775, -97.4378, 347, 610001015) 
	spawnMobile("dathomir", "wod_mutant_rancor", 300, -5.33385, -45.1265, -141.72, 147, 610001016) 
	spawnMobile("dathomir", "wod_mutant_rancor", 300, 64.6421, -47.3975, -128.361, 248, 610001016) 
	spawnMobile("dathomir", "wod_mutant_rancor", 300, 58.1275, -56.0969, -154.475, 126, 610001016) 
	spawnMobile("dathomir", "wod_mutant_rancor", 300, 57.272, -56.7325, -178.495, 275, 610001016) 
	spawnMobile("dathomir", "wod_mutant_rancor", 300, -3.82092, -64.0563, -178.86, 87, 610001017) 
	spawnMobile("dathomir", "wod_mutant_rancor", 300, -1.29048, -63.7761, -232.021, 278, 610001018) 
	spawnMobile("dathomir", "wod_mutant_rancor", 300, -18.0333, -65.8262, -239.192, 61, 610001018) 
	spawnMobile("dathomir", "wod_mutant_rancor", 300, -71.528, -69.4305, -194.527, 14, 610001019) 
	spawnMobile("dathomir", "wod_mutant_rancor", 300, -95.5359, -73.7156, -169.064, 81, 610001019) 
	spawnMobile("dathomir", "wod_mutant_rancor", 300, -120.967, -69.7222, -126.557, 201, 610001019) 
	spawnMobile("dathomir", "wod_mutant_rancor", 300, -90.6674, -70.5743, -111.763, 194, 610001019) 
	spawnMobile("dathomir", "wod_mutant_rancor", 300, -55.564, -69.9051, -88.0477, 275, 610001020) 
	spawnMobile("dathomir", "wod_mutant_rancor", 300, -49.3086, -68.9791, -105.445, 275, 610001020) 
	spawnMobile("dathomir", "wod_mutant_rancor", 300, -25.8339, -79.4139, -140.684, 347, 610001021) 
	
	--Breeding Cave (Queen Mother): 308, 114, -190
	spawnMobile("dathomir", "wod_spiderclan_matron", 300, 3.08672, -67.305, -74.1763, 187, 610001001) 
	local pSpider = spawnMobile("dathomir", "cavern_spider_broodling", 300, 2.43422, -67.4344, -66.7283, 176, 610001001) 
	CreatureObject(pSpider):setPvpStatusBitmask(0)
	pSpider = spawnMobile("dathomir", "cavern_spider_broodling", 300, 10.1517, -66.8012, -76.0353, 232, 610001001) 
	CreatureObject(pSpider):setPvpStatusBitmask(0)
	pSpider = spawnMobile("dathomir", "cavern_spider_broodling", 300, 9.18448, -67.2903, -69.6039, 230, 610001001) 
	CreatureObject(pSpider):setPvpStatusBitmask(0)
	
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -8.72737, -30.2743, -43.746, 249, 610000983) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -10.3108, -30.237, -50.1996, 331, 610000983) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -14.0785, -30.2435, -47.9276, 343, 610000983) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -44.7617, -30.0132, -45.5551, 306, 610000984) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -76.0539, -29.9613, -42.0035, 116, 610000986) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -73.1548, -29.9506, -39.8257, 177, 610000986) 
	spawnMobile("dathomir", "cavern_spider", 300, -98.8088, -38.4038, -121.272, 3, 610000990) 
	spawnMobile("dathomir", "cavern_spider", 300, -103.515, -39.3991, -117.072, 62, 610000990) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -99.8184, -38.919, -88.308, 261, 610000992) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -103.271, -38.9451, -83.6091, 225, 610000992) 
	spawnMobile("dathomir", "cavern_spider", 300, -114.362, -38.422, -78.9145, 198, 610000992) 
	spawnMobile("dathomir", "cavern_spider_hunter", 300, -126.668, -33.8462, -64.5616, 123, 610000987) 
	spawnMobile("dathomir", "cavern_spider", 300, -106.915, -36.0845, -65.3279, 293, 610000987) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -103.495, -42.0965, -26.9966, 93, 610000997) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -104.5, -42.1731, -22.8781, 312, 610000997) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -105.059, -42.4767, -14.319, 181, 610000998) 
	spawnMobile("dathomir", "cavern_spider_hunter", 300, -135.893, -54.0382, -11.2952, 147, 610000999) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -138.102, -57.2517, -22.4536, 67, 610000999) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -134.942, -57.3724, -27.4849, 337, 610000999) 
	spawnMobile("dathomir", "cavern_spider", 300, -110.881, -57.7561, -25.4874, 162, 610000997) 
	spawnMobile("dathomir", "cavern_spider", 300, -115.515, -57.8328, -36.0169, 359, 610000997) 
	spawnMobile("dathomir", "cavern_spider", 300, -122.28, -57.6675, -30.4606, 60, 610000997) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -80.0229, -57.9442, -39.5909, 201, 610000995) 
	spawnMobile("dathomir", "cavern_spider_hunter", 300, -84.5985, -57.3794, -38.7337, 159, 610000995) 
	spawnMobile("dathomir", "cavern_spider", 300, -81.6952, -61.3118, -64.4004, 46, 610000995) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -98.4116, -54.9555, -87.3005, 280, 610000992) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -101.719, -55.1902, -81.0633, 278, 610000992) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -112.694, -55.1336, -88.4306, 5, 610000992) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -113.149, -54.3038, -79.2292, 191, 610000992) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -121.505, -54.1821, -83.5256, 157, 610000992) 
	spawnMobile("dathomir", "cavern_spider", 300, -117.304, -54.6525, -88.0298, 42, 610000992) 
	spawnMobile("dathomir", "cavern_spider", 300, -129.766, -53.7441, -83.6629, 175, 610000992) 
	spawnMobile("dathomir", "cavern_spider_hunter", 300, -134.12, -54.1235, -81.9921, 30, 610000992) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -142.986, -54.0078, -81.6129, 145, 610000992) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -142.372, -53.8809, -89.8782, 122, 610000992) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -144.54, -53.5675, -116.354, 229, 610000993) 
	spawnMobile("dathomir", "cavern_spider", 300, -149.104, -54.0405, -121.091, 284, 610000993) 
	spawnMobile("dathomir", "cavern_spider_hunter", 300, -170.915, -54.3727, -120.749, 26, 610000993) 
	spawnMobile("dathomir", "cavern_spider_hunter", 300, -162.664, -49.8456, -80.2689, 358, 610000991) 
	spawnMobile("dathomir", "cavern_spider_hunter", 300, -172.316, -50.0686, -65.0638, 83, 610000991) 
	spawnMobile("dathomir", "cavern_spider", 300, -167.313, -49.8859, -40.921, 105, 610000989) 
	spawnMobile("dathomir", "cavern_spider", 300, -141.251, -49.6307, -65.2166, 17, 610000987) 
	spawnMobile("dathomir", "cavern_spider", 300, -140.088, -49.497, -55.5922, 110, 610000987) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -121.107, -49.5566, -60.1073, 176, 610000987) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -119.769, -49.0836, -66.2714, 42, 610000987) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -67.9919, -46.8738, -74.2088, 17, 610000986) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -67.7542, -46.8351, -71.0158, 244, 610000986) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -80.6958, -46.9173, -46.2041, 58, 610000986) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -76.4945, -46.8779, -38.6803, 114, 610000986) 
	spawnMobile("dathomir", "cavern_spider", 300, -63.0624, -46.5139, -48.2058, 218, 610000986) 
	spawnMobile("dathomir", "cavern_spider", 300, -71.5257, -46.917, -23.3346, 97, 610000985) 
	spawnMobile("dathomir", "cavern_spider", 300, -70.6257, -46.2751, -14.3826, 104, 610000985) 
	spawnMobile("dathomir", "cavern_spider_hunter", 300, -65.1636, -43.9364, -10.556, 104, 610000985) 
	spawnMobile("dathomir", "cavern_spider", 300, -40.466, -33.352, -22.0262, 99, 610000983) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -25.0224, -30.2228, -21.528, 98, 610000983) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -23.6589, -30.2063, -15.9482, 66, 610000983) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, 16.3683, -21.5059, -20.9266, 299, 610001000) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, 18.0012, -35.4402, -71.2298, 298, 610001001) 
	spawnMobile("dathomir", "cavern_spider", 300, 15.8063, -35.4085, -68.8043, 59, 610001001) 
	spawnMobile("dathomir", "cavern_spider", 300, -11.5408, -34.8361, -79.1411, 32, 610001001) 
	spawnMobile("dathomir", "cavern_spider_hunter", 300, -16.5916, -34.5539, -64.2922, 186, 610001001) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -26.9231, -35.2895, -66.5937, 113, 610001002) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -11.6237, -43.7295, -100.197, 309, 610001003) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -39.0603, -44.7512, -110.574, 282, 610001003) 
	spawnMobile("dathomir", "cavern_spider", 300, -51.4123, -48.48, -96.0129, 136, 610001003) 
	spawnMobile("dathomir", "cavern_spider", 300, -39.7154, -45.2907, -104.247, 257, 610001003) 
	spawnMobile("dathomir", "cavern_spider_hunter", 300, -78.4305, -52.9875, -113.204, 82, 610000990) 
	spawnMobile("dathomir", "cavern_spider", 300, -131.954, -55.3407, -120.483, 38, 610001004) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -127.765, -60.3114, -136.038, 68, 610001005) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -124.714, -60.4347, -140.161, 299, 610001005) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -110.586, -69.7205, -115.072, 86, 610000990) 
	spawnMobile("dathomir", "cavern_spider", 300, -111.103, -69.4856, -106.198, 122, 610000990) 
	spawnMobile("dathomir", "cavern_spider", 300, -88.4228, -71.7917, -109.542, 175, 610000990) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -83.7736, -72.4327, -113, 242, 610000990) 
	spawnMobile("dathomir", "cavern_spider_hunter", 300, -88.8333, -71.8934, -117.949, 8, 610000990) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -74.2776, -66.8058, -137.597, 290, 610001006) 
	spawnMobile("dathomir", "cavern_spider", 300, -47.4118, -66.7247, -156.943, 287, 610001009) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -87.0639, -66.1879, -160.133, 86, 610001009) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -84.4905, -65.4194, -156.137, 141, 610001009) 
	spawnMobile("dathomir", "cavern_spider_hunter", 300, -78.0116, -66.0119, -179.81, 60, 610001009) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -63.6468, -66.2091, -172.607, 342, 610001009) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -75.8746, -66.3928, -187.641, 23, 610001009) 
	spawnMobile("dathomir", "cavern_spider_hunter", 300, -46.7536, -66.4958, -183.481, 313, 610001009) 
	spawnMobile("dathomir", "cavern_spider_hunter", 300, -62.2136, -65.5501, -232.302, 39, 610001010) 
	spawnMobile("dathomir", "cavern_spider_hunter", 300, -55.3619, -66.194, -236.676, 296, 610001010) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -61.4488, -66.4021, -237.436, 31, 610001010) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -66.9405, -64.8309, -229.952, 53, 610001010) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -52.4152, -65.1941, -230.984, 306, 610001010) 
	spawnMobile("dathomir", "cavern_spider", 300, -48.2611, -68.2505, -134.239, 289, 610001006) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, 3.40277, -71.4344, -108.744, 282, 610001007) 
	spawnMobile("dathomir", "cavern_spider_broodling", 300, -1.32541, -70.8481, -103.685, 235, 610001007) 
	
	--Temple of the Stars: 5269, 121, 165
	spawnMobile("dathomir", "wod_kwi", 300, -8.45219, -37.2976, 11.8412, 162, 610001025)  
	spawnMobile("dathomir", "wod_kwi", 300, 7.65888, -37.2976, 9.01322, 198, 610001025) 
	spawnMobile("dathomir", "wod_kwi", 300, 9.94425, -37.2976, -7.08133, 238, 610001025) 
	spawnMobile("dathomir", "wod_kwi", 300, -8.28943, -37.2976, -11.4224, 316, 610001025)  
	spawnMobile("dathomir", "wod_giant_whuffa_worm", 300, -0.554375, -37.2976, -18.1245, 176, 610001025) 
end

function witchesOfDathomirScreenplay:spawnSceneObjects()
	--Herb baskets
	spawnSceneObject("dathomir", "object/tangible/furniture/wod_themepark/pro_ns_herb_storage.iff", -3181, 22.1, 3185.1, 0, 0)
	spawnSceneObject("dathomir", "object/tangible/furniture/wod_themepark/pro_sm_herb_storage.iff", -3172, 21.5, 3182.4, 0, 0)
	spawnSceneObject("dathomir", "object/tangible/furniture/wod_themepark/ns_herb_storage.iff", -11.2, 7.2, -30.5, 189384, 0)
	spawnSceneObject("dathomir", "object/tangible/furniture/wod_themepark/herb_storage.iff", -29, 2, -3.4, 2665882, 0)

	--Repair altars
	spawnSceneObject("dathomir", "object/tangible/content/wod_crafting_alter_1.iff", -1150, 128, 1281, 0, 0)
	spawnSceneObject("dathomir", "object/tangible/content/wod_crafting_alter_2.iff", 1455, 135, 1387, 0, 0)
	spawnSceneObject("dathomir", "object/tangible/content/wod_crafting_alter_3.iff", -6703, 125, 3087, 0, 0)
	spawnSceneObject("dathomir", "object/tangible/content/wod_crafting_alter_4.iff", 2774, 15, 6466, 0, 0)
	
	--First sister altar
	spawnSceneObject("dathomir", "object/tangible/content/wod_first_sister_altar.iff", -4841, 135, -2938, 0, 0)
	
	--Second sister village: -3572, -6017
	spawnSceneObject("dathomir", "object/tangible/content/wod_second_sister_fire_1.iff", -3587.3, 87.9, -5996.8, 0, 0)
	spawnSceneObject("dathomir", "object/tangible/content/wod_second_sister_fire_2.iff", -3546.8, 87.2, -5993.8, 0, 0)
	spawnSceneObject("dathomir", "object/tangible/content/wod_second_sister_fire_3.iff", -3553.4, 94.6, -6053.3, 0, 0)
	spawnSceneObject("dathomir", "object/tangible/content/wod_second_sister_fire_4.iff", -3602.1, 99.9, -6051.4, 0, 0)

	--Trampled Veg (lost e01)
	local pPlant = spawnSceneObject("dathomir", "object/tangible/furniture/wod_themepark/wod_trampled_plant.iff", -1316, 17, 6163 , 0, 0)
	SceneObject(pPlant):setObjectMenuComponent("wodSpiderclanVegetationMenuComponent")

	--Temple of the Stars: 5269, 121, 165
	spawnSceneObject("dathomir", "object/tangible/furniture/wod_themepark/data_cache.iff", -10, -37.7, -25.1, 610001025, 0)
	spawnSceneObject("dathomir", "object/tangible/furniture/wod_themepark/data_cache.iff", -10, -37.3, -31.7, 610001025, 0)
	spawnSceneObject("dathomir", "object/tangible/furniture/wod_themepark/data_cache.iff", 10, -37.7, -25.1, 610001025, 0)
	local pCache = spawnSceneObject("dathomir", "object/tangible/furniture/wod_themepark/data_cache.iff", 10, -37.3, -31.7, 610001025, 0)
	SceneObject(pCache):setObjectMenuComponent("wodLeftBehindCacheMenuComponent")
end

function witchesOfDathomirScreenplay:handleReward(pPlayer, key)
	if (pPlayer == nil or key == nil) then
		return
	end

	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return
	end

	local curCount = tonumber(readScreenPlayData(pPlayer, "wodThemepark:reward", key))

	if (curCount == nil or curCount == "") then
		curCount = 0
	end

	writeScreenPlayData(pPlayer, "wodThemepark:reward", key, curCount + 1)
	writeStringData("wodThemepark:rewardKey:" .. SceneObject(pPlayer):getObjectID(), key)

	local rewardKey = wodRewardManager[key]

	if (rewardKey.rewardOnce and curCount + 1 ~= 1) then
		return
	end
	
	local rewardInterval = 0
	if (rewardKey.rewardInterval ~= nil) then
		rewardInterval = (curCount + 1) % rewardKey.rewardInterval
	end

	if (curCount + 1 ~= 1 or rewardInterval == 0) then
		local pItem
		if (rewardKey.credits ~= nil and rewardKey.credits > 0) then
			CreatureObject(pPlayer):addCashCredits(rewardKey.credits)
		end		
		if (rewardKey.rewardType == "all") then
			for i = 1, #rewardKey.reward do
				pItem = giveItem(pInventory, rewardKey.reward[i], -1)
				CreatureObject(pPlayer):sendSystemMessage("You have received a reward.")
				
				if ((wodRewardManager[key].tokenCount ~= nil or not wodRewardManager[key].tokenCount == 0) and pItem ~= nil and string.match(SceneObject(pItem):getTemplateObjectPath(), "wod_token")) then
					TangibleObject(pItem):setUseCount(wodRewardManager[key].tokenCount)
				end
			end
		elseif (rewardKey.rewardType == "pick") then
			local sui = SuiListBox.new("witchesOfDathomirScreenplay", "pickRewardCallback")

			sui.setTargetNetworkId(SceneObject(pPlayer):getObjectID())
			sui.setTitle("Pick a Reward")

			local message = "Please select your reward."
			sui.setPrompt(message)

			for i = 1, #rewardKey.reward do
				sui.add(rewardKey.reward[i][2], rewardKey.reward[i][1])
			end

			sui.sendTo(pPlayer)
		else --Random option
			if (rewardKey.rewardType ~= "random") then
				CreatureObject(pPlayer):sendSystemMessage("A reward could not be found for prologue quest, key: '" .. key .. "', please contact an admin.")
				return
			end
			local n = getRandomNumber(1, #rewardKey.reward)
				pItem = giveItem(pInventory, rewardKey.reward[n], -1)
			
			if ((wodRewardManager[key].tokenCount ~= nil or not wodRewardManager[key].tokenCount == 0) and pItem ~= nil and string.match(SceneObject(pItem):getTemplateObjectPath(), "wod_token")) then
				TangibleObject(pItem):setUseCount(wodRewardManager[key].tokenCount)
			end
		end

		if (wodRewardManager[key].rewardRandomValuable ~= nil or not wodRewardManager[key].rewardRandomValuable == 0) then
			local n = getRandomNumber(1, 5)
			pItem = giveItem(pInventory, "object/tangible/content/wod_token_" .. n .. ".iff", -1)
			CreatureObject(pPlayer):sendSystemMessage("You have received a reward.")

			if (pItem ~= nil) then
				TangibleObject(pItem):setUseCount(wodRewardManager[key].rewardRandomValuable)
			end
		end
	end
end

function witchesOfDathomirScreenplay:addToCollection(pPlayer, key)
	if (pPlayer == nil or key == nil) then
		return
	end
	
	local curCount = tonumber(readScreenPlayData(pPlayer, "wodThemepark:collection", key))
	
	if (curCount == nil or curCount == "") then
		curCount = 0
	end
	
	writeScreenPlayData(pPlayer, "wodThemepark:collection", key, curCount + 1)
	
	if (curCount + 1 == wodRewardManager[key].collectionRewardCount or not wodRewardManager[key].collectionRewardOnce) then
		if ((curCount + 1) % wodRewardManager[key].collectionRewardCount == 0) then
			self:handleCollectionReward(pPlayer, key)
		end
	end	
end

function witchesOfDathomirScreenplay:handleCollectionReward(pPlayer, key)
	if (pPlayer == nil or key == nil) then
		return
	end

	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
	
	if (pInventory == nil) then
		return
	end
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	local key = "enemies" .. key
	local clan = ""
	
	if (string.match(string.lower(key), "sm")) then
		clan = "SM"
	elseif (string.match(string.lower(key), "ns")) then
		clan = "NS"
	end
	
	if (string.match(string.lower(key), "herbs")) then
		key = "herbs"
	elseif (string.match(string.lower(key), "wisdom")) then
		key = "wisdom"
	end
	
	local rewardKey = wodRewardManager[key]
	local rewardString = "collectionReward" .. clan

	local pItem
	if (rewardKey.collectionRewardType == "all") then
		for i = 1, #rewardKey.reward do
			pItem = giveItem(pInventory, rewardKey[rewardString][i], -1)
			CreatureObject(pPlayer):sendSystemMessage("You have received a reward.")
			
			if ((wodRewardManager[key].collectionRewardCount ~= nil or not wodRewardManager[key].collectionRewardCount == 0) and pItem ~= nil and string.match(SceneObject(pItem):getTemplateObjectPath(), "wod_token")) then
				TangibleObject(pItem):setUseCount(wodRewardManager[key].collectionRewardCount)
			end
		end
	elseif (rewardKey.collectionRewardType == "pick") then
		local sui = SuiListBox.new("witchesOfDathomirScreenplay", "pickRewardCallback")

		sui.setTargetNetworkId(SceneObject(pPlayer):getObjectID())
		sui.setTitle("Pick a Reward")

		local message = "Please select your reward."
		sui.setPrompt(message)

		for i = 1, #rewardKey.reward do
			sui.add(rewardKey.reward[i][2], rewardKey.reward[i][1])
		end

		sui.sendTo(pPlayer)
	else --Random option
		if (rewardKey.collectionRewardType ~= "random") then
			CreatureObject(pPlayer):sendSystemMessage("A reward could not be found for prologue quest, key: '" .. key .. "', please contact an admin.")
			return
		end
		local n = getRandomNumber(1, #rewardKey[rewardString])
		pItem = giveItem(pInventory, rewardKey[rewardString][n], -1)
		CreatureObject(pPlayer):sendSystemMessage("You have received a reward.")
		
		if ((wodRewardManager[key].collectionRewardCount ~= nil or not wodRewardManager[key].collectionRewardCount == 0) and pItem ~= nil and string.match(SceneObject(pItem):getTemplateObjectPath(), "wod_token")) then
			TangibleObject(pItem):setUseCount(wodRewardManager[key].collectionRewardCount)
		end
	end
	
	if (rewardKey[rewardString .. "BadgeToAward"] ~= nil and rewardKey[rewardString .. "BadgeToAward"] ~= "" or not PlayerObject(pGhost):hasBadge(rewardKey[rewardString .. "BadgeToAward"])) then
		PlayerObject(pGhost):awardBadge(rewardKey[rewardString .. "BadgeToAward"])
	end
	CreatureObject(pPlayer):sendSystemMessage("You have completed a collection.")
end

function witchesOfDathomirScreenplay:pickRewardCallback(pPlayer, pSui, eventIndex, args)
	local cancelPressed = (eventIndex == 1)
	local pPageData = LuaSuiBoxPage(pSui):getSuiPageData()

	if (pPageData == nil) then
		return
	end

	local suiPageData = LuaSuiPageData(pPageData)
	local reward = suiPageData:getStoredData(tostring(args))

	if (cancelPressed or args == nil or tonumber(args) < 0) then
		reward = suiPageData:getStoredData("1")
	end

	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return
	end

	local pItem = giveItem(pInventory, reward, -1)
	CreatureObject(pPlayer):sendSystemMessage("You have received a reward.")
	
	local key = readStringData("wodThemepark:rewardKey:" .. SceneObject(pPlayer):getObjectID())
	if (wodRewardManager[key].tokenCount ~= nil or not wodRewardManager[key].tokenCount == 0 and string.match(SceneObject(pItem):getTemplateObjectPath(), "wod_token")) then
		TangibleObject(pItem):setUseCount(wodRewardManager[key].tokenCount)
	elseif (wodRewardManager[key].collectionRewardCount ~= nil or not wodRewardManager[key].collectionRewardCount == 0 and string.match(SceneObject(pItem):getTemplateObjectPath(), "wod_token")) then
		TangibleObject(pItem):setUseCount(wodRewardManager[key].collectionRewardCount)
	end
end

function witchesOfDathomirScreenplay:handleClanSwap(pPlayer, curClan)
	if (pPlayer == nil or curClan == nil) then
		return
	end
	
	if (curClan == "ns") then
		deleteScreenPlayData(pPlayer, "witchesOfDathomir", "storedQuestData:ns")
		for i = 250, 350 do
			if (QuestManager.hasCompletedQuest(pPlayer, i)) then
				writeScreenPlayData(pPlayer, "witchesOfDathomir", "storedQuestData:ns", readScreenPlayData(pPlayer, "witchesOfDathomir", "storedQuestData:ns") .. ";" .. i)
				QuestManager.resetQuest(pPlayer, i)
			elseif (QuestManager.hasActiveQuest(pPlayer, i)) then
				QuestManager.resetQuest(pPlayer, i)
			end
			local storedQuestsSM = HelperFuncs:splitString(readScreenPlayData(pPlayer, "witchesOfDathomir", "storedQuestData:sm"), ";")
			for i = 1, #storedQuestsSM do
				QuestManager.completeQuest(pPlayer, storedQuestsSM[i])
			end
		end
	elseif (curClan == "sm") then
		deleteScreenPlayData(pPlayer, "witchesOfDathomir", "storedQuestData:sm")
		for i = 351, 451 do
			if (QuestManager.hasCompletedQuest(pPlayer, i)) then
				writeScreenPlayData(pPlayer, "witchesOfDathomir", "storedQuestData:sm", readScreenPlayData(pPlayer, "witchesOfDathomir", "storedQuestData:sm") .. ";" .. i)
				QuestManager.resetQuest(pPlayer, i)
			elseif (QuestManager.hasActiveQuest(pPlayer, i)) then
				QuestManager.resetQuest(pPlayer, i)
			end
			local storedQuestsNS = HelperFuncs:splitString(readScreenPlayData(pPlayer, "witchesOfDathomir", "storedQuestData:ns"), ";")
			for i = 1, #storedQuestsNS do
				QuestManager.completeQuest(pPlayer, storedQuestsNS[i])
			end
		end
	end
end
