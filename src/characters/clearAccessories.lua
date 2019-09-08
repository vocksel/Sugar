--[[
	Clears out all the accessories from a character.

	This is used before we call loadAccessories() so that we only have the
	accessories from the outfit.
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
