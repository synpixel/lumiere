local types = require(script.Parent.Parent.types)

local function createThrottle(): types.Throttle
	local throttleDuration = 0
	local lastTick = os.clock()

	local throttle = {}

	function throttle:getDeltaTime()
		return os.clock() - lastTick
	end

	function throttle:setDuration(duration)
		throttleDuration = duration
	end

	function throttle:try<T...>(callback, ...)
		local deltaTime = throttle:getDeltaTime()
		if deltaTime < throttleDuration then
			return
		end

		lastTick = os.clock()
		task.spawn(callback, ...)
	end

	return throttle
end

return createThrottle
