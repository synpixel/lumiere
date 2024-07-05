# Scheduler

Scheduling is made simple with Lumiere by using `useLifecycleEvent`.  
`LifecycleEvent` lets you listen to any event that takes `deltaTime` as its only parameter.

```luau
useLifecycleEvent(RunService.PostSimulation):connect(function(deltaTime)
    -- this runs every frame
    print(`{deltaTime} seconds have passed since the last frame`)
end)
```

That's nice, you now have some code that runs every frame. However, **what if you wanted to read the text being output while the game is running?**  
The output's going way too fast to possibly read all the text, but Lumiere's got the solution.

You can define a fixed framerate with `:withFixedFramerate`. _(bonus: it's chainable)_

```luau
useLifecycleEvent(RunService.PostSimulation)
    :withFixedFramerate(1)
    :connect(function(deltaTime)
        -- ...
    end)
```

##

:::info
Low frames? Lumiere's got you covered. `LifecycleEvent` compensates for low framerate by running the callback as many times as it needs.
:::

##

Great, but our code should run in parallel. Of course, `LifecycleEvent` lets you do just that.

```luau
useLifecycleEvent(RunService.PostSimulation)
    :withFixedFramerate(1)
    :connectParallel(function(deltaTime)
        -- ...
    end)
```

##

You can learn more about `LifecycleEvent` at the [API Reference](../api/LifecycleEvent).
