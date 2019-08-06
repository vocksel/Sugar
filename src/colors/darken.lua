--[[
	Darkens a color by a percentage. Useful for having one base color in UI and
	modifying another.

	Usage:

		local color = Color3.fromRGB(200, 200, 200)
		local darkerColor = darken(color, 20)
]]

local t = require(script.Parent.Parent.lib.t)
local changeBrightness = require(script.Parent.changeBrightness)

local darkenCheck = t.tuple(t.Color3, t.integer)
local function darken(color, percent)
	assert(darkenCheck(color, percent))

    return changeBrightness(color, -percent)
end

return darken
