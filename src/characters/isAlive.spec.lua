return function()
	local isAlive = require(script.Parent.isAlive)

	local function withMockCharacter(callback)
		local character = Instance.new("Model")
		character.Parent = workspace
		character.Name = "Character"

		local humanoid = Instance.new("Humanoid")
		humanoid.Parent = character

		callback(character)

		character:Destroy()
	end

	it("should return false if the charcter has no humanoid", function()
		withMockCharacter(function(character)
			character.Humanoid:Destroy()
			expect(isAlive(character)).to.equal(false)
		end)
	end)

	it("should return false if the character is nil", function()
		expect(isAlive(nil)).to.equal(false)
	end)

	it("should return false if the character is outside of the workspace", function()
		withMockCharacter(function(character)
			character.Parent = nil
			expect(isAlive(character)).to.equal(false)
		end)
	end)

	it("should return false if the humanoid is dead", function()
		withMockCharacter(function(character)
			character.Humanoid.Health = 0
			expect(isAlive(character)).to.equal(false)
		end)
	end)

	it("should return true otherwise", function()
		withMockCharacter(function(character)
			expect(isAlive(character)).to.equal(true)
		end)
	end)
end
