# useLifecycleEvent

Creates a `LifecycleEvent`.

```luau
useLifecycleEvent(rbxScriptSignal: RBXScriptSignal<number>) -> LifecycleEvent
```

::: warning
`RBXScriptSignal`s passed to `useLifecycleEvent` must exclusively have `deltaTime` as their only parameter.
:::
