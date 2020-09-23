object_tangible_loot_loot_schematic_wod_ns_gate_schematic = object_tangible_loot_loot_schematic_shared_wod_ns_gate_schematic:new {
	templateType = LOOTSCHEMATIC,
	objectMenuComponent = "LootSchematicMenuComponent",
	attributeListComponent = "LootSchematicAttributeListComponent",
	requiredSkill = "crafting_architect_master",
	targetDraftSchematic = "object/draft_schematic/furniture/wod_ns_gate.iff",
	targetUseCount = 1
}

ObjectTemplates:addTemplate(object_tangible_loot_loot_schematic_wod_ns_gate_schematic, "object/tangible/loot/loot_schematic/wod_ns_gate_schematic.iff")
