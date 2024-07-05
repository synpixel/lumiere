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

Returns a bullet from the source with the given bullet id, or `nil`.

### makeBullet

```luau
Source:makeBullet(origin: Vector3, direction: Vector3) -> Bullet
```

Makes a new bullet from the source, then returns it. _(although `Bullet`s are mutable, I would advise against writing to them outside of the bullet actor)_

### deleteBullet

```luau
Source:deleteBullet(bulletId: number) -> ()
```

Deletes the bullet associated with the given bullet id.
