export type Scheduler = {
	interval: number,
	setInterval: (Scheduler, interval: number) -> (),
	update: (Scheduler, deltaTime: number, callback: (deltaTime: number) -> ()) -> (),
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

export type Source = {
	id: string,
	getBullets: (Source) -> SharedTable,
	findBulletFromId: (Source, bulletId: number) -> Bullet?,
	makeBullet: (Source, origin: Vector3, direction: Vector3, information: any?) -> Bullet,
	deleteBullet: (Source, bulletId: number) -> (),
}

export type Bullet = {
	id: number,
	position: Vector3,
	direction: Vector3,
	distanceTraveled: number,
	information: any?,
}

return nil
