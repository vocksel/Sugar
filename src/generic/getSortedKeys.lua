--[[
	Returns an array of keys from the given object, sorted alphabetically.

	This is used so we get a consistent, alphabetical output for tables.
	Typically dicctionary-like tables aren't sorted, so this fixes that.

	Usage:

		local object = {
			delta = true,
			alpha = true,
			bravo = true,
		}

		local keys = getSortedKeys(object)

		for _, key in pairs(keys) do
			print(key)
		end

		-- "alpha"
		-- "bravo"
		-- "delta"
]]

local t = require(script.Parent.Parent.lib.t)

local getSortedKeysCheck = t.table
local function getSortedKeys(object)
	assert(getSortedKeysCheck(object))

    local keys = {}

    for k in pairs(object) do
        table.insert(keys, k)
    end

    table.sort(keys)

    return keys
end

return getSortedKeys
