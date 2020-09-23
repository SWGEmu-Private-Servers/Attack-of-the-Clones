object_draft_schematic_furniture_wod_pro_tree_05 = object_draft_schematic_furniture_shared_wod_pro_tree_05:new {
	templateType = DRAFTSCHEMATIC,

	customObjectName = "Medium Potted Tree Style I",

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
	ingredientTitleNames = {"staves", "hoops", "water", "fertilizer"},
	ingredientSlotType = {0, 0, 0, 0},
	resourceTypes = {"mineral", "chemical", "water", "flora_resources"},
	resourceQuantities = {40, 40, 30, 30},
	contribution = {100, 100, 100, 100},

	targetTemplate = "object/tangible/furniture/decorative/wod_pro_tree_05.iff",

	additionalTemplates = {}

}
ObjectTemplates:addTemplate(object_draft_schematic_furniture_wod_pro_tree_05, "object/draft_schematic/furniture/wod_pro_tree_05.iff")
