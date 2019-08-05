--[[
	Compares two colors to see if one is brighter than the other

	Used for testing to make sure that the colors are actually changing
	brightness.
]]

local t = require(script.Parent.Parent.lib.t)

local isBrighterCheck = t.tuple(t.Color3, t.Color3)
local function isBrighter(c1, c2)
	assert(isBrighterCheck(c1, c2))

	local h1, s1, v1 = Color3.toHSV(c1)
	local h2, s2, v2 = Color3.toHSV(c2)
	return (h1 > h2) or (s1 > s2) or (v1 > v2)
end

return isBrighter
