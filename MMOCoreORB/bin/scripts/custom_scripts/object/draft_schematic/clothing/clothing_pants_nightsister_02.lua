object_draft_schematic_clothing_clothing_pants_nightsister_02 = object_draft_schematic_clothing_shared_clothing_pants_nightsister_02:new {

   templateType = DRAFTSCHEMATIC,

   customObjectName = "Nightsister Scourge Leggings",

   craftingToolTab = 1, -- (See DraftSchematicObjectTemplate.h)
   complexity = 17,
   size = 3,
   factoryCrateSize = 0,

   xpType = "crafting_clothing_general", 
   xp = 100, 

   assemblySkill = "clothing_assembly", 
   experimentingSkill = "clothing_experimentation", 
   customizationSkill = "clothing_customization", 

   customizationOptions = {2, 1},
   customizationStringNames = {"/private/index_color_1", "/private/index_color_2"},
   customizationDefaults = {67, 48},

   ingredientTemplateNames = {"craft_clothing_ingredients_n", "craft_clothing_ingredients_n", "craft_clothing_ingredients_n", "craft_clothing_ingredients_n"},
   ingredientTitleNames = {"body", "binding_and_reinforcement", "hardware", "lining"},
   ingredientSlotType = {1, 0, 1, 1},
   resourceTypes = {"object/tangible/component/clothing/shared_reinforced_fiber_panels.iff", "petrochem_inert", "object/tangible/component/clothing/shared_metal_fasteners.iff", "object/tangible/component/clothing/shared_synthetic_cloth.iff"},
   resourceQuantities = {1, 40, 2, 2},
   contribution = {100, 100, 100, 100},


   targetTemplate = "object/tangible/wearables/pants/nightsister_pants_s02.iff",

   additionalTemplates = {
             }

}
ObjectTemplates:addTemplate(object_draft_schematic_clothing_clothing_pants_nightsister_02, "object/draft_schematic/clothing/clothing_pants_nightsister_02.iff")
