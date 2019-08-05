return function()
	local maybeCall = require(script.Parent.maybeCall)
	it("should call if it received a function", function()
		local wasRun = false

		local function callback()
			wasRun = true
		end

		maybeCall(callback)

		expect(wasRun).to.equal(true)
	end)

	it("should return the result of the callback", function()
		local function callback()
			return true
		end

		local success = maybeCall(callback)

		expect(success).to.equal(true)
	end)

	it("should take any number of arguments and pass them to the callback", function()
		local function callback(foo, bar, baz)
			expect(foo).to.equal("foo")
			expect(bar).to.equal("bar")
			expect(baz).to.equal("baz")
		end

		maybeCall(callback, "foo", "bar", "baz")
	end)

	it("should do nothing if it doesn't receive a function", function()
		expect(function()
			maybeCall(nil)
		end).to.never.throw()
	end)
end
