--[[
	Converts a value into a nicely formatted string.

	This is mostly used for tables as a way to inspect the contents. inspect.lua
	is the next best thing, but is a bit slow and bogs things down if used in
	succession. This function is a lot more lightweight.

	Usage:

		local t = {
			foo = true,
			bar = false
		}

		print(pretty(t))
]]

local t = require(script.Parent.Parent.lib.t)
local getSortedKeys = require(script.Parent.Parent.generic.getSortedKeys)

local prettyCheck = t.tuple(t.any, t.optional(t.integer))
local function pretty(value, indentLevel)
	assert(prettyCheck(value, indentLevel))

    indentLevel = indentLevel or 0

    local output = {}
    local indent = "    "

    if typeof(value) == "table" then
        table.insert(output, "{\n")

        for _, k in pairs(getSortedKeys(value)) do
			local indentation = indent:rep(indentLevel+1)
			local otherValue = pretty(value[k], indentLevel+1)

			table.insert(output, ("%s %s = %s\n"):format(indentation, k, otherValue))
        end

        table.insert(output, ("%s}"):format(indent:rep(indentLevel)))
    elseif typeof(value) == "string" then
		table.insert(output, ("%q (string)"):format(value))
    else
		table.insert(output, ("%s (%s)"):format(tostring(value), typeof(value)))
    end

    return table.concat(output)
end

return pretty
