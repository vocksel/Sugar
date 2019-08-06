--[[
	Gets a character from their player's UserId.
]]

local t = require(script.Parent.Parent.lib.t)

local getPlayerFromUserId = require(script.Parent.getPlayerFromUserId)

local getCharacterFromUserIdCheck = t.string
local function getCharacterFromUserId(userId)
	assert(getCharacterFromUserIdCheck(userId))

	local player = getPlayerFromUserId(userId)
	if player then
		return player.Character
	end
end

return getCharacterFromUserId
