# LifecycleEvent

Wrapper utility for `RBXScriptSignals`s that take `deltaTime` as their only parameter.

## Properties

## Methods

### withFixedFramerate

```luau
LifecycleEvent:withFixedFramerate(framerate: number) -> LifecycleEvent
```

Provides a fixed framerate for the scheduler to go by. _(this method is chainable)_

### connect

```luau
LifecycleEvent:connect(callback: (deltaTime: number) -> ()) -> () -> ()
```

Connects a callback to the `LifecycleEvent`, then returns a callback to disconnect it.

### connectParallel

```luau
LifecycleEvent:connectParallel(callback: (deltaTime: number) -> ()) -> () -> ()
```

Connects a callback to the `LifecycleEvent` _in parallel_, then returns a callback to disconnect it.

### connectOnce

```luau
LifecycleEvent:connectOnce(callback: (deltaTime: number) -> ()) -> () -> ()
```

Connects a callback to the `LifecycleEvent` which will be disconnected upon firing, then returns a callback to disconnect it.

### wait

```luau
LifecycleEvent:wait() -> number
```

Waits until the `LifecycleEvent` is fired, then returns the `deltaTime`.
