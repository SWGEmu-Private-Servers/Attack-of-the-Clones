local QuestManager = require("managers.quest.quest_manager")

wodRepairAltar1MenuComponent = {}

function wodRepairAltar1MenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end

	if (not CreatureObject(pPlayer):isInRangeWithObject(pSceneObject, 5)) then
		return
	end

	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_REPAIR_ALTAR_01_01) or QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_REPAIR_ALTAR_01_01)) then
		menuResponse:addRadialMenuItem(20, 3, "@theme_park_wod/wod:investigate_altar")
	end

	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_REPAIR_ALTAR_01_02) or QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_REPAIR_ALTAR_01_02)) then
		menuResponse:addRadialMenuItem(21, 3, "@theme_park_wod/wod:repair_altar")
	end
	menuResponse:addRadialMenuItem(22, 3, "@theme_park_wod/wod:read_inscription")
end

function wodRepairAltar1MenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end

	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return false
	end

	if (selectedID == 20) then
		PlayerObject(pGhost):addRewardedSchematic("object/draft_schematic/weapon/wod_crafting_alter_1.iff", 2, -1, true)
		CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:schematic_learned_altar")

		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_REPAIR_ALTAR_01_01)) then
			QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_NS_REPAIR_ALTAR_01_01)
			QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_NS_REPAIR_ALTAR_01_02)
		else
			QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_SM_REPAIR_ALTAR_01_01)
			QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_REPAIR_ALTAR_01_02)
		end
	end
	if (selectedID == 21) then
		local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
		
		if (pInventory == nil) then
			return
		end

		local pItem = getContainerObjectByTemplate(pInventory, "object/tangible/theme_park/wod/wod_crafting_alter_key_1.iff", true)

		if (pItem == nil) then
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:no_altar_item")
			return
		end

		lightValue = LuaComponent(pItem):getAttributeValue("wod_altar_1_1")
		darkValue = LuaComponent(pItem):getAttributeValue("wod_altar_1_2")
		wisdomValue = LuaComponent(pItem):getAttributeValue("wod_altar_1_3")

		if (lightValue == darkValue and lightValue + darkValue <= wisdomValue) then
			PlayerObject(pGhost):removeRewardedSchematic("object/draft_schematic/weapon/wod_crafting_alter_1.iff", true)
			if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_REPAIR_ALTAR_01_02)) then
				QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_NS_REPAIR_ALTAR_01_02)
				QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_NS_REPAIR_ALTAR_01_03)
				wodNSRepairAltar01ReturnGoto:start(pPlayer)
			else
				QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_SM_REPAIR_ALTAR_01_02)
				QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_REPAIR_ALTAR_01_03)
				wodSMRepairAltar01ReturnGoto:start(pPlayer)
			end
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:repair_complete")
		else
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:no_repair")
		end
		SceneObject(pItem):destroyObjectFromWorld()
	end
	if (selectedID == 22) then
		CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:altar_inscription_1")
	end
	return 0
end

wodRepairAltar2MenuComponent = {}

function wodRepairAltar2MenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end

	if (not CreatureObject(pPlayer):isInRangeWithObject(pSceneObject, 5)) then
		return
	end

	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_REPAIR_ALTAR_02_01) or QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_REPAIR_ALTAR_02_01)) then
		menuResponse:addRadialMenuItem(20, 3, "@theme_park_wod/wod:investigate_altar")
	end

	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_REPAIR_ALTAR_02_02) or QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_REPAIR_ALTAR_02_02)) then
		menuResponse:addRadialMenuItem(21, 3, "@theme_park_wod/wod:rancor_returned_sm")
	end
	menuResponse:addRadialMenuItem(22, 3, "@theme_park_wod/wod:read_inscription")
end

function wodRepairAltar2MenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end

	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return false
	end

	if (selectedID == 20) then		
		PlayerObject(pGhost):addRewardedSchematic("object/draft_schematic/weapon/wod_crafting_alter_2.iff", 2, -1, true)
		CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:schematic_learned_altar")

		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_REPAIR_ALTAR_02_01)) then
			QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_NS_REPAIR_ALTAR_02_01)
			QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_NS_REPAIR_ALTAR_02_02)
		else
			QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_SM_REPAIR_ALTAR_02_01)
			QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_REPAIR_ALTAR_02_02)
		end
	end
	if (selectedID == 21) then
		local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

		if (pInventory == nil) then
			return
		end

		local pItem = getContainerObjectByTemplate(pInventory, "object/tangible/theme_park/wod/wod_crafting_alter_key_2.iff", true)

		if (pItem == nil) then
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:no_altar_item")
			return
		end

		lightValue = LuaComponent(pItem):getAttributeValue("wod_altar_2_1")
		darkValue = LuaComponent(pItem):getAttributeValue("wod_altar_2_2")
		wisdomValue = LuaComponent(pItem):getAttributeValue("wod_altar_2_3")
		powerValue = LuaComponent(pItem):getAttributeValue("wod_altar_2_4")

		if (lightValue == darkValue and lightValue == wisdomValue and lightValue == powerValue) then
			PlayerObject(pGhost):removeRewardedSchematic("object/draft_schematic/weapon/wod_crafting_alter_2.iff", true)
			if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_REPAIR_ALTAR_02_02)) then
				QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_NS_REPAIR_ALTAR_02_02)
				QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_NS_REPAIR_ALTAR_02_03)
				wodNSRepairAltar02ReturnGoto:start(pPlayer)
			else
				QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_SM_REPAIR_ALTAR_02_02)
				QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_REPAIR_ALTAR_02_03)
				wodSMRepairAltar02ReturnGoto:start(pPlayer)
			end
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:repair_complete")
		else
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:no_repair")
		end
		SceneObject(pItem):destroyObjectFromWorld()
	end
	if (selectedID == 22) then
		CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:altar_inscription_2")
	end
	return 0
end

wodRepairAltar3MenuComponent = {}

function wodRepairAltar3MenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end

	if (not CreatureObject(pPlayer):isInRangeWithObject(pSceneObject, 5)) then
		return
	end

	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_REPAIR_ALTAR_03_01) or QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_REPAIR_ALTAR_03_01)) then
		menuResponse:addRadialMenuItem(20, 3, "@theme_park_wod/wod:investigate_altar")
	end

	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_REPAIR_ALTAR_03_02) or QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_REPAIR_ALTAR_03_02)) then
		menuResponse:addRadialMenuItem(21, 3, "@theme_park_wod/wod:rancor_returned_sm")
	end
	menuResponse:addRadialMenuItem(22, 3, "@theme_park_wod/wod:read_inscription")
end

function wodRepairAltar3MenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end

	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return false
	end

	if (selectedID == 20) then		
		PlayerObject(pGhost):addRewardedSchematic("object/draft_schematic/weapon/wod_crafting_alter_3.iff", 2, -1, true)
		CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:schematic_learned_altar")

		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_REPAIR_ALTAR_03_01)) then
			QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_NS_REPAIR_ALTAR_03_01)
			QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_NS_REPAIR_ALTAR_03_02)
		else
			QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_SM_REPAIR_ALTAR_03_01)
			QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_REPAIR_ALTAR_03_02)
		end
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:repair_complete")
	end
	if (selectedID == 21) then
		local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

		if (pInventory == nil) then
			return
		end

		local pItem = getContainerObjectByTemplate(pInventory, "object/tangible/theme_park/wod/wod_crafting_alter_key_2.iff", true)
		
		if (pItem == nil) then
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:no_altar_item")
			return
		end

		wisdomValue = LuaComponent(pItem):getAttributeValue("wod_altar_3_1")
		powerValue = LuaComponent(pItem):getAttributeValue("wod_altar_3_2")
		ageValue = LuaComponent(pItem):getAttributeValue("wod_altar_3_3")

		if (wisdomValue < powerValue and powerValue < powerValue) then
			PlayerObject(pGhost):removeRewardedSchematic("object/draft_schematic/weapon/wod_crafting_alter_3.iff", true)
			if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_REPAIR_ALTAR_03_02)) then
				QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_NS_REPAIR_ALTAR_03_02)
				QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_NS_REPAIR_ALTAR_03_03)
				wodNSRepairAltar03ReturnGoto:start(pPlayer)
			else
				QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_SM_REPAIR_ALTAR_03_02)
				QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_REPAIR_ALTAR_03_03)
				wodSMRepairAltar03ReturnGoto:start(pPlayer)
			end
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:repair_complete")
		else
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:no_repair")
		end
		SceneObject(pItem):destroyObjectFromWorld()
	end
	if (selectedID == 22) then
		CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:altar_inscription_3")
	end
	return 0
end

wodRepairAltar4MenuComponent = {}

function wodRepairAltar4MenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end

	if (not CreatureObject(pPlayer):isInRangeWithObject(pSceneObject, 5)) then
		return
	end

	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_REPAIR_ALTAR_04_01) or QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_REPAIR_ALTAR_04_01)) then
		menuResponse:addRadialMenuItem(20, 3, "@theme_park_wod/wod:investigate_altar")
	end

	if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_REPAIR_ALTAR_04_02) or QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_SM_REPAIR_ALTAR_04_02)) then
		menuResponse:addRadialMenuItem(21, 3, "@theme_park_wod/wod:rancor_returned_sm")
	end
	menuResponse:addRadialMenuItem(22, 3, "@theme_park_wod/wod:read_inscription")
end

function wodRepairAltar4MenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
	if (pSceneObject == nil or pPlayer == nil) then
		return
	end

	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return false
	end

	if (selectedID == 20) then		
		PlayerObject(pGhost):addRewardedSchematic("object/draft_schematic/weapon/wod_crafting_alter_4.iff", 2, -1, true)
		CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:schematic_learned_altar")

		if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_REPAIR_ALTAR_04_01)) then
			QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_NS_REPAIR_ALTAR_04_01)
			QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_NS_REPAIR_ALTAR_04_02)
		else
			QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_SM_REPAIR_ALTAR_04_01)
			QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_REPAIR_ALTAR_04_02)
		end
	end
	if (selectedID == 21) then
		local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

		if (pInventory == nil) then
			return
		end

		local pItem = getContainerObjectByTemplate(pInventory, "object/tangible/theme_park/wod/wod_crafting_alter_key_2.iff", true)
		
		if (pItem == nil) then
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:no_altar_item")
			return
		end

		powerValue = LuaComponent(pItem):getAttributeValue("wod_altar_4_1")
		trustValue = LuaComponent(pItem):getAttributeValue("wod_altar_4_2")
		friendshipValue = LuaComponent(pItem):getAttributeValue("wod_altar_4_3")
		loyaltyValue = LuaComponent(pItem):getAttributeValue("wod_altar_4_4")

		if (trustValue == friendshipValue and trustValue == loyaltyValue and trustValue * 2 <= powerValue) then
			PlayerObject(pGhost):removeRewardedSchematic("object/draft_schematic/weapon/wod_crafting_alter_4.iff", true)
			if (QuestManager.hasActiveQuest(pPlayer, QuestManager.quests.WOD_NS_REPAIR_ALTAR_04_02)) then
				QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_NS_REPAIR_ALTAR_04_02)
				QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_NS_REPAIR_ALTAR_04_03)
				wodNSRepairAltar04ReturnGoto:start(pPlayer)
			else
				QuestManager.completeQuest(pPlayer, QuestManager.quests.WOD_SM_REPAIR_ALTAR_04_02)
				QuestManager.activateQuest(pPlayer, QuestManager.quests.WOD_SM_REPAIR_ALTAR_04_03)
				wodSMRepairAltar04ReturnGoto:start(pPlayer)
			end
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:repair_complete")
		else
			CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:no_repair")
		end
		SceneObject(pItem):destroyObjectFromWorld()
	end
	if (selectedID == 22) then
		CreatureObject(pPlayer):sendSystemMessage("@theme_park_wod/wod:altar_inscription_4")
	end
	return 0
end