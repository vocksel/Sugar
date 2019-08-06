local Players = game:GetService("Players")

local t = require(script.Parent.Parent.lib.t)

local getPlayerFromUserCheck = t.string
local function getPlayerFromUserId(userId)
	assert(getPlayerFromUserCheck(userId))

	for _, player in pairs(Players:GetPlayers()) do
		if player.UserId == tonumber(userId) then
			return player
		end
	end
end

return getPlayerFromUserId
