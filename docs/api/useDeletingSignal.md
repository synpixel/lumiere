# useDeletingSignal

Returns a signal which fires when the bullet associated with the given bullet actor is deleted.

```luau
useDeletingSignal(bulletActor: Actor) -> RBXScriptSignal
```

::: warning
useDeletingSignal will throw if `bulletActor` was not made by a `Source`.
:::
