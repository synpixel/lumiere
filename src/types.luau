export type Throttle = {
	getDeltaTime: (Throttle) -> number,
	setDuration: (Throttle, duration: number) -> (),
	try: <T...>(Throttle, callback: (T...) -> (), T...) -> (),
}

export type LifecycleEvent = {
	withDesiredFramerate: (LifecycleEvent, framerate: number) -> LifecycleEvent,
	connect: (LifecycleEvent, callback: (deltaTime: number) -> ()) -> () -> (),
	connectParallel: (LifecycleEvent, callback: (deltaTime: number) -> ()) -> () -> (),
	connectOnce: (LifecycleEvent, callback: (deltaTime: number) -> ()) -> () -> (),
	wait: (LifecycleEvent) -> number,
}

export type Mutator = {
	nextPosition: Vector3,
	nextDirection: Vector3,
	nextDistanceTraveled: number,
	setPosition: (Mutator, position: Vector3) -> (),
	setDirection: (Mutator, direction: Vector3) -> (),
	incrementPosition: (Mutator, deltaPosition: Vector3) -> (),
	incrementDirection: (Mutator, deltaDirection: Vector3) -> (),
	raycastForward: (Mutator, raycastParams: RaycastParams?) -> RaycastResult?,
	flushMutations: (Mutator) -> (),
}

export type Spawner = {
	id: string,
	findBulletFromId: (Spawner, bulletId: number) -> Bullet?,
	spawnBullet: (Spawner, origin: Vector3, direction: Vector3) -> Bullet,
	despawnBullet: (Spawner, bulletId: number) -> (),
}

export type Bullet = {
	id: number,
	position: Vector3,
	direction: Vector3,
	distanceTraveled: number,
}

return nil
