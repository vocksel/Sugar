local t = require(script.Parent.Parent.lib.t)

local getPlayerIdCheck = t.instanceOf("Player")
local function getPlayerId(player)
	assert(getPlayerIdCheck(player))

	return tostring(player.UserId)
end

return getPlayerId
