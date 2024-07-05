# Basic Usage

This is a simple tutorial for you to familiarize with the API.

## Writing bullet actors

Since Lumiere is built for parallel Luau, you need `Actor`s to work with it.  
Lumiere uses one `Actor` per bullet _(called bullet actors)_, this is what some code inside of your bullet actor would look like:

```luau
local Lumiere = require(...)

local actor = script.Parent
local bullet = Lumiere.useBullet(actor)

print(`this file is running inside bullet {bullet.id}`)
-- example output: "this file is running inside bullet 1"
```

But bullets should be dynamic, they should run code more than once, right?  
Well that's convenient, there's `useLifecycleEvent`!

```luau
local RunService = game:GetService("RunService")
-- extra imports omitted for clarity

Lumiere.useLifecycleEvent(RunService.PostSimulation):connect(function(deltaTime)
    print("this runs every frame!")
end)
```

Now, we need our bullets to move. They're not going to stay there forever are they?  
Let's write some code for it.

```luau
bullet.position += bullet.direction * deltaTime
```

Sure, this works. But there's one issue you may have noticed: **it won't run in parallel**. You can't mutate the bullet in a desynchronized context.

Lumiere has the right tool for this however: `Mutator`s. You can create one with `createMutator`, they have utility methods such as `:setPosition` or `:incrementDirection`.

Now `Mutator`s aren't free from the rules of Luau, they still cannot mutate bullets in a desynchronized context. However, one thing to note is that `Mutator`s do not instantly overwrite `bullet.position` nor `bullet.direction`, they merely buffer the mutations which will be applied upon calling `:flushMutations`.

Here's a quick example:

```luau
local mutator = Lumiere.createMutator(bullet)

Lumiere.useLifecycleEvent(RunService.PostSimulation):connectParallel(function(deltaTime)
    mutator:incrementPosition(bullet.direction * deltaTime)

    task.synchronize()
    mutator:flushMutations()
end)
```

Great, we've got our bullet working and ready to go... but how do we actually use it?

## Using bullet actors

Well, let's leave the bullet actor alone now. We'll move on to actually spawning bullets.

First, you should be introduced to `Source`s. They handle all the logic of spawning bullets for you. You can create them with `createSource`.  
The constructor needs a container _(a place to contain the bullet actors)_, and your bullet actor template _(reminder: Lumiere creates one actor per bullet)_:

```luau
local Lumiere = require(...)

local container = script
local actorTemplate = ...

local source = Lumiere.createSource(container, actorTemplate)
```

You can now spawn new bullets like this:

```luau
local origin = Vector3.new(0, 15, 0)
local direction = Vector3.new(0, -15, 0)
source:makeBullet(origin, direction)
```

The `:makeBullet` method returns a `Bullet` object _(the same object which is returned by `useBullet` inside of bullet actors)_.  
I'd advise against modifying it from outside bullet actors, but it does have one useful field: `id`. You can use this field to despawn bullets:

```luau
local bullet = source:makeBullet(...)
task.wait(5)
source:deleteBullet(bullet.id)
```

## Conclusion

The basic usage section is finished, but you can learn more about Lumiere's API [here](../api/index).
