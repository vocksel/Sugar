--[[
	Brightens a color by a percentage. Useful for having one base color in UI and modifying another.

	Usage:

		local color = Color3.fromRGB(200, 200, 200)
		local brighterColor = brighten(color, 20)
]]

local t = require(script.Parent.Parent.lib.t)
local changeBrightness = require(script.Parent.changeBrightness)

local brightenCheck = t.tuple(t.Color3, t.integer)
local function brighten(color, percent)
	assert(brightenCheck(color, percent))

    return changeBrightness(color, percent)
end

return brighten
