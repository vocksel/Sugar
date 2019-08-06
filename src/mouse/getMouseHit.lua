--[[
	Returns the BasePart that the mouse hit.

	Works the same as `Player:GetMouse().Hit` but allows you to pass in an ignore list, instead of relying on TargetFilter.

	Usage:

		local mouseHit = getMouseHit()

		-- Or with an ignore list:
		local mouseHit = getMouseHit({ LocalPlayer.Character, workspace.Foo})
]]

local t = require(script.Parent.Parent.lib.t)
local getMouseUnitRay = require(script.Parent.getMouseUnitRay)

local getMouseHitCheck = t.optional(t.array(t.Instance))
local function getMouseHit(ignoreList)
	assert(getMouseHitCheck(ignoreList))

	local unitRay = getMouseUnitRay()
	local ray = Ray.new(unitRay.Origin, unitRay.Direction * math.huge)
	local hit = workspace:FindPartOnRayWithIgnoreList(ray, ignoreList)

	return hit
end

return getMouseHit
