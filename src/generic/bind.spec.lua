return function()
	local bind = require(script.Parent.bind)

	it("should allow you to call the method without the instance", function()
		local obj = {
			str = "Example",
			foo = function(self)
				return self.str
			end
		}

		local method = bind(obj, obj.foo)

		expect(method()).to.equal("Example")
	end)
end
