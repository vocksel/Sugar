local t = require(script.Parent.Parent.lib.t)

local debounceCheck = t.tuple(t.number, t.callback)

local function debounce(waitTime, callback)
	assert(debounceCheck(waitTime, callback))

	local isReady = true

	return function(...)
		if not isReady then return end

		isReady = false

		callback(...)
		wait(waitTime)

		isReady = true
	end
end

return debounce
