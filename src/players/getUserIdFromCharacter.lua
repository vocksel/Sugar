local Players = game:GetService("Players")

local t = require(script.Parent.Parent.lib.t)
local getUserId = require(script.Parent.getUserId)

local getCharacterFromUserIdCheck = t.instanceOf("Model")
local function getUserIdFromCharacter(character)
	assert(getCharacterFromUserIdCheck(character))

	local player = Players:GetPlayerFromCharacter(character)

	if player then
		return getUserId(player)
	end
end

return getUserIdFromCharacter
