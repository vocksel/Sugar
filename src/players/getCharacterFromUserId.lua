--[[
	Gets a character from their player's UserId.
]]

local t = require(script.Parent.Parent.lib.t)

local getPlayerFromId = require(script.Parent.getPlayerFromId)

local getCharacterFromIdCheck = t.string
local function getCharacterFromId(userId)
	assert(getCharacterFromIdCheck(userId))

	local player = getPlayerFromId(userId)
	if player then
		return player.Character
	end
end

return getCharacterFromId
