RestussRepVendorLogic = VendorLogic:new {
	scriptName = "RestussRepVendorLogic",
	currencies = {
	--For Tokens: Displayed Name, full template string (without shared_), if applicable: ScreenPlayData string, ScreenPlayData key
		{currency = "token", name = "Restuss Commendations", template = "object/tangible/loot/misc/event_token_restuss.iff", ScreenPlayDataString = "vendorToken", ScreenPlayDataKey = "event_token"},
	},
	--Displayed Name, full template string (without shared_), cost in {}, use the same structure as currencies
	merchandise = {
{name = "Large Block Turret", template = "object/tangible/deed/faction_perk/turret/block_lg_deed.iff", cost = {30}},
{name = "Medium Block Turret", template = "object/tangible/deed/faction_perk/turret/block_med_deed.iff", cost = {20}},
{name = "Small Block Turret", template = "object/tangible/deed/faction_perk/turret/block_sm_deed.iff", cost = {10}},
{name = "Large Dish Turret", template = "object/tangible/deed/faction_perk/turret/dish_lg_deed.iff", cost = {30}},
{name = "Small Dish Turret", template = "object/tangible/deed/faction_perk/turret/dish_sm_deed.iff", cost = {10}},
{name = "Large Tower Turret", template = "object/tangible/deed/faction_perk/turret/tower_lg_deed.iff", cost = {30}},
{name = "Medium Tower Turret", template = "object/tangible/deed/faction_perk/turret/tower_med_deed.iff", cost = {20}},
{name = "Small Tower Turret", template = "object/tangible/deed/faction_perk/turret/tower_sm_deed.iff", cost = {10}},
{name = "DC-15 Carbine Schematic", template = "object/tangible/loot/loot_schematic/dc15_carbine_schematic.iff", cost = {30}},
{name = "DC-15A Rifle Schematic", template = "object/tangible/loot/loot_schematic/dc15_rifle_schematic.iff", cost = {30}},
{name = "Disruptor Rifle Schematic", template = "object/tangible/loot/loot_schematic/mustafar_disruptor_rifle_schematic.iff", cost = {30}},
{name = "E5 Carbine Schematic", template = "object/tangible/loot/loot_schematic/e5_carbine_schematic.iff", cost = {30}},
	},
}

registerScreenPlay("RestussRepVendorLogic", false)
