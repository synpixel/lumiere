local SharedTableRegistry = game:GetService("SharedTableRegistry")
local constants = require(script.Parent.constants)
local types = require(script.Parent.types)

local function useBullet(bulletActor: Actor): types.Bullet
	local bulletFactoryId = bulletActor:GetAttribute(constants.FACTORY_ID_ATTRIBUTE)
	local bulletId = bulletActor:GetAttribute(constants.BULLET_ID_ATTRIBUTE)
	assert(bulletFactoryId ~= nil and bulletId ~= nil, "attempt to call useBullet outside bullet actor")

	local sharedTableName = constants.FACTORY_BULLETS_SHARED_TABLE_PATTERN:format(bulletFactoryId)
	local bullets = SharedTableRegistry:GetSharedTable(sharedTableName)
	return bullets[bulletId]
end

return useBullet
