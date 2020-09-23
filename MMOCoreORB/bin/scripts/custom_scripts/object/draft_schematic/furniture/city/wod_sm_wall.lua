object_draft_schematic_furniture_city_wod_sm_wall = object_draft_schematic_furniture_city_shared_wod_sm_wall:new {
	templateType = DRAFTSCHEMATIC,

	customObjectName = "Singing Mountain Clan Wall",

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
	ingredientTitleNames = {"wall_section", "post", "binding"},
	ingredientSlotType = {0, 0, 0},
	resourceTypes = {"ore_extrusive", "ore_sedimentary", "hide_leathery_dathomir"},
	resourceQuantities = {500, 250, 100},
	contribution = {100, 100, 100},

	targetTemplate = "object/tangible/furniture/decorative/wod_sm_wall.iff",

	additionalTemplates = {
	}
}
ObjectTemplates:addTemplate(object_draft_schematic_furniture_city_wod_sm_wall, "object/draft_schematic/furniture/city/wod_sm_wall.iff")
