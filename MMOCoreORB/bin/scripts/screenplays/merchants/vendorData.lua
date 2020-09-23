EventVendorLogic = VendorLogic:new {
	scriptName = "EventVendorLogic",
	curenncies = {
	--For Tokens: Displayed Name, full template string (without shared_), if applicable: ScreenPlayData string, ScreenPlayData key
		{currency = "token", name = "Event Tokens", template = "object/tangible/loot/misc/event_token.iff", ScreenPlayDataString = "vendorToken", ScreenPlayDataKey = "event_token"},
	},
	--Displayed Name, full template string (without shared_), cost in {}, use the same structure as currencies
	merchandise = {
		{name = "DX Disruptor Array", template = "object/tangible/component/vehicle/dx_disruptor_array.iff", cost = {5,}},
	},
}

registerScreenPlay("EventVendorLogic", false)
