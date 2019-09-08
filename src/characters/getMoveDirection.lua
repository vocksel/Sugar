--[[
	Gets the direction the character is currently moving in.

	Otherwise if the character is stationary, returns their LookVector.
]]

local t = require(script.Parent.Parent.lib.t)

local getMoveDirectionCheck = t.tuple(
	t.instanceOf("Model"),
	t.instanceOf("Humanoid")
)

local function getMoveDirection(character, humanoid)
	assert(getMoveDirectionCheck(character, humanoid))

	local direction = humanoid.MoveDirection

	if direction == Vector3.new(0, 0, 0) then
		return character:GetPrimaryPartCFrame().LookVector
	else
		return direction
	end
end

return getMoveDirection
