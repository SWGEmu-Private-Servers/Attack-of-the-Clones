object_draft_schematic_item_theme_park_wod_crafting_alter_3 = object_draft_schematic_item_theme_park_shared_wod_crafting_alter_3:new {
	templateType = DRAFTSCHEMATIC,

	customObjectName = "Altar of Wisdom Repair Parts",

	craftingToolTab = 4096, -- (See DraftSchematicObjectTemplate.h)
	complexity = 12,
	size = 1,
	factoryCrateSize = 0,

	xpType = "crafting_general",
	xp = 36,

	assemblySkill = "general_assembly",
	experimentingSkill = "general_experimentation",
	customizationSkill = "general_customization",

	customizationOptions = {},
	customizationStringNames = {},
	customizationDefaults = {},

	ingredientTemplateNames = {"craft_item_ingredients_n", "craft_item_ingredients_n", "craft_item_ingredients_n"},
	ingredientTitleNames = {"frame", "power_source", "mechanics"},
	ingredientSlotType = {0, 0, 0},
	resourceTypes = {"iron", "gas_inert", "aluminum"},
	resourceQuantities = {115, 30, 25},
	contribution = {100, 100, 100},

	targetTemplate = "object/tangible/theme_park/wod/wod_crafting_alter_key_3.ifff",

	additionalTemplates = {}
}
ObjectTemplates:addTemplate(object_draft_schematic_item_theme_park_wod_crafting_alter_3, "object/draft_schematic/item/theme_park/wod_crafting_alter_3.iff")
