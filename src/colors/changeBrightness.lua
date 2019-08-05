local t = require(script.Parent.Parent.lib.t)

local changeBrightnessCheck = t.tuple(t.Color3, t.integer)
local function changeBrightness(color, percent)
	assert(changeBrightnessCheck(color, percent))

	local h, s, v = Color3.toHSV(color)

    return Color3.fromHSV(h, s, math.clamp(v+(v*percent/100), 0, 1))
end

return changeBrightness
