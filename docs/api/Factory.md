# Factory

A bullet factory, used to spawn bullets.

## Properties

### id

```luau
Factory.id: string
```

The spawner's unique ID _(generated with `HttpService:GenerateGUID(false)`)_.

## Methods

### findBulletFromId

```luau
Factory:findBulletFromId(bulletId: number) -> Bullet?
```

Returns a bullet inside the factory with the given bullet id, or `nil`.

### spawnBullet

```luau
Factory:spawnBullet(origin: Vector3, direction: Vector3) -> Bullet
```

Spawns a new bullet inside the factory, then returns it.

### despawnBullet

```luau
Factory:despawnBullet(bulletId: number) -> ()
```

Despawns a bullet with the given bullet id.
