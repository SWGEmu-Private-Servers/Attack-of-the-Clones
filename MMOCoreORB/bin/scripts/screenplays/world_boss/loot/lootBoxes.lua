LootBoxesScreenplay = ScreenPlay:new {

  screenplayName = "LootBoxesScreenplay",
  lootGroups = {
		{
			groups = {
				{group = "color_crystals", chance = 160000},
				{group = "junk", chance = 8240000},
				{group = "rifles", chance = 500000},
				{group = "pistols", chance = 500000},
				--{group = "clothing_attachments", chance = 300000},
				--{group = "armor_attachments", chance = 300000}
			},
			lootChance = 8000000
		}
	},
  lootLevel = 100,
  lootContainersOffset = 2,
  lootAmount = 3,

}

registerScreenPlay("LootBoxesScreenplay", false)


function LootBoxesScreenplay:spawnLoot(player)
  -- Spawn loot in a range around the admin that just fired this command
  local playerTable = SceneObject(player):getPlayersInRange(32)

	if (playerTable == nil) then
		return
	end

  for i = 1, #playerTable, 1 do
		local pPlayer = playerTable[i]

		if (pPlayer ~= nil) then
			if (not CreatureObject(pPlayer):isDead()) then
				CreatureObject(pPlayer):setPosture(KNOCKEDDOWN)
        CreatureObject(pPlayer):sendSystemMessage("You've received some AOTC Loot bag goodies!")
			end

      -- Add to inventory?
      local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

  		if (pInventory ~= nil) then
  			local pBag = giveItem(pInventory, "object/tangible/container/general/satchel.iff", -1)
        self:spawnContainerLootStack(pBag)
        self:setCustomName(pBag, "AoTC Loot Bag")
        print("Stack anti-corruption Logging - Spawning AOTC Loot bags in 32m radius for " .. #playerTable .. " Players")

  			if (pBag == nil) then
  				printLuaError("Error creating loot satchel for player: " .. CreatureObject(pPlayer):getFirstName())
  			end
  		end

		end

  end -- END FOR LOOP

end


function ScreenPlay:spawnContainerLootStack(pContainer)
	local container = SceneObject(pContainer)


	--createLootFromCollection(pContainer, self.lootGroups, self.lootLevel)


	return 0
end
