object_draft_schematic_item_theme_park_wod_crafting_scanner_interface = object_draft_schematic_item_theme_park_shared_wod_crafting_scanner_interface:new {
	templateType = DRAFTSCHEMATIC,

	customObjectName = "Crafting Scanner Interface",

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

	ingredientTemplateNames = {"craft_item_ingredients_n", "craft_item_ingredients_n", "craft_item_ingredients_n", "craft_item_ingredients_n"},
	ingredientTitleNames = {"frame", "power_source", "mechanics", "logic_unit_component"},
	ingredientSlotType = {0, 0, 0, 3},
	resourceTypes = {"steel", "gas_reactive", "copper", "object/tangible/content/shared_wod_logic_unit_componenet.iff"},
	resourceQuantities = {115, 30, 25, 1},
	contribution = {100, 100, 100, 100},

	targetTemplate = "object/tangible/wearables/bracelet/bracelet_wod_crafting_l.iff",

	additionalTemplates = {}
}
ObjectTemplates:addTemplate(object_draft_schematic_item_theme_park_wod_crafting_scanner_interface, "object/draft_schematic/item/theme_park/wod_crafting_scanner_interface.iff")
