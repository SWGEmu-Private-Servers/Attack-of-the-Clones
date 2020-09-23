wodStandingSignSkillMenuComponent = {}

function wodStandingSignSkillMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end
	
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	menuResponse:addRadialMenuItem(20, 3, "Learn Sign")
end

function wodStandingSignSkillMenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end

	if (selectedID == 20) then
		if (SceneObject(pSceneObject):isASubChildOf(pPlayer) == false) then
			CreatureObject(pPlayer):sendSystemMessage("You need to have this item in your inventory to learn it.")
			return 0
		end
		
		if (CreatureObject(pPlayer):hasSkill("loot_sign_01")) then
			CreatureObject(pPlayer):sendSystemMessage("You already know this sign.")
			return 0
		end
		
		awardSkill(pPlayer, "loot_sign_01")
		SceneObject(pSceneObject):destroyObjectFromWorld()
	end
	return 0
end

wodHangingSignSkillMenuComponent = {}

function wodHangingSignSkillMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end
	
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	menuResponse:addRadialMenuItem(20, 3, "Learn Sign")
end

function wodHangingSignSkillMenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end

	if (selectedID == 20) then
		if (SceneObject(pSceneObject):isASubChildOf(pPlayer) == false) then
			CreatureObject(pPlayer):sendSystemMessage("You need to have this item in your inventory to learn it.")
			return 0
		end
		
		if (CreatureObject(pPlayer):hasSkill("loot_sign_02")) then
			CreatureObject(pPlayer):sendSystemMessage("You already know this sign.")
			return 0
		end
		
		awardSkill(pPlayer, "loot_sign_02")
		SceneObject(pSceneObject):destroyObjectFromWorld()
	end
	return 0
end

wodBanner1SignSkillMenuComponent = {}

function wodBanner1SignSkillMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end
	
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	menuResponse:addRadialMenuItem(20, 3, "Learn Sign")
end

function wodBanner1SignSkillMenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end

	if (selectedID == 20) then
		if (SceneObject(pSceneObject):isASubChildOf(pPlayer) == false) then
			CreatureObject(pPlayer):sendSystemMessage("You need to have this item in your inventory to learn it.")
			return 0
		end
		
		if (CreatureObject(pPlayer):hasSkill("loot_sign_03")) then
			CreatureObject(pPlayer):sendSystemMessage("You already know this sign.")
			return 0
		end
		
		awardSkill(pPlayer, "loot_sign_03")
		SceneObject(pSceneObject):destroyObjectFromWorld()
	end
	return 0
end

wodBanner2SignSkillMenuComponent = {}

function wodBanner2SignSkillMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end
	
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	menuResponse:addRadialMenuItem(20, 3, "Learn Sign")
end

function wodBanner2SignSkillMenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end

	if (selectedID == 20) then
		if (SceneObject(pSceneObject):isASubChildOf(pPlayer) == false) then
			CreatureObject(pPlayer):sendSystemMessage("You need to have this item in your inventory to learn it.")
			return 0
		end
		
		if (CreatureObject(pPlayer):hasSkill("loot_sign_04")) then
			CreatureObject(pPlayer):sendSystemMessage("You already know this sign.")
			return 0
		end
		
		awardSkill(pPlayer, "loot_sign_04")
		SceneObject(pSceneObject):destroyObjectFromWorld()
	end
	return 0
end

wodBanner3SignSkillMenuComponent = {}

function wodBanner3SignSkillMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end
	
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	menuResponse:addRadialMenuItem(20, 3, "Learn Sign")
end

function wodBanner3SignSkillMenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end

	if (selectedID == 20) then
		if (SceneObject(pSceneObject):isASubChildOf(pPlayer) == false) then
			CreatureObject(pPlayer):sendSystemMessage("You need to have this item in your inventory to learn it.")
			return 0
		end
		
		if (CreatureObject(pPlayer):hasSkill("loot_sign_05")) then
			CreatureObject(pPlayer):sendSystemMessage("You already know this sign.")
			return 0
		end
		
		awardSkill(pPlayer, "loot_sign_05")
		SceneObject(pSceneObject):destroyObjectFromWorld()
	end
	return 0
end