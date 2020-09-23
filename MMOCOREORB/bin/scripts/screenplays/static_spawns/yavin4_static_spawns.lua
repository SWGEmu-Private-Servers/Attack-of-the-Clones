--This is to be used for static spawns that are NOT part of caves, cities, dungeons, poi's, or other large screenplays.
Yavin4StaticSpawnsScreenPlay = ScreenPlay:new
	{
		screenplayName = "Yavin4StaticSpawnsScreenPlay",
}

registerScreenPlay("Yavin4StaticSpawnsScreenPlay", true)

function Yavin4StaticSpawnsScreenPlay:start()
	if (isZoneEnabled("yavin4")) then
		self:spawnMobiles()
	end
end

function Yavin4StaticSpawnsScreenPlay:spawnMobiles()
	-- Light Jedi Enclave (-5575, 4910)
	local pSentinel = spawnMobile("yavin4", "rep_jedi_master", 0, -5579.0, 87.7, 4908.5, -179, 0)

	if (pSentinel ~= nil) then
		writeData(SceneObject(pSentinel):getObjectID() .. ":sentinelID", 1)
		createEvent(10, "Yavin4StaticSpawnsScreenPlay", "setupSentinel", pSentinel, "")
	end

	pSentinel = spawnMobile("yavin4", "rep_jedi_master", 0, -5572.6, 87.7, 4908.2, -179, 0)

	if (pSentinel ~= nil) then
		writeData(SceneObject(pSentinel):getObjectID() .. ":sentinelID", 2)
		createEvent(10, "Yavin4StaticSpawnsScreenPlay", "setupSentinel", pSentinel, "")
	end

	-- Dark Jedi Enclave (5068, 310)
	pSentinel = spawnMobile("yavin4", "cis_jedi_master", 0, 5074.2, 78.8, 313.9, 90, 0)

	if (pSentinel ~= nil) then
		writeData(SceneObject(pSentinel):getObjectID() .. ":sentinelID", 1)
		createEvent(10, "Yavin4StaticSpawnsScreenPlay", "setupSentinel", pSentinel, "")
	end

	pSentinel = spawnMobile("yavin4", "cis_jedi_master", 0, 5074.3, 79.2, 306.4, 90, 0)

	if (pSentinel ~= nil) then
		writeData(SceneObject(pSentinel):getObjectID() .. ":sentinelID", 2)
		createEvent(10, "Yavin4StaticSpawnsScreenPlay", "setupSentinel", pSentinel, "")
	end

	-- Yavin4 Ruins (-6299, -1502)
	spawnMobile("yavin4", "crazed_geonosian_guard",300,-6299.1,24.7,-1502,0,0)
	spawnMobile("yavin4", "crazed_geonosian_guard",300,-6299.1,25.6,-1506.4,179,0)
	spawnMobile("yavin4", "crazed_geonosian_guard",300,-6302.1,24.9,-1504.2,-90,0)
	spawnMobile("yavin4", "crazed_geonosian_guard",300,-6296.0,25.3,-1504.2,90,0)

	-- Captain Eso & Yith Seenath's base of operations (1591, 1536)
	spawnMobile("yavin4", "cis_battle_droid_commando", 360, 1595.0, 102.5, 1531.9, -40, 0)
	spawnMobile("yavin4", "cis_battle_droid_commando", 360, 1595.0, 102.5, 1530.4, -30, 0)
	spawnMobile("yavin4", "cis_battle_droid_commando", 360, 1597.8, 102.9, 1530.3, -37, 0)
	spawnMobile("yavin4", "cis_battle_droid_commando", 360, 1595.3, 102.7, 1527.8, -26, 0)

	-- Imp base camp outside Massassi Temple POI
	spawnMobile("yavin4", "clonetrooper", 360, -3196.7, 69.6, -3139.5, -100, 0)
	spawnMobile("yavin4", "clonetrooper", 360, -3195.8, 69.8, -3130.7, -104, 0)

	--LJ Shuttle
	spawnSceneObject("yavin4", "object/building/player/city/shuttleport_corellia.iff", -5656, 102, 4925, 0, 0)
	spawnMobile("yavin4", "rep_jedi_master", 1, -5646.54, 100.005, 4948.13, 180, 0)
	spawnMobile("yavin4", "rep_jedi_master", 1, -5662.64, 98.8252, 4946.8, 167, 0)

	--DJ Shuttle
	spawnSceneObject("yavin4", "object/building/player/city/shuttleport_corellia.iff", 5061, 71, 412, 0, 0)
	spawnMobile("yavin4", "cis_magnaguard", 1, 5053.79, 67.9311, 434.323, 177, 0)
	spawnMobile("yavin4", "cis_magnaguard", 1, 5068.99, 67.4718, 434.442, 177, 0)

	--Dark Enclave Trainers
	spawnMobile("yavin4", "trainer_padawan_dark", 1, -15.9204, -43.4244, -36.8648, 1, 3435634)
	spawnMobile("yavin4", "trainer_jedi_sabers_dark", 300, -44.5964, -43.4244, -28.9613, 118, 3435635)
	spawnMobile("yavin4", "trainer_jedi_defender_dark", 300, 17.301, -43.4244, -36.8122, 3, 3435634)
	--spawnMobile("yavin4", "trainer_jedi_powers_dark", 300, -0.0248166, -43.2978, -153.507, 359, 3435642)
	spawnMobile("yavin4", "trainer_jedi_healer_dark", 300, 6.09723, -43.4244, -56.8031, 189, 3435643)

	--Light Enclave Trainers/Interior
	spawnMobile("yavin4", "trainer_jedi_sabers_light", 300, 21.886, -24, 85.4797, 181, 8525441)
	spawnMobile("yavin4", "trainer_padawan_light", 300, 2.8704, -18.8883, 33.9373, 0, 8525439)
	--spawnMobile("yavin4", "trainer_jedi_powers_light", 300, -47.1798, -22.05, 21.6365, 40, 8525420)
	spawnMobile("yavin4", "trainer_jedi_healer_light", 300, -45.9458, -22.05, 22.7099, 229, 8525420)
	spawnMobile("yavin4", "trainer_jedi_defender_light", 300, -10.5283, -19.25, 38.0381, 75, 8525439)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -10.0274, -19.25, 36.8968, 340, 8525439)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -2.54289, -18.8883, 33.761, 15, 8525439)

	--Dark Enclave Interior
	spawnMobile("yavin4", "cis_magnaguard", 300, 1.56346, -43.4244, -15.2571, 348, 3435633)
	spawnMobile("yavin4", "cis_magnaguard", 300, -1.4056, -43.4244, -15.1717, 15, 3435633)

	--Dark Enclave Perimeter
	spawnMobile("yavin4", "cis_magnaguard", 300, 4984.67, 97.5905, 264.255, 238, 0)
	spawnMobile("yavin4", "cis_magnaguard", 300, 4992.62, 97.4907, 270.674, 191, 0)
	spawnMobile("yavin4", "cis_magnaguard", 300, 5003.44, 97.5658, 272.677, 183, 0)
	spawnMobile("yavin4", "cis_magnaguard", 300, 5013.92, 97.005, 272.773, 186, 0)
	spawnMobile("yavin4", "cis_magnaguard", 300, 5023.75, 96.3748, 270.328, 195, 0)
	spawnMobile("yavin4", "cis_magnaguard", 300, 5034.67, 95.9667, 268.402, 163, 0)
	spawnMobile("yavin4", "cis_magnaguard", 300, 5040.54, 95.6813, 266.73, 179, 0)
	spawnMobile("yavin4", "cis_magnaguard", 300, 5054.07, 95.165, 260.945, 172, 0)
	spawnMobile("yavin4", "cis_magnaguard", 300, 5061.67, 95.7812, 259.195, 172, 0)
	spawnMobile("yavin4", "cis_magnaguard", 300, 5071.66, 97.2403, 256.842, 168, 0)
	spawnMobile("yavin4", "cis_magnaguard", 300, 5084.55, 98.428, 258.879, 141, 0)
	spawnMobile("yavin4", "cis_magnaguard", 300, 5092.03, 98.0961, 261.389, 149, 0)
	spawnMobile("yavin4", "cis_magnaguard", 300, 5102.59, 96.7775, 267.264, 145, 0)
	spawnMobile("yavin4", "cis_magnaguard", 300, 5116.08, 95.1321, 275.818, 113, 0)
	spawnMobile("yavin4", "cis_magnaguard", 300, 5121.35, 95.0228, 279.123, 119, 0)
	spawnMobile("yavin4", "cis_magnaguard", 300, 5127.57, 95.1508, 283.141, 117, 0)
	spawnMobile("yavin4", "cis_magnaguard", 300, 5135.24, 95.7519, 291.21, 121, 0)
	spawnMobile("yavin4", "cis_magnaguard", 300, 5142.11, 95.6577, 307.229, 110, 0)
	spawnMobile("yavin4", "cis_magnaguard", 300, 4994.72, 81.4558, 283.775, 269, 0)
	spawnMobile("yavin4", "cis_magnaguard", 300, 4995.03, 79.5013, 304.117, 268, 0)
	spawnMobile("yavin4", "cis_magnaguard", 300, 4994.45, 78.5773, 314.563, 279, 0)
	spawnMobile("yavin4", "cis_magnaguard", 300, 4996.78, 78.9238, 323.67, 285, 0)
	spawnMobile("yavin4", "cis_magnaguard", 300, 5000.14, 79.8354, 334.018, 288, 0)
	spawnMobile("yavin4", "cis_magnaguard", 300, 5004.95, 79.3638, 345.879, 299, 0)
	spawnMobile("yavin4", "cis_magnaguard", 300, 5012.27, 78.1859, 359.026, 307, 0)
	spawnMobile("yavin4", "cis_magnaguard", 300, 5019.25, 70.6185, 373.765, 300, 0)
	spawnMobile("yavin4", "cis_magnaguard", 300, 5028.14, 67.3409, 388.882, 299, 0)
	spawnMobile("yavin4", "cis_magnaguard", 300, 5011.68, 77.8007, 386.998, 301, 0)
	spawnMobile("yavin4", "cis_magnaguard", 300, 5024.52, 77.3106, 424.933, 314, 0)
	spawnMobile("yavin4", "cis_magnaguard", 300, 5034.77, 78.3632, 437.344, 334, 0)
	spawnMobile("yavin4", "cis_magnaguard", 300, 5012.21, 78.6302, 415.431, 306, 0)

	--Light Enclave Perimeter
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5587.08, 91.5089, 4845.78, 199, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5593.14, 92.7031, 4849.98, 225, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5601.95, 94.6447, 4858.85, 196, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5611.12, 95.4411, 4866.34, 230, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5619.33, 94.4356, 4872.44, 233, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5628.21, 93.3657, 4874.38, 223, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5635.59, 106.132, 4881.03, 175, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5645.62, 107.137, 4876.18, 193, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5655.66, 108, 4874.75, 194, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5664.99, 107.174, 4874.57, 221, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5670.99, 105.211, 4880.02, 243, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5674.12, 102.495, 4882.48, 265, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5675.57, 100.854, 4888.68, 271, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5675.74, 99.6217, 4894.49, 283, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5674.83, 98.6602, 4900.48, 298, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5673.6, 98.0414, 4914.17, 289, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5669.97, 98.1856, 4943.79, 274, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5634.83, 99.6907, 4947.25, 26, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5629.77, 99.652, 4943.37, 26, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5624.89, 99.6562, 4936.76, 51, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5614.51, 85.0745, 4934.35, 17, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5609.56, 85.5201, 4934.61, 8, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5604.12, 86.0608, 4934.86, 6, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5593.98, 86.7396, 4936.21, 1, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5589.03, 86.8932, 4935.14, 5, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5581.5, 86.8904, 4938.54, 355, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5573.38, 86.8804, 4939.49, 15, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5563.52, 86.7939, 4938.17, 26, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5556.85, 85.9805, 4939.7, 30, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5552.5, 85.7947, 4936.65, 30, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5545.65, 84.4988, 4936, 33, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5539.7, 85.0564, 4930.08, 51, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5529.92, 86.5969, 4924.54, 57, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5528.29, 87.9139, 4914.16, 111, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5530.56, 87.9868, 4909.18, 121, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5533.61, 87.8336, 4903.03, 120, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5538.85, 87.9519, 4893.86, 124, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5544.39, 88.508, 4883.01, 116, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5548.47, 89.1453, 4876.19, 123, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5553.78, 89.6179, 4868.44, 127, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5554.94, 91.5934, 4857.58, 137, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5558.35, 91.9272, 4853.33, 142, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5566.41, 91.8603, 4847.35, 181, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5581.99, 90.9849, 4844.1, 189, 0)
	spawnMobile("yavin4", "rep_jedi_knight", 300, -5570.18, 91.5533, 4845.85, 178, 0)

end

function Yavin4StaticSpawnsScreenPlay:setupSentinel(pSentinel)
	AiAgent(pSentinel):setAiTemplate("enclavesentinel")
	createObserver(OBJECTDESTRUCTION, "Yavin4StaticSpawnsScreenPlay", "notifySentinelDead", pSentinel)
	createEvent(30, "Yavin4StaticSpawnsScreenPlay", "rotateSentinel", pSentinel, "")
end

function Yavin4StaticSpawnsScreenPlay:rotateSentinel(pSentinel)
	if (pSentinel == nil or CreatureObject(pSentinel):isDead()) then
		return
	end

	if (CreatureObject(pSentinel):isInCombat()) then
		createEvent(30, "Yavin4StaticSpawnsScreenPlay", "rotateSentinel", pSentinel, "")
		return
	end

	local objName = SceneObject(pSentinel):getObjectName()

	if (objName == "rep_jedi_master") then
		SceneObject(pSentinel):updateDirection(-179)
	elseif (objName == "cis_jedi_master") then
		SceneObject(pSentinel):updateDirection(90)
	end

	createEvent(30, "Yavin4StaticSpawnsScreenPlay", "rotateSentinel", pSentinel, "")
end

function Yavin4StaticSpawnsScreenPlay:notifySentinelDead(pSentinel, pKiller)
	if (pSentinel == nil) then
		return 1
	end

	local objName = SceneObject(pSentinel):getObjectName()
	local objID = SceneObject(pSentinel):getObjectID()
	local sentinelID = readData(objID .. ":sentinelID")
	deleteData(objID .. ":sentinelID")

	if (objName == "rep_jedi_master") then
		createEvent(30, "Yavin4StaticSpawnsScreenPlay", "respawnLightSentinel", pSentinel, sentinelID)
	elseif (objName == "cis_jedi_master") then
		createEvent(30, "Yavin4StaticSpawnsScreenPlay", "respawnDarkSentinel", pSentinel, sentinelID)
	end

	return 1
end

function Yavin4StaticSpawnsScreenPlay:sentinelDefenderDropped(pSentinel)
	if (pSentinel == nil or CreatureObject(pSentinel):isDead()) then
		return 1
	end

	createEvent(10 * 1000, "Yavin4StaticSpawnsScreenPlay", "rotateSentinel", pSentinel, "")

	return 0
end

function Yavin4StaticSpawnsScreenPlay:respawnLightSentinel(pOldSentinel, sentinelID)
	local spawnLoc

	if (sentinelID == "1") then
		spawnLoc = { -5579.0, 87.7, 4908.5, -179 }
	else
		spawnLoc = { -5572.6, 87.7, 4908.2, -179 }
	end

	if (spawnLoc == nil) then
		return
	end

	local pSentinel = spawnMobile("yavin4", "rep_jedi_master", 0, spawnLoc[1], spawnLoc[2], spawnLoc[3], spawnLoc[4], 0)

	if (pSentinel ~= nil) then
		writeData(SceneObject(pSentinel):getObjectID() .. ":sentinelID", sentinelID)
		createEvent(10, "Yavin4StaticSpawnsScreenPlay", "setupSentinel", pSentinel, "")
	end
end

function Yavin4StaticSpawnsScreenPlay:respawnDarkSentinel(pOldSentinel, sentinelID)
	local spawnLoc

	if (sentinelID == "1") then
		spawnLoc = { 5074.2, 78.8, 313.9, 90 }
	else
		spawnLoc = { 5074.3, 79.2, 306.4, 90 }
	end

	if (spawnLoc == nil) then
		return
	end

	local pSentinel = spawnMobile("yavin4", "cis_jedi_master", 0, spawnLoc[1], spawnLoc[2], spawnLoc[3], spawnLoc[4], 0)

	if (pSentinel ~= nil) then
		writeData(SceneObject(pSentinel):getObjectID() .. ":sentinelID", sentinelID)
		createEvent(10, "Yavin4StaticSpawnsScreenPlay", "setupSentinel", pSentinel, "")
	end
end
