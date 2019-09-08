return function()
	local new = require(script.Parent.Parent.generic.new)
	local visualizeRadius = require(script.Parent.visualizeRadius)

	local MOCK_PRIMARY = new({
		ClassName = "Part",
		Size = Vector3.new(3, 5, 3),
	})

	local MOCK_MODEL = new({
		ClassName = "Model",
		PrimaryPart = MOCK_PRIMARY,
	}, {
		Primary = MOCK_PRIMARY,
		Part = new({
			ClassName = "Part",
			Size = Vector3.new(1, 1, 1),
			-- Places it on top of the primary part
			Position = Vector3.new(0, (MOCK_PRIMARY.Size.Y/2)+(1/2), 0)
		}),
	})

	it("should create a new radius", function()
		local model = MOCK_MODEL:Clone()

		local size = 20
		local color = Color3.fromRGB(255, 0, 0)

		local part = visualizeRadius(size, model, color)
		local mesh = part:FindFirstChildOfClass("CylinderMesh")

		expect(part:IsDescendantOf(model)).to.equal(true)
		expect(part.Color).to.equal(color)
		expect(mesh).to.be.ok()
		expect(mesh.Scale).to.equal(Vector3.new(size, 1, size))
	end)

	it("should position the radius at the bottom of the model", function()
		local model = MOCK_MODEL:Clone()

		local part = visualizeRadius(20, model, Color3.fromRGB(255, 0, 0))

		local cframe, size = model:GetBoundingBox()
		local pos = cframe.p

		local bottom = Vector3.new(pos.X, cframe.p.Y - (size.Y / 2), pos.Z)

		expect(part.Position:FuzzyEq(bottom, 1)).to.equal(true)
	end)

	it("should be able to offset the radius to easily layer 2 or more", function()
		local model = MOCK_MODEL:Clone()

		local part1 = visualizeRadius(20, model, Color3.fromRGB(255, 0, 0), 0.1)
		local part2 = visualizeRadius(30, model, Color3.fromRGB(0, 255, 0), 0)

		expect(part1.Position.Y > part2.Position.Y).to.equal(true)
	end)
end
