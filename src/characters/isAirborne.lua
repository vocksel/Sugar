--[[
	Checks if a character is currently airborne by their HumanoidStateType.
]]


local t = require(script.Parent.Parent.lib.t)

local isAirborneCheck = t.enum(Enum.HumanoidStateType)

local function isAirborne(state)
	assert(isAirborneCheck(state))

	return state == Enum.HumanoidStateType.Jumping
		or state == Enum.HumanoidStateType.Freefall
end

return isAirborne
