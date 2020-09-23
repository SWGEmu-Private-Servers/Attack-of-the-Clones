object_tangible_loot_loot_schematic_wod_ns_hut = object_tangible_loot_loot_schematic_shared_wod_ns_hut:new {
	templateType = LOOTSCHEMATIC,
	objectMenuComponent = "LootSchematicMenuComponent",
	attributeListComponent = "LootSchematicAttributeListComponent",
	requiredSkill = "crafting_architect_master",
	targetDraftSchematic = "object/draft_schematic/structure/wod_ns_hut.iff",
	targetUseCount = 1

}

ObjectTemplates:addTemplate(object_tangible_loot_loot_schematic_wod_ns_hut, "object/tangible/loot/loot_schematic/wod_ns_hut.iff")
