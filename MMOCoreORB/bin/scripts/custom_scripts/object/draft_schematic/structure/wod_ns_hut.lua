object_draft_schematic_structure_wod_ns_hut = object_draft_schematic_structure_shared_wod_ns_hut:new {
	templateType = DRAFTSCHEMATIC,

	customObjectName = "Deed for: Nightsister Hut",

	craftingToolTab = 1024, -- (See DraftSchematicObjectTemplate.h)
	complexity = 12,
	size = 10,
	factoryCrateSize = 0,

	xpType = "crafting_structure_general",
	xp = 1000,

	assemblySkill = "structure_assembly",
	experimentingSkill = "structure_experimentation",
	customizationSkill = "structure_customization",

	customizationOptions = {},
	customizationStringNames = {},
	customizationDefaults = {},

	ingredientTemplateNames = {"craft_structure_ingredients_n", "craft_structure_ingredients_n", "craft_structure_ingredients_n", "craft_structure_ingredients_n", "craft_structure_ingredients_n", "craft_structure_ingredients_n"},
	ingredientTitleNames = {"base_structure_assembly", "frame_and_walls", "foundation", "lintel", "post", "another_post"},
	ingredientSlotType = {0, 0, 0, 0, 0, 0},
	resourceTypes = {"wood_deciduous_dathomir", "ore_siliclastic", "ore_low_grade", "ore_extrusive", "ore_extrusive", "ore_extrusive"},
	resourceQuantities = {300, 700, 500, 30, 30, 30},
	contribution = {100, 100, 100, 100, 100, 100},

	targetTemplate = "object/tangible/deed/player_house_deed/corellia_house_small_deed.iff",

	additionalTemplates = {}
}
ObjectTemplates:addTemplate(object_draft_schematic_structure_wod_ns_hut, "object/draft_schematic/structure/wod_ns_hut.iff")
