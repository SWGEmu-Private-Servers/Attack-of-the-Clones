object_draft_schematic_weapon_wod_war_fan = object_draft_schematic_weapon_shared_wod_war_fan:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Witches' War Fan",

	craftingToolTab = 1, -- (See DraftSchematicObjectTemplate.h)
	complexity = 35, 
	size = 1, 
	factoryCrateSize = 0,

	xpType = "crafting_weapons_general", 
	xp = 250, 

	assemblySkill = "weapon_assembly",
	experimentingSkill = "weapon_experimentation",
	customizationSkill = "weapon_customization",

	customizationOptions = {},
	customizationStringNames = {},
	customizationDefaults = {},

	ingredientTemplateNames = {"craft_weapon_ingredients_n", "craft_weapon_ingredients_n", "craft_weapon_ingredients_n", "craft_weapon_ingredients_n"},
	ingredientTitleNames = {"lance_shaft", "vibro_unit_and_power_cell_brackets", "grip", "vibration_generator"},
	ingredientSlotType = {0, 0, 0, 1},
	resourceTypes = {"steel_quadranium", "copper_polysteel", "fiberplast_dathomir", "object/tangible/component/weapon/shared_vibro_unit.iff"},
	resourceQuantities = {16, 11, 6, 1},
	contribution = {100, 100, 100, 100},


	targetTemplate = "object/weapon/melee/polearm/wod_war_fan.iff",

	additionalTemplates = {
	}

}
ObjectTemplates:addTemplate(object_draft_schematic_weapon_wod_war_fan, "object/draft_schematic/weapon/wod_war_fan.iff")
