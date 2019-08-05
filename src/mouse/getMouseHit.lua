--[[
	Gets the object hit in the mouse's path.
]]

local t = require(script.Parent.Parent.lib.t)
local getMouseUnitRay = require(script.Parent.getMouseUnitRay)

local getMouseHitCheck = t.array(t.Instance)
local function getMouseHit(ignoreList)
	assert(getMouseHitCheck(ignoreList))

	local unitRay = getMouseUnitRay()
	local ray = Ray.new(unitRay.Origin, unitRay.Direction * math.huge)
	local hit = workspace:FindPartOnRayWithIgnoreList(ray, ignoreList)

	return hit
end

return getMouseHit
