# Bullets

The code for the bullets you make with Lumiere are in `Actor`s, _but how do you interact with the bullet there?_

Let's write some bullet code.

## Basics

You can query the bullet associated with the actor simply by calling `useBullet`. Let's assume `actor` is defined.

```luau
local bullet = useBullet(actor)
```

This will throw if `actor` is not an `Actor` created by Lumiere.

From this point on, you can read from and write to `bullet`.

```luau
print("the bullet is at", bullet.position)
print("the bullet is facing", bullet.direction)

bullet.position = Vector3.new(0, 15, 0)
print("the bullet is now at", bullet.position)
```

Okay, let's get back on track. You now have a `Bullet` instance, let's use the `useLifecycleEvent` utility you learned about earlier.
Why not make the bullet go forward?

```luau
useLifecycleEvent(RunService.PostSimulation):connect(function(deltaTime)
    bullet.position += bullet.direction * deltaTime
    print("the bullet is now at", bullet.position)
end)
```

It works! The bullet goes forward as intended. But.. this is about making bullets in parallel isn't it?  
Right, this is currently running in a synchronized context. Let's simply change `:connect` to `:connectParallel`.

```luau
useLifecycleEvent(RunService.PostSimulation):connectParallel(function(deltaTime)
    bullet.position += bullet.direction * deltaTime
    -- ...
end)
```

Okay, we've got everything.. almost. Bullets are supposed to register hits aren't they? And actually let's keep track of the total distance the bullet has traveled. Well.. let's do this.

```luau
useLifecycleEvent(RunService.PostSimulation):connectParallel(function(deltaTime)
    local raycastResult = workspace:Raycast(bullet.position, bullet.direction * deltaTime)
    print(raycastResult)

    bullet.position += bullet.direction * deltaTime
    bullet.distanceTraveled += bullet.direction.Magnitude * deltaTime
end)
```

Now everything's perfect, but we're not done. Let's say you want to log whenever the bullet disappears. Well, Lumiere's got `useDeletingSignal`, which returns an `RBXScriptSignal`.

```lua
useDeletingSignal(actor):Connect(function()
    print("bullet deleted")
end)
```

## Mutators

Let's go back for a second. The bullet implementation might not seem very problematic right now, but what if you wanted more complex behavior? Well this is where the `Mutator` utility comes in. Let's refactor that piece of code with `Mutator` by using `createMutator`.

```luau
local mutator = createMutator(bullet)

useLifecycleEvent(RunService.PostSimulation):connectParallel(function(deltaTime)
    mutator:incrementPosition(mutator.nextDirection * deltaTime)

    local raycastResult = mutator:raycastForward()
    print(raycastResult)

    mutator:flushMutations()
end)
```

This does the exact same thing, but in a more idiomatic and readable way, with the added bonus of writing to `SharedTable`s only once per frame.

## Spawning

Our bullet's finished, but now we need to actually use it. Lumiere works with `Source`s which you can instantiate using `createSource`.  
Sources are a sort of container for bullets, you give it a place to store the actors it will create along with your bullet actor template.

```luau
local source = createSource(container, actorTemplate)
```

Now to spawn a bullet. We need an `origin` and a `direction`. `Vector3.new(0, 15, 0)` for the origin and `Vector3.new(0, -15, 0)` for the direction doesn't sound too bad.

```luau
local origin = Vector3.new(0, 15, 0)
local direction = Vector3.new(0, -15, 0)
source:makeBullet(origin, direction)
```

Awesome, but now what if you want to delete it? Or better yet, delete all the bullets? `Bullet`s have a sequential `id` field which you can use along with `:deleteBullet` to delete any bullet you want.

```luau
for _, bullet in source:getBullets() do
    source:deleteBullet(bullet.id)
end
```

We've gone through everything you need to know to get started, but if this is not enough, you can take a peek at the [API Reference](../api/index)!
