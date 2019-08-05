--[[
	Picks a random item from a list!
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local import = require(ReplicatedStorage.lib.import)

local t = import("lib/t")

local chooseRandomCheck = t.array(t.any)
local function chooseRandom(list)
	assert(chooseRandomCheck(list))

	local index = Random.new():NextInteger(1, #list)

	return list[index]
end

return chooseRandom
