return function()
	local isBrighter = require(script.Parent.isBrighter)
	local darken = require(script.Parent.darken)

	local PERCENT = 10
	local TEST_COLOR = Color3.fromRGB(200, 200, 200)

	it("should return a Color3", function()
		local color = darken(TEST_COLOR, PERCENT)
		expect(typeof(color)).to.equal("Color3")
	end)

	it("should make the color darker", function()
		local color = darken(TEST_COLOR, PERCENT)
		expect(isBrighter(color, TEST_COLOR)).to.equal(false)
	end)
end
