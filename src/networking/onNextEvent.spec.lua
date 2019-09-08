return function()
	local onNextEvent = require(script.Parent.onNextEvent)

	it("should stop listening after the event fires", function()
		local bindable = Instance.new("BindableEvent")
		local callCount = 0

		onNextEvent(bindable.Event, function()
			callCount = callCount + 1
		end)

		bindable:Fire()
		bindable:Fire()

		expect(callCount).to.equal(1)
	end)
end
