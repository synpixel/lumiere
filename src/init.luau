local useLifecycleEvent = require(script.useLifecycleEvent)
local createMutator = require(script.createMutator)
local createFactory = require(script.createFactory)
local useBullet = require(script.useBullet)
local despawnBullet = require(script.despawnBullet)
local useDespawningSignal = require(script.useDespawningSignal)
local types = require(script.types)

export type LifecycleEvent = types.LifecycleEvent
export type Mutator = types.Mutator
export type Factory = types.Factory
export type Bullet = types.Bullet

return {
	useLifecycleEvent = useLifecycleEvent,
	createMutator = createMutator,
	createFactory = createFactory,

	useBullet = useBullet,
	despawnBullet = despawnBullet,
	useDespawningSignal = useDespawningSignal,
}
