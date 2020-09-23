object_draft_schematic_clothing_clothing_shirt_nightsister_03 = object_draft_schematic_clothing_shared_clothing_shirt_nightsister_03:new {

   templateType = DRAFTSCHEMATIC,

   customObjectName = "Nightsister Havoc Habit",

   craftingToolTab = 8, -- (See DraftSchematicObjectTemplate.h)
   complexity = 21, 
   size = 3, 
   factoryCrateSize = 0,

   xpType = "crafting_clothing_general", 
   xp = 75, 

   assemblySkill = "clothing_assembly", 
   experimentingSkill = "clothing_experimentation", 
   customizationSkill = "clothing_customization", 

   customizationOptions = {2, 1},
   customizationStringNames = {"/private/index_color_1", "/private/index_color_2"},
   customizationDefaults = {17, 18},

   ingredientTemplateNames = {"craft_clothing_ingredients_n", "craft_clothing_ingredients_n", "craft_clothing_ingredients_n"},
   ingredientTitleNames = {"body", "trim", "binding_and_hardware"},
   ingredientSlotType = {1, 0, 0},
   resourceTypes = {"object/tangible/component/clothing/shared_reinforced_fiber_panels.iff", "fiberplast", "metal"},
   resourceQuantities = {1, 20, 10},
   contribution = {100, 100, 100},


   targetTemplate = "object/tangible/wearables/shirt/nightsister_shirt_s03.iff",

   additionalTemplates = {
             }

}
ObjectTemplates:addTemplate(object_draft_schematic_clothing_clothing_shirt_nightsister_03, "object/draft_schematic/clothing/clothing_shirt_nightsister_03.iff")
