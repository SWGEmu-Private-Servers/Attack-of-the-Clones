object_draft_schematic_furniture_city_wod_tower = object_draft_schematic_furniture_city_shared_wod_tower:new {
	templateType = DRAFTSCHEMATIC,

	customObjectName = "Nightsister Tower",

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

	ingredientTemplateNames = {"craft_structure_ingredients_n", "craft_structure_ingredients_n", "craft_structure_ingredients_n"},
	ingredientTitleNames = {"frame_and_walls", "load_bearing_frame_and_reinforcement", "roof"},
	ingredientSlotType = {0, 0, 0},
	resourceTypes = {"ore_sedimentary", "wood_deciduous_dathomir", "ore_siliclastic"},
	resourceQuantities = {2000, 50, 500},
	contribution = {100, 100, 100},

	targetTemplate = "object/tangible/furniture/decorative/wod_tower.iff",

	additionalTemplates = {
	}
}
ObjectTemplates:addTemplate(object_draft_schematic_furniture_city_wod_tower, "object/draft_schematic/furniture/city/wod_tower.iff")
