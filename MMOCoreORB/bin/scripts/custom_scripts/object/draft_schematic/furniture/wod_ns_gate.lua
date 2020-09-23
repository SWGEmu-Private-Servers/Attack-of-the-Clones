object_draft_schematic_furniture_wod_ns_gate = object_draft_schematic_furniture_shared_wod_ns_gate:new {
	templateType = DRAFTSCHEMATIC,

	customObjectName = "Nightsister-Style Gate",

	craftingToolTab = 1024, -- (See DraftSchematicObjectTemplate.h)
	complexity = 27,
	size = 12,
	factoryCrateSize = 0,

	xpType = "crafting_structure_general",
	xp = 9000,

	assemblySkill = "structure_assembly",
	experimentingSkill = "structure_experimentation",
	customizationSkill = "structure_customization",

	customizationOptions = {},
	customizationStringNames = {},
	customizationDefaults = {},

	ingredientTemplateNames = {"craft_furniture_ingredients_n", "craft_furniture_ingredients_n", "craft_furniture_ingredients_n", "craft_structure_ingredients_n", "craft_structure_ingredients_n"},
	ingredientTitleNames = {"frame", "paint", "canvas", "post", "binding"},
	ingredientSlotType = {0, 0, 0, 0, 0},
	resourceTypes = {"wood_deciduous_dathomir", "fruit_berries_dathomir", "hide_leathery_dathomir", "ore_sedimentary", "hide_leathery_dathomir"},
	resourceQuantities = {2000, 350, 350, 200, 200},
	contribution = {100, 100, 100, 100, 100},

	targetTemplate = "object/tangible/furniture/decorative/wod_ns_gate.iff",

	additionalTemplates = {
	}
}
ObjectTemplates:addTemplate(object_draft_schematic_furniture_wod_ns_gate, "object/draft_schematic/furniture/wod_ns_gate.iff")
