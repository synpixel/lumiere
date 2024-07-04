local HttpService = game:GetService("HttpService")
local SharedTableRegistry = game:GetService("SharedTableRegistry")
local constants = require(script.Parent.constants)
local types = require(script.Parent.types)
local useBulletDespawnSignal = require(script.Parent.useBulletDespawnSignal)

local function createSpawner(container: Instance, createBulletActor: () -> Actor): types.Spawner
	local spawnerId = HttpService:GenerateGUID(false)
	local currentBulletId = 0
	local bulletActors = {}

	local bullets = SharedTable.new()
	SharedTableRegistry:SetSharedTable(constants.SPAWNER_BULLETS_SHARED_TABLE_PATTERN:format(spawnerId), bullets)

	local spawner = {}
	spawner.id = spawnerId

	function spawner:findBulletFromId(bulletId)
		return bullets[bulletId]
	end

	function spawner:spawnBullet(origin, direction)
		currentBulletId += 1
		local bulletId = currentBulletId

		bullets[bulletId] = {
			id = bulletId,
			position = origin,
			direction = direction,
			distanceTraveled = 0,
		}

		local newBulletActor = createBulletActor()
		newBulletActor.Name = `bullet_{bulletId}`
		newBulletActor:SetAttribute(constants.SPAWNER_ID_ATTRIBUTE, spawnerId)
		newBulletActor:SetAttribute(constants.BULLET_ID_ATTRIBUTE, bulletId)

		useBulletDespawnSignal(newBulletActor):Connect(function()
			spawner:despawnBullet(bulletId)
		end)

		newBulletActor.Parent = container

		bulletActors[bulletId] = newBulletActor
		return bullets[bulletId]
	end

	function spawner:despawnBullet(bulletId)
		if bulletActors[bulletId] ~= nil and bulletActors[bulletId].Parent ~= nil then
			bulletActors[bulletId]:SetAttribute(constants.BULLET_DESPAWN_ATTRIBUTE, true)
			bulletActors[bulletId]:Destroy()
			bulletActors[bulletId] = nil
		end
		bullets[bulletId] = nil
	end

	return spawner
end

return createSpawner
