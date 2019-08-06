--[[
	Binds a method with its object so that it can be used independently.

	This is useful when exposing a method when you don't also want to attach the
	object to it. For example, when exporting an API.

	Usage:

		local obj = {
			str = "Example",
			foo = function(self)
				print(self.str)
			end
		}

		local method = bind(obj, obj.foo)

		print(method()) -- "Example"
]]

local t = require(script.Parent.Parent.lib.t)

local bindCheck = t.tuple(t.table, t.callback)
local function bind(obj, method)
	assert(bindCheck(obj, method))

	return function(...)
		return method(obj, ...)
	end
end

return bind
