object_draft_schematic_furniture_city_wod_floating_stones_city = object_draft_schematic_furniture_city_shared_wod_floating_stones_city:new {
	templateType = DRAFTSCHEMATIC,

	customObjectName = "Singing Mountain Clan Floating Stones",

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

	ingredientTemplateNames = {"craft_furniture_ingredients_n", "craft_furniture_ingredients_n", "craft_furniture_ingredients_n", "craft_structure_ingredients_n"},
	ingredientTitleNames = {"base", "holocron_pedestal_surface", "panels", "magnetic_reaction_mass"},
	ingredientSlotType = {0, 0, 0, 0},
	resourceTypes = {"ore_extrusive", "ore_intrusive", "ore_siliclastic", "gemstone_crystalline"},
	resourceQuantities = {2000, 1000, 1000, 500},
	contribution = {100, 100, 100, 100},

	targetTemplate = "oobject/tangible/furniture/decorative/wod_floating_stones.iff",

	additionalTemplates = {
	}
}
ObjectTemplates:addTemplate(object_draft_schematic_furniture_city_wod_floating_stones_city, "object/draft_schematic/furniture/city/wod_floating_stones_city.iff")
