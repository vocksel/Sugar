--[[
	Connects to an event for the next time it's triggered.

	A common idiom is to keep a reference to the connection around and
	disconnect it inside the listener. This function abstracts that.

	Usage:

		-- This will only fire for the next player to join the game
		onNextEvent(game.Players.PlayerAdded, function(player)
			print(player, "is the lucky player!")
		end)
]]

local t = require(script.Parent.Parent.lib.t)

local onNextEventCheck = t.tuple(t.any, t.callback)
local function onNextEvent(event, callback)
	assert(onNextEventCheck(event, callback))

	local conn

    conn = event:Connect(function(...)
        local result = callback(...)
        if result == nil or result == true then
            conn:Disconnect()
        end
    end)
end

return onNextEvent
