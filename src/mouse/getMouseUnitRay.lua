--[[
	Gets the unit ray of the mouse's current location.

	Extend the location to see what was hit.
]]

local UserInputService = game:GetService("UserInputService")

local function getMouseUnitRay()
	local camera = workspace.CurrentCamera
	local location = UserInputService:GetMouseLoation()

	return camera:ViewportPointToRay(location.X, location.Y)
end

return getMouseUnitRay
