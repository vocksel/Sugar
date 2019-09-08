return function()
	local new = require(script.Parent.Parent.generic.new)
	local loadAccessories = require(script.Parent.loadAccessories)

	local MOCK_CHARACTER = new({
		ClassName = "Model"
	}, {
		Humanoid = new({
			ClassName = "Humanoid",
			RigType = Enum.HumanoidRigType.R15, -- Suppresses a warning about scaling
		}),
		HumanoidRootPart = Instance.new("Part")
	})

	it("should load all the given accessories onto the character", function()
		local character = MOCK_CHARACTER:Clone()

		expect(#character:GetChildren()).to.equal(2)

		local accessory1 = Instance.new("Accessory")
		accessory1.Name = "Accessory1"

		local accessory2 = Instance.new("Accessory")
		accessory2.Name = "Accessory2"

		loadAccessories(character.Humanoid, { accessory1, accessory2 })

		expect(#character:GetChildren()).to.equal(4)
		expect(character.Accessory1).to.be.ok()
		expect(character.Accessory2).to.be.ok()
	end)
end
