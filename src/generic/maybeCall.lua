--[[
	Calls the given function if it actually exists.

	Useful in Roact components where a callback passed as a prop is optional, so
	you don't always know if you want to run it.

	Usage:

		maybeCall(nil) -- does nothing

		maybeCall(function()
			print("Hello!") -- prints hello
		end)
]]

local t = require(script.Parent.Parent.lib.t)

local maybeCallCheck = t.union(t.callback, t.none)
local function maybeCall(callback, ...)
	assert(maybeCallCheck(callback))

	if type(callback) == "function" then
		return callback(...)
	end
end

return maybeCall
