local t = require(script.Parent.Parent.lib.t)
local changeBrightness = require(script.Parent.changeBrightness)

local darkenCheck = t.tuple(t.Color3, t.integer)
local function darken(color, percent)
	assert(darkenCheck(color, percent))

    return changeBrightness(color, -percent)
end

return darken
