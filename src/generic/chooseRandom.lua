--[[
	Returns a random item from the list.

	Usage:

		local item = chooseRandom({ 1, 2, 3, 4, 5 })
		print(item) -- 1/5 chance of getting any of them
]]


local t = require(script.Parent.Parent.lib.t)

local chooseRandomCheck = t.array(t.any)
local function chooseRandom(list)
	assert(chooseRandomCheck(list))

	local index = Random.new():NextInteger(1, #list)

	return list[index]
end

return chooseRandom
