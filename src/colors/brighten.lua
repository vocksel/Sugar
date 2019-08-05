local t = require(script.Parent.Parent.lib.t)
local changeBrightness = require(script.Parent.changeBrightness)

local brightenCheck = t.tuple(t.Color3, t.integer)
local function brighten(color, percent)
	assert(brightenCheck(color, percent))

    return changeBrightness(color, percent)
end

return brighten
