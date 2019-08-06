return function()
	it("should require everything without error", function()
		expect(function()
			require(script.Parent)
		end).to.never.throw()
	end)
end
