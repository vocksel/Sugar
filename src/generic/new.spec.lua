return function()
	local new = require(script.Parent.new)

	it("should default to a folder", function()
		local instance = new()
		expect(instance:IsA("Folder")).to.equal(true)
	end)

	it("should optionally take a list of properties", function()
		local withProps = new({
			Name = "Sample",
		})

		expect(withProps.Name).to.equal("Sample")
	end)

	it("should optionally take a map of children", function()
		local withChildren = new(nil, {
			Part = Instance.new("Part"),
		})

		expect(withChildren.Part).to.be.ok()
	end)

	it("should be able to mimic the DataModel", function()
		local mockDataModel = new({
			Name = "game"
		}, {
			ServerScriptService = new(nil, {
				Script = Instance.new("Script")
			}),
			ReplicatedStorage = new(nil, {
				Module = Instance.new("ModuleScript")
			})
		})

		expect(mockDataModel.Name).to.equal("game")
		expect(mockDataModel.ServerScriptService).to.be.ok()
		expect(mockDataModel.ServerScriptService.Script).to.be.ok()
		expect(mockDataModel.ReplicatedStorage).to.be.ok()
		expect(mockDataModel.ReplicatedStorage.Module).to.be.ok()
	end)
end
