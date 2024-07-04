local useLifecycleEvent = require(script.useLifecycleEvent)
local createMutator = require(script.createMutator)
local createSpawner = require(script.createSpawner)
local useBullet = require(script.useBullet)
local despawnBullet = require(script.despawnBullet)
local useBulletDespawnSignal = require(script.useBulletDespawnSignal)
local types = require(script.types)

export type LifecycleEvent = types.LifecycleEvent
export type Mutator = types.Mutator
export type Spawner = types.Spawner
export type Bullet = types.Bullet

return {
	useLifecycleEvent = useLifecycleEvent,
	createMutator = createMutator,
	createSpawner = createSpawner,

	useBullet = useBullet,
	despawnBullet = despawnBullet,
	useBulletDespawnSignal = useBulletDespawnSignal,
}
