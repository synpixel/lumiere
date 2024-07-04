local types = require(script.Parent.types)

local function createMutator(bullet: types.Bullet): types.Mutator
	local mutator = {}
	mutator.nextPosition = bullet.position
	mutator.nextDirection = bullet.direction
	mutator.nextDistanceTraveled = bullet.distanceTraveled

	function mutator:setPosition(position: Vector3)
		local previousPosition = mutator.nextPosition
		mutator.nextPosition = position
		mutator.nextDistanceTraveled += (position - previousPosition).Magnitude
	end

	function mutator:setDirection(direction: Vector3)
		mutator.nextDirection = direction
	end

	function mutator:incrementPosition(deltaPosition: Vector3)
		mutator:setPosition(mutator.nextPosition + deltaPosition)
	end

	function mutator:incrementDirection(deltaDirection: Vector3)
		mutator:setDirection(mutator.nextDirection + deltaDirection)
	end

	function mutator:raycastForward(raycastParams: RaycastParams?)
		local raycastResult = workspace:Raycast(bullet.position, mutator.nextPosition - bullet.position, raycastParams)
		return raycastResult
	end

	function mutator:flushMutations()
		bullet.position = mutator.nextPosition
		bullet.direction = mutator.nextDirection
		bullet.distanceTraveled = mutator.nextDistanceTraveled
	end

	return mutator
end

return createMutator
