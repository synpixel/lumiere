local HttpService = game:GetService("HttpService")
local SharedTableRegistry = game:GetService("SharedTableRegistry")
local constants = require(script.Parent.constants)
local types = require(script.Parent.types)
local useDeletingSignal = require(script.Parent.useDeletingSignal)

local function createSource(container: Instance, bulletActorTemplate: Actor | () -> Actor): types.Source
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

	function source:makeBullet(origin, direction)
		currentBulletId += 1
		local bulletId = currentBulletId

		bullets[bulletId] = {
			id = bulletId,
			position = origin,
			direction = direction,
			distanceTraveled = 0,
		}

		local bulletActor = if typeof(bulletActorTemplate) == "function"
			then bulletActorTemplate()
			else bulletActorTemplate:Clone()
		bulletActor.Name = `bullet_{bulletId}`
		bulletActor:SetAttribute(constants.SOURCE_ID_ATTRIBUTE, sourceId)
		bulletActor:SetAttribute(constants.BULLET_ID_ATTRIBUTE, bulletId)

		useDeletingSignal(bulletActor):Connect(function()
			source:deleteBullet(bulletId)
		end)

		bulletActor.Parent = container

		bulletActors[bulletId] = bulletActor
		return bullets[bulletId]
	end

	function source:deleteBullet(bulletId)
		if bulletActors[bulletId] ~= nil and bulletActors[bulletId].Parent ~= nil then
			bulletActors[bulletId]:SetAttribute(constants.BULLET_DELETE_ATTRIBUTE, true)
			bulletActors[bulletId]:Destroy()
			bulletActors[bulletId] = nil
		end
		bullets[bulletId] = nil
	end

	return source
end

return createSource
