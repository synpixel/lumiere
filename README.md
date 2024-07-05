<div align="center">
    <img src="docs/public/logo.svg" width="128" alt="Logo"/>
    <h1>Lumiere</h1>
    <p>A projectile management library for parallel Luau</p>
    <a href="https://synpixel.github.io/lumiere/">Documentation →</a>
</div>

## Basic Usage

```luau
local factory = Lumiere.createFactory(container, actor)

local origin = Vector3.new(0, 15, 0)
local direction = Vector3.new(0, 15, 0)
factory:spawnBullet(origin, direction)
```

```luau
local bullet = Lumiere.useBullet(actor)
local mutator = Lumiere.createMutator(bullet)

Lumiere.useLifecycleEvent(RunService.PostSimulation)
    :withFixedFramerate(30)
    :connectParallel(function(deltaTime)
        mutator:incrementPosition(bullet.direction * deltaTime)

        local raycastResult = mutator:raycastForward()
        print(raycastResult)

        task.synchronize()
        mutator:flushMutations()
    end)
```
