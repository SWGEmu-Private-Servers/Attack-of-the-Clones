object_tangible_loot_loot_schematic_wod_ns_wall_schematic = object_tangible_loot_loot_schematic_shared_wod_ns_wall_schematic:new {
	templateType = LOOTSCHEMATIC,
	objectMenuComponent = "LootSchematicMenuComponent",
	attributeListComponent = "LootSchematicAttributeListComponent",
	requiredSkill = "crafting_architect_master",
	targetDraftSchematic = "object/draft_schematic/furniture/city/wod_ns_wall.iff",
	targetUseCount = 1
}

ObjectTemplates:addTemplate(object_tangible_loot_loot_schematic_wod_ns_wall_schematic, "object/tangible/loot/loot_schematic/wod_ns_wall_schematic.iff")
