--[[
	Returns a unit ray from the camera to the mouse's position.

	This is useful in conjunction with other code to make longer rays that shoot
	towards the direction of the mouse.

	Usage:

		local unitRay = getMouseRay()
		local ray = new Ray(unitRay.Origin, unitRay.Direction.mul(math.huge))
]]

local UserInputService = game:GetService("UserInputService")

local function getMouseUnitRay()
	local camera = workspace.CurrentCamera
	local location = UserInputService:GetMouseLoation()

	return camera:ViewportPointToRay(location.X, location.Y)
end

return getMouseUnitRay
