local Players = game:GetService("Players")

local t = require(script.Parent.Parent.lib.t)
local getPlayerId = require(script.Parent.getPlayerId)

local getCharacterFromIdCheck = t.instanceOf("Model")
local function getIdFromCharacter(character)
	assert(getCharacterFromIdCheck(character))

	local player = Players:GetPlayerFromCharacter(character)

	if player then
		return getPlayerId(player)
	end
end

return getIdFromCharacter
