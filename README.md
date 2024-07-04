<div align="center">
	<img src="assets/lumiere-icon.svg" width="128" alt="Logo"/>
	<h1>Lumiere</h1>
</div>

## Basic Usage

```lua
local spawner = Lumiere.createSpawner(container, function()
    return actor:Clone()
end)

local origin = Vector3.new(0, 15, 0)
local direction = Vector3.new(0, 15, 0)
spawner:spawnBullet(origin, direction)
```

```lua
local bullet = Lumiere.useBullet(actor)
local mutator = Lumiere.createMutator(bullet)

Lumiere.useLifecycleEvent(RunService.PostSimulation)
    :withDesiredFramerate(30)
    :connectParallel(function(deltaTime)
        mutator:incrementPosition(bullet.direction * deltaTime)

        local raycastResult = mutator:raycastForward()
        print(raycastResult)

        task.synchronize()
        mutator:flushMutations()
    end)
```
