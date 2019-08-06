local t = require(script.Parent.Parent.lib.t)

local getUserIdCheck = t.instanceOf("Player")
local function getUserId(player)
	assert(getUserIdCheck(player))

	return tostring(player.UserId)
end

return getUserId
