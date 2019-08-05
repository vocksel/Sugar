return function()
	local getSortedKeys = require(script.Parent.getSortedKeys)

	it("should sort the keys of an object into alphabetical order", function()
		local object = {
			delta = true,
			alpha = true,
			bravo = true,
		}

		local keys = getSortedKeys(object)

		expect(keys[1]).to.equal("alpha")
		expect(keys[2]).to.equal("bravo")
		expect(keys[3]).to.equal("delta")
	end)
end
