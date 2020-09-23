object_draft_schematic_weapon_wod_scyth = object_draft_schematic_weapon_shared_wod_scyth:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "One-Handed Boline",

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

	ingredientTemplateNames = {"craft_weapon_ingredients_n", "craft_weapon_ingredients_n", "craft_weapon_ingredients_n"},
	ingredientTitleNames = {"sword_core_jacket", "grip", "jacketed_sword_core"},
	ingredientSlotType = {0, 0, 1},
	resourceTypes = {"steel_quadranium", "fiberplast_dathomir", "object/tangible/component/weapon/shared_sword_core.iff"},
	resourceQuantities = {24, 10, 1},
	contribution = {100, 100, 100},


	targetTemplate = "object/weapon/melee/polearm/wod_scyth.iff",

	additionalTemplates = {
	}

}
ObjectTemplates:addTemplate(object_draft_schematic_weapon_wod_scyth, "object/draft_schematic/weapon/wod_scyth.iff")
