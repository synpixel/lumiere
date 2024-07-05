local SharedTableRegistry = game:GetService("SharedTableRegistry")
local constants = require(script.Parent.constants)
local types = require(script.Parent.types)
local isBulletActor = require(script.Parent.util.isBulletActor)

local function useBullet(bulletActor: Actor): types.Bullet
	assert(isBulletActor(bulletActor), "useBullet expected actor made infactory")

	local bulletFactoryId = bulletActor:GetAttribute(constants.FACTORY_ID_ATTRIBUTE)
	local bulletId = bulletActor:GetAttribute(constants.BULLET_ID_ATTRIBUTE)

	local sharedTableName = constants.FACTORY_BULLETS_SHARED_TABLE_PATTERN:format(bulletFactoryId)
	local bullets = SharedTableRegistry:GetSharedTable(sharedTableName)

	return bullets[bulletId]
end

return useBullet
