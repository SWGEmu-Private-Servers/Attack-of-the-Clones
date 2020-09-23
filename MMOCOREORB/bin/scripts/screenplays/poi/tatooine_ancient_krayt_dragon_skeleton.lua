AncientKraytSkeletonScreenPlay = ScreenPlay:new {
	numberOfActs = 1,

}

registerScreenPlay("AncientKraytSkeletonScreenPlay", true)

function AncientKraytSkeletonScreenPlay:start()
	if (isZoneEnabled("tatooine")) then
		self:spawnMobiles()
	end
end

function AncientKraytSkeletonScreenPlay:spawnMobiles()

	spawnMobile("tatooine", "krayt_dragon_grand", 1800, -4555.0, 49.3, -4459.2, -116, 0)
	spawnMobile("tatooine", "krayt_dragon_ancient", 1800, -4713.1, 46.5, -4288.3, 50, 0)
	spawnMobile("tatooine", "giant_canyon_krayt_dragon", 1800, -4669.8, 30.1, -4477.7, 5, 0)
	spawnMobile("tatooine", "canyon_krayt_dragon", 1800, -4528.8, 28.3, -4302.4, 144, 0)
	spawnMobile("tatooine", "juvenile_canyon_krayt_dragon", 1200, -4521.3, 27.2, -4298.2, 144, 0)
	spawnMobile("tatooine", "krayt_dragon_adolescent", 1800, -4747.2, 32.5, -4424.8, -91, 0)

	-- Additional Krayts...
spawnMobile("tatooine", "krayt_dragon_adolescent", 1800, -4357.66, 53.4281, -4662.03, 257, 0)
spawnMobile("tatooine", "krayt_dragon_grand", 1800, -4316.79, 22.4563, -4197.57, 281, 0)
spawnMobile("tatooine", "giant_canyon_krayt_dragon", 1800, -4506.46, 42.6573, -4038.62, 213, 0)
spawnMobile("tatooine", "krayt_dragon_adolescent", 1800, -4864.03, 27.6843, -4042.61, 190, 0)
spawnMobile("tatooine", "krayt_dragon_adolescent", 1800, -4546.06, 45.7002, -4941.21, 146, 0)
spawnMobile("tatooine", "giant_canyon_krayt_dragon", 1800, -4536.3, 47.8401, -4977.65, 146, 0)
spawnMobile("tatooine", "krayt_dragon_adolescent", 1800, -4312.84, 25.0206, -5008.96, 269, 0)
spawnMobile("tatooine", "krayt_dragon_ancient", 1800, -4001.09, 22.1251, -4272.67, 153, 0)

-- Nearby Pod
spawnMobile("tatooine", "krayt_dragon_ancient", 1800, -6197.31, 31.2349, -3181.88, 179, 0)
spawnMobile("tatooine", "krayt_dragon_adolescent", 1800, -6582.19, 81.8896, -3621.37, 104, 0)

end
