--[[
	Runs a function asynchronously in its own thread.

	This is similar to spawn(), but executes immediately instead of waiting an
	arbitrary amount of time before executing the wrapped code.

	Usage:

		async(function()
			print("do something")
		end)
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local import = require(ReplicatedStorage.lib.import)

local t = import("lib/t")

local asyncCheck = t.callback
local function async(callback)
	assert(asyncCheck(callback))

    local bindable = Instance.new("BindableEvent")

    bindable.Event:Connect(function()
        callback()
    end)

    bindable:Fire()
    bindable:Destroy()
end

return async
