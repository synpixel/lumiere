export type Scheduler = {
	getDeltaTime: (Scheduler) -> number,
	setInterval: (Scheduler, interval: number) -> (),
	update: <T...>(Scheduler, deltaTime: number, callback: (T...) -> (), T...) -> (),
}

export type LifecycleEvent = {
	withFixedFramerate: (LifecycleEvent, framerate: number) -> LifecycleEvent,
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

export type Factory = {
	id: string,
	findBulletFromId: (Factory, bulletId: number) -> Bullet?,
	spawnBullet: (Factory, origin: Vector3, direction: Vector3) -> Bullet,
	despawnBullet: (Factory, bulletId: number) -> (),
}

export type Bullet = {
	id: number,
	position: Vector3,
	direction: Vector3,
	distanceTraveled: number,
}

return nil
