<div align="center">
    <img src="docs/public/logo.svg" width="128" alt="Logo"/>
    <h1>Lumiere</h1>
    <p>A projectile management library for parallel Luau</p>
    <a href="https://synpixel.github.io/lumiere/">Documentation →</a>
</div>

## Installation

### Wally

Lumiere is up on Wally. Simply add this to your `wally.toml` file:

```toml
Lumiere = "synpixel/lumiere@0.1.0"
```

### Roblox Studio

You can download the `lumiere.rbxm` file from [Releases](https://github.com/synpixel/lumiere/releases).

## Basic Usage

```luau
local source = createSource(container, actor)

local origin = Vector3.new(0, 15, 0)
local direction = Vector3.new(0, 15, 0)

source:makeBullet(origin, direction)
```

```luau
local bullet = useBullet(actor)
local mutator = createMutator(bullet)

useLifecycleEvent(RunService.PostSimulation)
    :withFixedFramerate(30)
    :connectParallel(function(deltaTime)
        mutator:incrementPosition(bullet.direction * deltaTime)

        local raycastResult = mutator:raycastForward()
        print(raycastResult)

        task.synchronize()
        mutator:flushMutations()
    end)
```
