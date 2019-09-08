--[[
	Checks if a character is currently on the ground by their HumanoidStateType.
]]

local t = require(script.Parent.Parent.lib.t)

local isGroundedCheck = t.enum(Enum.HumanoidStateType)

local function isGrounded(state)
	assert(isGroundedCheck(state))

	return state == Enum.HumanoidStateType.Running
		or state == Enum.HumanoidStateType.RunningNoPhysics
		or state == Enum.HumanoidStateType.Landed
end

return isGrounded
