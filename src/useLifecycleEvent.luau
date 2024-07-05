local types = require(script.Parent.types)
local createScheduler = require(script.Parent.util.createScheduler)

local function useLifecycleEvent(rbxScriptSignal: RBXScriptSignal): types.LifecycleEvent
	local scheduler = createScheduler()
	scheduler:setInterval(0)

	local lifecycleEvent = {}

	function lifecycleEvent:withFixedFramerate(framerate)
		scheduler:setInterval(1 / framerate)
		return lifecycleEvent
	end

	function lifecycleEvent:connect(callback)
		local connection = rbxScriptSignal:Connect(function(deltaTime)
			scheduler:update(deltaTime, callback)
		end)

		return function()
			connection:Disconnect()
		end
	end

	function lifecycleEvent:connectParallel(callback)
		local connection = rbxScriptSignal:ConnectParallel(function(deltaTime)
			scheduler:update(deltaTime, callback)
		end)

		return function()
			connection:Disconnect()
		end
	end

	function lifecycleEvent:connectOnce(callback)
		local connection = rbxScriptSignal:Once(function(deltaTime)
			scheduler:update(deltaTime, callback)
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
