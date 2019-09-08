return function()
	local new = require(script.Parent.Parent.generic.new)
	local clearAccessories = require(script.Parent.clearAccessories)

	local MOCK_CHARACTER = new({
		ClassName = "Model"
	}, {
		Accessory1 = Instance.new("Accessory"),
		Accessory2 = Instance.new("Accessory"),
		Accessory3 = Instance.new("Accessory"),
		Part = new({ ClassName = "Part" }),
	})

	it("should clear out all the accessories", function()
		local character = MOCK_CHARACTER:Clone()

		expect(#character:GetChildren()).to.equal(4)

		clearAccessories(character)

		expect(#character:GetChildren()).to.equal(1)
	end)
end
