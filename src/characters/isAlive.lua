--[[
	Checks if the given character is still alive.

	This is useful to check various things about the character, such as if
	they're still in the DatModel, as well as if the Humanoid is alive.
]]

local t = require(script.Parent.Parent.lib.t)

local isAliveCheck = t.optional(t.instanceOf("Model"))

local function isAlive(character)
	assert(isAliveCheck(character))

	if character and character:IsDescendantOf(workspace) then
		local humanoid = character:FindFirstChild("Humanoid")

		if humanoid and humanoid.Health ~= 0 then
			return true
		end
	end
	return false
end

return isAlive
