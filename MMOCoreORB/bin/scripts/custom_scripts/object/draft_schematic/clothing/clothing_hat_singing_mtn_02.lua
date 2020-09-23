object_draft_schematic_clothing_clothing_hat_singing_mtn_02 = object_draft_schematic_clothing_shared_clothing_hat_singing_mtn_02:new {

   templateType = DRAFTSCHEMATIC,

   customObjectName = "Singing Mountain Clan Frenzy Headcover",

   craftingToolTab = 8, -- (See DraftSchematicObjectTemplate.h)
   complexity = 19, 
   size = 3, 
   factoryCrateSize = 0,

    xpType = "crafting_clothing_general", 
   xp = 90, 

   assemblySkill = "clothing_assembly", 
   experimentingSkill = "clothing_experimentation", 
   customizationSkill = "clothing_customization", 

   customizationOptions = {2, 1},
   customizationStringNames = {"/private/index_color_1", "/private/index_color_2"},
   customizationDefaults = {133, 112},

   ingredientTemplateNames = {"craft_clothing_ingredients_n", "craft_clothing_ingredients_n", "craft_clothing_ingredients_n", "craft_clothing_ingredients_n"},
   ingredientTitleNames = {"shell", "binding_and_weatherproofing", "trim", "liner"},
   ingredientSlotType = {1, 0, 1, 1},
   resourceTypes = {"object/tangible/component/clothing/shared_synthetic_cloth.iff", "petrochem_inert", "object/tangible/component/clothing/shared_trim.iff", "object/tangible/component/clothing/shared_synthetic_cloth.iff"},
   resourceQuantities = {1, 40, 1, 1},
   contribution = {100, 100, 100, 100},

   targetTemplate = "object/tangible/wearables/hat/singing_mountain_clan_hat_s02.iff",

   additionalTemplates = {
             }

}
ObjectTemplates:addTemplate(object_draft_schematic_clothing_clothing_hat_singing_mtn_02, "object/draft_schematic/clothing/clothing_hat_singing_mtn_02.iff")
