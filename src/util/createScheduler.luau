local types = require(script.Parent.Parent.types)

local function createScheduler(): types.Scheduler
	local accumulator = 0

	local scheduler = {}
	scheduler.interval = 0

	function scheduler:setInterval(interval)
		scheduler.interval = interval
	end

	function scheduler:update(deltaTime, callback)
		local patchedDeltaTime = math.max(scheduler.interval, deltaTime) -- this prevents crashing

		accumulator += deltaTime

		if accumulator < patchedDeltaTime then
			return
		end

		while accumulator >= patchedDeltaTime do
			accumulator -= patchedDeltaTime
			task.spawn(callback, patchedDeltaTime)
		end
	end

	return scheduler
end

return createScheduler
