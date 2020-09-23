object_draft_schematic_furniture_wod_ns_potted_plant_scem_03 = object_draft_schematic_furniture_shared_wod_ns_potted_plant_scem_03:new {
	templateType = DRAFTSCHEMATIC,

	customObjectName = "Potted Plant Style III",

	craftingToolTab = 512, -- (See DraftSchematicObjectTemplate.h)
	complexity = 15,
	size = 2,
	factoryCrateSize = 0,

	xpType = "crafting_structure_general",
	xp = 160,

	assemblySkill = "structure_assembly",
	experimentingSkill = "structure_experimentation",
	customizationSkill = "structure_customization",

	customizationOptions = {},
	customizationStringNames = {},
	customizationDefaults = {},

	ingredientTemplateNames = {"craft_furniture_ingredients_n", "craft_furniture_ingredients_n", "craft_furniture_ingredients_n", "craft_furniture_ingredients_n"},
	ingredientTitleNames = {"pot", "sealant", "water", "fertilizer"},
	ingredientSlotType = {0, 0, 0, 0},
	resourceTypes = {"mineral", "chemical", "water", "flora_resources"},
	resourceQuantities = {30, 30, 20, 20},
	contribution = {100, 100, 100, 100},

	targetTemplate = "object/tangible/furniture/decorative/wod_ns_potted_plant_03.iff",

	additionalTemplates = {}

}
ObjectTemplates:addTemplate(object_draft_schematic_furniture_wod_ns_potted_plant_scem_03, "object/draft_schematic/furniture/wod_ns_potted_plant_scem_03.iff")
