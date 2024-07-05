local HttpService = game:GetService("HttpService")
local SharedTableRegistry = game:GetService("SharedTableRegistry")
local constants = require(script.Parent.constants)
local deleteBullet = require(script.Parent.deleteBullet)
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
			bulletActor:Destroy()
			bulletActors[bulletId] = nil
			bullets[bulletId] = nil
		end)

		bulletActors[bulletId] = bulletActor
		bulletActor.Parent = container

		return bullets[bulletId]
	end

	function source:deleteBullet(bulletId)
		local bulletActor = bulletActors[bulletId]
		if bulletActor == nil or not bulletActor:IsDescendantOf(game) then
			return
		end

		deleteBullet(bulletActor)
	end

	return source
end

return createSource
