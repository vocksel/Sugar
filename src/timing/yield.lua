--[[
	Yields the current thread for the given amount of time.

	This is a better alternative to wait(), as the amount of time it waits is
	deterministic. This uses Heartbeat for consistent timing.

	Usage:

		yield(10)
		print("Hello")
		yield(10)
		print("World")
]]

local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local import = require(ReplicatedStorage.lib.import)

local t = import("lib/t")

local DEFAULT_WAIT = 0.01 -- less than 1 frame

local function yield(waitTime)
	assert(t.number(waitTime))

	local elapsed = 0

	waitTime = waitTime or DEFAULT_WAIT

	while elapsed < waitTime do
		elapsed = elapsed + RunService.Heartbeat:Wait()
	end

	return elapsed
end

return yield
