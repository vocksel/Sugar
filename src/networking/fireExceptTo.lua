--[[
	Fires the given event to all players except the one passed in.

	This is used for replication. Typically one player will perform an action
	locally, then tell the server about it. The server then verifies and tells
	all clients except the one that just performed the action to do the same.
]]

local Players = game:GetService("Players")

local function fireExceptTo(player, event, ...)
	for _, other in pairs(Players:GetPlayers()) do
		if other ~= player then
			event:FireClient(other, ...)
		end
	end
end

return fireExceptTo
