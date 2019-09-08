return function()
	local new = require(script.Parent.Parent.generic.new)
	local combineDescriptions = require(script.Parent.combineDescriptions)

	local MOCK_DESCRIPTION = new({
		ClassName = "HumanoidDescription",
		HairAccessory = "398672920",
		HatAccessory = "175134660,3702863892,264611665",
		BodyTypeScale = 0.75,
		TorsoColor = Color3.fromRGB(255, 201, 201),
	})

	it("should work with the documented example", function()
		local base = Instance.new("HumanoidDescription")
		base.HairAccessory = "1"
		base.NeckAccessory = "3"

		local override = Instance.new("HumanoidDescription")
		override.HairAccessory = "2"

		local combined = combineDescriptions(base, override)

		expect(combined.HairAccessory).to.equal("2")
		expect(combined.NeckAccessory).to.equal("3")
	end)

	it("should combine two HumanoidDescriptons", function()
		local base = MOCK_DESCRIPTION:Clone()
		local override = new({
			ClassName = "HumanoidDescription",
			HatAccessory = "175134660",
			TorsoColor = Color3.fromRGB(255, 0, 0),
		})

		local combined = combineDescriptions(base, override)

		expect(combined.HairAccessory).to.equal(base.HairAccessory)
		expect(combined.BodyTypeScale).to.equal(base.BodyTypeScale)
		expect(combined.HatAccessory).to.equal(override.HatAccessory)
		expect(combined.TorsoColor).to.equal(override.TorsoColor)
	end)
end
