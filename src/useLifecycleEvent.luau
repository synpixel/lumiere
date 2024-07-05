local types = require(script.Parent.types)
local createThrottle = require(script.Parent.util.createThrottle)

local function useLifecycleEvent(rbxScriptSignal: RBXScriptSignal): types.LifecycleEvent
	local throttle = createThrottle()
	throttle:setDuration(0)

	local lifecycleEvent = {}

	function lifecycleEvent:withDesiredFramerate(framerate)
		throttle:setDuration(1 / framerate)
		return lifecycleEvent
	end

	function lifecycleEvent:connect(callback)
		local connection = rbxScriptSignal:Connect(function()
			local deltaTime = throttle:getDeltaTime()
			throttle:try(callback, deltaTime)
		end)

		return function()
			connection:Disconnect()
		end
	end

	function lifecycleEvent:connectParallel(callback)
		local connection = rbxScriptSignal:ConnectParallel(function()
			local deltaTime = throttle:getDeltaTime()
			throttle:try(callback, deltaTime)
		end)

		return function()
			connection:Disconnect()
		end
	end

	function lifecycleEvent:connectOnce(callback)
		local connection = rbxScriptSignal:Once(function()
			local deltaTime = throttle:getDeltaTime()
			throttle:try(callback, deltaTime)
		end)

		return function()
			connection:Disconnect()
		end
	end

	function lifecycleEvent:wait()
		return rbxScriptSignal:Wait()
	end

	return lifecycleEvent
end

return useLifecycleEvent
