object_tangible_loot_loot_schematic_wod_tower_schematic = object_tangible_loot_loot_schematic_shared_wod_tower_schematic:new {
	templateType = LOOTSCHEMATIC,
	objectMenuComponent = "LootSchematicMenuComponent",
	attributeListComponent = "LootSchematicAttributeListComponent",
	requiredSkill = "crafting_architect_master",
	targetDraftSchematic = "object/draft_schematic/structure/wod_sm_hut.iff",
	targetUseCount = 1

}

ObjectTemplates:addTemplate(object_tangible_loot_loot_schematic_wod_tower_schematic, "object/tangible/loot/loot_schematic/wod_tower_schematic.iff")
