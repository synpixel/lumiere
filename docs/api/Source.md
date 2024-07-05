# Source

A bullet source, used to create bullets.

## Properties

### id

```luau
Source.id: string
```

The source's unique ID _(generated with `HttpService:GenerateGUID(false)`)_.

## Methods

### findBulletFromId

```luau
Source:findBulletFromId(bulletId: number) -> Bullet?
```

Returns a bullet inside the source with the given bullet id, or `nil`.

### createBullet

```luau
Source:createBullet(origin: Vector3, direction: Vector3) -> Bullet
```

Creates a new bullet inside the source, then returns it.

### removeBullet

```luau
Source:removeBullet(bulletId: number) -> ()
```

Removes a bullet with the given bullet id.
