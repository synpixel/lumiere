# Source

A bullet source, used to create bullets.

## Properties

### id

```luau
Source.id: string
```

The source's unique ID _(generated with `HttpService:GenerateGUID(false)`)_.

## Methods

### getBullets

```luau
Source:getBullets() -> SharedTable<number, Bullet>
```

Returns a SharedTable with `Bullet` IDs as keys and `Bullet`s as values.

### findBulletFromId

```luau
Source:findBulletFromId(bulletId: number) -> Bullet?
```

Returns a bullet from the source with the given bullet id, or `nil`.

### makeBullet

```luau
Source:makeBullet(origin: Vector3, direction: Vector3, information: any?) -> Bullet
```

Makes a new bullet from the source, then returns it.

::: info
Although `Bullet`s are mutable, I would advise against writing to them outside of their actor.
:::

::: danger
This method will throw if `information` can not be stored in a SharedTable. _(ex: `Instance`)_
:::

### deleteBullet

```luau
Source:deleteBullet(bulletId: number) -> ()
```

Deletes the bullet associated with the given bullet id.
