local ObjectManager = require("managers.object.object_manager")
local Logger = require("utils.logger")

CreatureData = ScreenPlay:new {

}


-- Shows a progress GUI on the target
function CreatureData:showProgressGUI(pPlayer, pAdminPlayer)

end


function CreatureData:mainSuiCallback(pPlayer, pSui, eventIndex, args)
	--local cancelPressed = (eventIndex == 1)
end


function CreatureData:resetAll(pPlayer)

end

function CreatureData:onPlayerLoggedIn(pPlayer)
	if (pPlayer == nil) then
		return
	end

end

return CreatureData
