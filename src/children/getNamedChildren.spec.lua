return function()
	local new = require(script.Parent.Parent.generic.new)
	local getNamedChildren = require(script.Parent.getNamedChildren)

	it("should return a map of instance names to instances", function()
		local parent = new(nil, {
			Part = Instance.new("Part"),
			Module = Instance.new("ModuleScript")
		})

		local namedChildren = getNamedChildren(parent)

		print(require(script.Parent.Parent.debug.pretty)(namedChildren))

		expect(namedChildren.Part).to.be.ok()
		expect(namedChildren.Module).to.be.ok()
	end)
end
