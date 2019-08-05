--[[
	Works like GetChildren, except it returns an object of { [child.Name]: child }
]]

local t = require(script.Parent.Parent.lib.t)

local getNamedChildrenCheck = t.Instance
local function getNamedChildren(instance)
	assert(getNamedChildrenCheck(instance))

	local children = {}
	for _, child in pairs(instance:GetChildren()) do
		children[child.Name] = child
	end
	return children
end

return getNamedChildren
