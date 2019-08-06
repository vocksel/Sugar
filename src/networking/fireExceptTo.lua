--[[
	Fires the given event to all players except the one passed in.

	This is used for replication. Typically one player will perform an action
	locally, then tell the server about it. The server then verifies and tells
	all clients except the one that just performed the action to do the same.

	Usage:

		-- Client
		local function changeBaseplateColor()
			local newColor = Color3.fromRGB(255, 0, 0)
			workspace.Baseplate.Color = newColor
			changeColorEvent:FireServer(newColor)
		end

		changeColorEvent.OnClientEvent:Connect(function(color)
			workspace.Baseplate.Color = color
		end)

		changeBaseplateColor()

		-- Server
		changeColorEvent.OnServerEvent:Connect(function(player, color)
			fireExceptTo(player, changeColorEvent, color)
		end)
]]

local Players = game:GetService("Players")

local t = require(script.Parent.Parent.lib.t)

local fireExceptToCheck = t.tuple(
	t.instanceOf("Player"),
	t.instanceOf("RemoteEvent")
)
local function fireExceptTo(player, event, ...)
	assert(fireExceptToCheck(player, event))

	for _, other in pairs(Players:GetPlayers()) do
		if other ~= player then
			event:FireClient(other, ...)
		end
	end
end

return fireExceptTo
