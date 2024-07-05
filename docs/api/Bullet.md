# Bullet

::: tip
Although `Bullet`s are mutable, I would advise against writing to them outside of their actor.
:::

## Properties

### id

```luau
Bullet.id: string
```

The sequential ID of the bullet.

### position

```luau
Bullet.position: Vector3
```

The bullet's position. _(this property should be set by a `Mutator`)_

### direction

```luau
Bullet.direction: Vector3
```

The bullet's direction. _(this property should be set by a `Mutator`)_

### distanceTraveled

```luau
Bullet.distanceTraveled: number
```

The total distance the bullet has traveled.

:::info
This property is set automatically when using a `Mutator`.
:::

## Methods
