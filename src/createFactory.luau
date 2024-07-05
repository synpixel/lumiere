local HttpService = game:GetService("HttpService")
local SharedTableRegistry = game:GetService("SharedTableRegistry")
local constants = require(script.Parent.constants)
local types = require(script.Parent.types)
local useDespawningSignal = require(script.Parent.useDespawningSignal)

local function createFactory(container: Instance, bulletActor: Actor | () -> Actor): types.Factory
	local factoryId = HttpService:GenerateGUID(false)
	local currentBulletId = 0
	local bulletActors = {}

	local bullets = SharedTable.new()
	SharedTableRegistry:SetSharedTable(constants.FACTORY_BULLETS_SHARED_TABLE_PATTERN:format(factoryId), bullets)

	local factory = {}
	factory.id = factoryId

	function factory:findBulletFromId(bulletId)
		return bullets[bulletId]
	end

	function factory:spawnBullet(origin, direction)
		currentBulletId += 1
		local bulletId = currentBulletId

		bullets[bulletId] = {
			id = bulletId,
			position = origin,
			direction = direction,
			distanceTraveled = 0,
		}

		local newBulletActor = if typeof(bulletActor) == "function" then bulletActor() else bulletActor:Clone()
		newBulletActor.Name = `bullet_{bulletId}`
		newBulletActor:SetAttribute(constants.FACTORY_ID_ATTRIBUTE, factoryId)
		newBulletActor:SetAttribute(constants.BULLET_ID_ATTRIBUTE, bulletId)

		useDespawningSignal(newBulletActor):Connect(function()
			factory:despawnBullet(bulletId)
		end)

		newBulletActor.Parent = container

		bulletActors[bulletId] = newBulletActor
		return bullets[bulletId]
	end

	function factory:despawnBullet(bulletId)
		if bulletActors[bulletId] ~= nil and bulletActors[bulletId].Parent ~= nil then
			bulletActors[bulletId]:SetAttribute(constants.BULLET_DESPAWN_ATTRIBUTE, true)
			bulletActors[bulletId]:Destroy()
			bulletActors[bulletId] = nil
		end
		bullets[bulletId] = nil
	end

	return factory
end

return createFactory
