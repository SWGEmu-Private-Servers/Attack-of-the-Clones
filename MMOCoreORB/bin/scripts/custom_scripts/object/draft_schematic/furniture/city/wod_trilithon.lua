object_draft_schematic_furniture_city_wod_trilithon = object_draft_schematic_furniture_city_shared_wod_trilithon:new {
	templateType = DRAFTSCHEMATIC,

	customObjectName = "Singing Mountain Clan Trilithon",

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

	ingredientTemplateNames = {"craft_structure_ingredients_n", "craft_structure_ingredients_n", "craft_structure_ingredients_n", "craft_structure_ingredients_n", "craft_structure_ingredients_n", "craft_structure_ingredients_n"},
	ingredientTitleNames = {"post", "another_post", "lintel", "binding", "large_disc", "small_disc"},
	ingredientSlotType = {0, 0, 0, 0, 0, 0},
	resourceTypes = {"ore_sedimentary", "ore_sedimentary", "hide_leathery_dathomir", "hide_leathery_dathomir", "wood_deciduous_dathomir", "wood_deciduous_dathomir"},
	resourceQuantities = {500, 500, 350, 150, 350, 150},
	contribution = {100, 100, 100, 100, 100, 100},

	targetTemplate = "object/tangible/furniture/decorative/wod_trilithon.iff",

	additionalTemplates = {
	}
}
ObjectTemplates:addTemplate(object_draft_schematic_furniture_city_wod_trilithon, "object/draft_schematic/furniture/city/wod_trilithon.iff")
