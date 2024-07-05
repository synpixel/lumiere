# useRemovingSignal

Returns a signal which fires when the bullet associated with the given bullet actor is removed.

```luau
useRemovingSignal(bulletActor: Actor) -> RBXScriptSignal
```

::: warning
useRemovingSignal will throw if `bulletActor` was not created by a `Source`.
:::
