local Players = game:GetService("Players")

local t = require(script.Parent.Parent.lib.t)

local getPlayerFromIdCheck = t.string
local function getPlayerFromId(userId)
	assert(getPlayerFromIdCheck(userId))

	for _, player in pairs(Players:GetPlayers()) do
		if player.UserId == tonumber(userId) then
			return player
		end
	end
end

return getPlayerFromId
