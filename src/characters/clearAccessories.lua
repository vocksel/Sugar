--[[
	Clears out all the accessories from a character.

	This is useful when creating your own custom appearance code for characters,
	where you need to remove all their accessories and start fresh.

	Usage:

		clearaAccessories(workspace.Player1)
]]

local t = require(script.Parent.Parent.lib.t)

local clearAccessoriesCheck = t.instance("Model")
local function clearAccessories(character)
	assert(clearAccessoriesCheck(character))

	for _, child in pairs(character:GetChildren()) do
		if child:IsA("Accessory") then
			child:Destroy()
		end
	end
end

return clearAccessories
