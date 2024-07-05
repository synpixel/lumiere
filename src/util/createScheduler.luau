local types = require(script.Parent.Parent.types)

local function createScheduler(): types.Scheduler
	local updateInterval = 0
	local accumulator = 0

	local scheduler = {}

	function scheduler:getDeltaTime()
		return updateInterval
	end

	function scheduler:setInterval(interval)
		updateInterval = interval
	end

	function scheduler:update<T...>(deltaTime, callback, ...)
		accumulator += deltaTime

		if accumulator < updateInterval then
			return
		end

		while accumulator >= updateInterval do
			accumulator -= updateInterval
			task.spawn(callback, ...)
		end
	end

	return scheduler
end

return createScheduler
