--[[
	Allows you to easily construct complex hierarchies of instances.

	This has been particularly useful in unit tests, as we can easily fake the
	DataModel.

	Usage:

		local mockDataModel = new({
			Name = "game"
		}, {
			ServerScriptService = newFolder({
				Script = Instance.new("Script")
			}),
			ReplicatedStorage = newFolder({
				Module = Instance.new("ModuleScript")
			})
		})
]]

local t = require(script.Parent.Parent.lib.t)

local newCheck = t.tuple(t.optional(t.table), t.optional(t.table))
local function new(props, children)
	assert(newCheck(props, children))

	local className = props and props.ClassName
	local instance = Instance.new(className or "Folder")

	if props then
		for prop, value in pairs(props) do
			instance[prop] = value
		end
	end

	if children then
		for name, child in pairs(children) do
			child.Name = name
			child.Parent = instance
		end
	end

	return instance
end

return new
