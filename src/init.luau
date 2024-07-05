local useLifecycleEvent = require(script.useLifecycleEvent)
local createMutator = require(script.createMutator)
local createSource = require(script.createSource)
local useBullet = require(script.useBullet)
local deleteBullet = require(script.deleteBullet)
local useDeletingSignal = require(script.useDeletingSignal)
local types = require(script.types)

export type LifecycleEvent = types.LifecycleEvent
export type Mutator = types.Mutator
export type Source = types.Source
export type Bullet = types.Bullet

return {
	useLifecycleEvent = useLifecycleEvent,
	createMutator = createMutator,
	createSource = createSource,

	useBullet = useBullet,
	deleteBullet = deleteBullet,
	useDeletingSignal = useDeletingSignal,
}
