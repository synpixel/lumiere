local types = require(script.Parent.types)
local createScheduler = require(script.Parent.util.createScheduler)

local function useLifecycleEvent(rbxScriptSignal: RBXScriptSignal): types.LifecycleEvent
	local scheduler = createScheduler()
	scheduler:setInterval(0)

	local lifecycleEvent = {}

	function lifecycleEvent:withDesiredFramerate(framerate)
		scheduler:setInterval(1 / framerate)
		return lifecycleEvent
	end

	function lifecycleEvent:connect(callback)
		local connection = rbxScriptSignal:Connect(function(deltaTime)
			local fakeDeltaTime = scheduler:getDeltaTime()
			scheduler:update(deltaTime, callback, fakeDeltaTime)
		end)

		return function()
			connection:Disconnect()
		end
	end

	function lifecycleEvent:connectParallel(callback)
		local connection = rbxScriptSignal:ConnectParallel(function(deltaTime)
			local fakeDeltaTime = scheduler:getDeltaTime()
			scheduler:update(deltaTime, callback, fakeDeltaTime)
		end)

		return function()
			connection:Disconnect()
		end
	end

	function lifecycleEvent:connectOnce(callback)
		local connection = rbxScriptSignal:Once(function(deltaTime)
			local fakeDeltaTime = scheduler:getDeltaTime()
			scheduler:update(deltaTime, callback, fakeDeltaTime)
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
