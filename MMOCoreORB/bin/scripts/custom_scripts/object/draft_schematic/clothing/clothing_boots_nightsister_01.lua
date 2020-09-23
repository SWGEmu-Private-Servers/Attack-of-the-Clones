object_draft_schematic_clothing_clothing_boots_nightsister_01 = object_draft_schematic_clothing_shared_clothing_boots_nightsister_01:new {

   templateType = DRAFTSCHEMATIC,

   customObjectName = "Nightsister Intricate Boots",

    craftingToolTab = 8, -- (See DraftSchematicObjectTemplate.h)
   complexity = 14,
   size = 4,
	factoryCrateSize = 0,

   xpType = "crafting_clothings_general",
   xp = 90,

   assemblySkill = "clothing_assembly",
   experimentingSkill = "clothing_experimentation",
   customizationSkill = "clothing_customization",

   customizationOptions = {2, 1},
   customizationStringNames = {"/private/index_color_1", "/private/index_color_2"},
   customizationDefaults = {125, 131},

   ingredientTemplateNames = {"craft_clothing_ingredients_n", "craft_clothing_ingredients_n", "craft_clothing_ingredients_n", "craft_clothing_ingredients_n", "craft_clothing_ingredients_n"},
   ingredientTitleNames = {"body", "binding_and_hardware", "liner", "sole", "reinforcement"},
   ingredientSlotType = {0, 1, 0, 0, 1},
   resourceTypes = {"fiberplast", "object/tangible/component/clothing/shared_metal_fasteners.iff", "hide_wooly", "petrochem_inert_polymer", "object/tangible/component/clothing/shared_fiberplast_panel.iff"},
   resourceQuantities = {25, 1, 10, 10, 1},
   contribution = {100, 100, 100, 100, 100},


   targetTemplate = "object/tangible/wearables/boots/nightsister_boots.iff",

   additionalTemplates = {
             }

}
ObjectTemplates:addTemplate(object_draft_schematic_clothing_clothing_boots_nightsister_01, "object/draft_schematic/clothing/clothing_boots_nightsister_01.iff")
