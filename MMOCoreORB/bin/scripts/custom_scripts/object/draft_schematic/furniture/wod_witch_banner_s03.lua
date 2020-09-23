object_draft_schematic_furniture_wod_witch_banner_s03 = object_draft_schematic_furniture_shared_wod_witch_banner_s03:new {
	templateType = DRAFTSCHEMATIC,

	customObjectName = "Hanging Banner: The Crone",

	craftingToolTab = 1024, -- (See DraftSchematicObjectTemplate.h)
	complexity = 13,
	size = 4,
	factoryCrateSize = 0,

	xpType = "crafting_structure_general",
	xp = 100,

	assemblySkill = "structure_assembly",
	experimentingSkill = "structure_experimentation",
	customizationSkill = "structure_customization",

	customizationOptions = {},
	customizationStringNames = {},
	customizationDefaults = {},

	ingredientTemplateNames = {"craft_furniture_ingredients_n", "craft_furniture_ingredients_n", "craft_furniture_ingredients_n"},
	ingredientTitleNames = {"frame", "paint", "canvas"},
	ingredientSlotType = {0, 0, 0},
	resourceTypes = {"wood_deciduous_dathomir", "fruit_berries_dathomir", "hide_leathery_dathomir"},
	resourceQuantities = {20, 20, 20},
	contribution = {100, 100, 100},

	targetTemplate = "object/tangible/theme_park/wod/wod_witch_banner_s03.iff",

	additionalTemplates = {
	}
}
ObjectTemplates:addTemplate(object_draft_schematic_furniture_wod_witch_banner_s03, "object/draft_schematic/furniture/wod_witch_banner_s03.iff")
