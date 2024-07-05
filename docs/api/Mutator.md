# Mutator

Utility to buffer mutations to `Bullet`s until synchronization.

## Properties

### nextPosition

```luau
Mutator.nextPosition: Vector3
```

The position that is scheduled to overwrite `Bullet.position`.

### nextDirection

```luau
Mutator.nextDirection: Vector3
```

The direction that is scheduled to overwrite `Bullet.direction`.

### nextDistanceTraveled

```luau
Mutator.nextDistanceTraveled: number
```

The distance that is scheduled to overwrite `Bullet.distanceTraveled`.

## Methods

### setPosition

```luau
Mutator:setPosition(position: Vector3) -> ()
```

Overwrites `Mutator.nextPosition` and increments `Mutator.distanceTraveled` accordingly.

### setDirection

```luau
Mutator:setDirection(direction: Vector3) -> ()
```

Overwrites `Mutator.nextDirection`.

### incrementPosition

```luau
Mutator:incrementPosition(deltaPosition: Vector3) -> ()
```

Increments `Mutator.nextPosition` and increments `Mutator.distanceTraveled` accordingly.

### incrementDirection

```luau
Mutator:incrementDirection(deltaDirection: Vector3) -> ()
```

Increments `Mutator.nextDirection`.

### raycastForward

```luau
Mutator:raycastForward(raycastParams: RaycastParams?) -> RaycastResult?
```

Casts a ray from `Bullet.position` to `Mutator.nextPosition` and returns the result if it exists or `nil`.

### flushMutations

```luau
Mutator:flushMutations() -> ()
```

Applies the mutations to `bullet`.
