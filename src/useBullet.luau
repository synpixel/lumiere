local SharedTableRegistry = game:GetService("SharedTableRegistry")
local constants = require(script.Parent.constants)
local types = require(script.Parent.types)
local isBulletActor = require(script.Parent.util.isBulletActor)

local function useBullet(bulletActor: Actor): types.Bullet
	assert(isBulletActor(bulletActor), "useBullet expected actor made in source")

	local bulletSourceId = bulletActor:GetAttribute(constants.SOURCE_ID_ATTRIBUTE)
	local bulletId = bulletActor:GetAttribute(constants.BULLET_ID_ATTRIBUTE)

	local sharedTableName = constants.SOURCE_BULLETS_SHARED_TABLE_PATTERN:format(bulletSourceId)
	local bullets = SharedTableRegistry:GetSharedTable(sharedTableName)

	return bullets[bulletId]
end

return useBullet
