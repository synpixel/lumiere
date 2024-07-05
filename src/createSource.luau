local HttpService = game:GetService("HttpService")
local SharedTableRegistry = game:GetService("SharedTableRegistry")
local constants = require(script.Parent.constants)
local types = require(script.Parent.types)
local useRemovingSignal = require(script.Parent.useRemovingSignal)

local function createSource(container: Instance, bulletActor: Actor | () -> Actor): types.Source
	local sourceId = HttpService:GenerateGUID(false)
	local currentBulletId = 0
	local bulletActors = {}

	local bullets = SharedTable.new()
	SharedTableRegistry:SetSharedTable(constants.SOURCE_BULLETS_SHARED_TABLE_PATTERN:format(sourceId), bullets)

	local source = {}
	source.id = sourceId

	function source:findBulletFromId(bulletId)
		return bullets[bulletId]
	end

	function source:createBullet(origin, direction)
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
		newBulletActor:SetAttribute(constants.SOURCE_ID_ATTRIBUTE, sourceId)
		newBulletActor:SetAttribute(constants.BULLET_ID_ATTRIBUTE, bulletId)

		useRemovingSignal(newBulletActor):Connect(function()
			source:removeBullet(bulletId)
		end)

		newBulletActor.Parent = container

		bulletActors[bulletId] = newBulletActor
		return bullets[bulletId]
	end

	function source:removeBullet(bulletId)
		if bulletActors[bulletId] ~= nil and bulletActors[bulletId].Parent ~= nil then
			bulletActors[bulletId]:SetAttribute(constants.BULLET_REMOVE_ATTRIBUTE, true)
			bulletActors[bulletId]:Destroy()
			bulletActors[bulletId] = nil
		end
		bullets[bulletId] = nil
	end

	return source
end

return createSource
