# useDespawningSignal

Returns a signal which fires when the bullet associated with the given bullet actor is despawned.

```luau
useDespawningSignal(bulletActor: Actor) -> RBXScriptSignal
```

::: warning
useDespawningSignal will throw if `bulletActor` was not created by a `Factory`.
:::
