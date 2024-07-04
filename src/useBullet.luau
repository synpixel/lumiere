local SharedTableRegistry = game:GetService("SharedTableRegistry")
local constants = require(script.Parent.constants)
local types = require(script.Parent.types)

local function useBullet(bulletActor: Actor): types.Bullet
	local bulletSpawnerId = bulletActor:GetAttribute(constants.SPAWNER_ID_ATTRIBUTE)
	local bulletId = bulletActor:GetAttribute(constants.BULLET_ID_ATTRIBUTE)
	assert(bulletSpawnerId ~= nil and bulletId ~= nil, "attempt to call useBullet outside bullet actor")

	local sharedTableName = constants.SPAWNER_BULLETS_SHARED_TABLE_PATTERN:format(bulletSpawnerId)
	local bullets = SharedTableRegistry:GetSharedTable(sharedTableName)
	return bullets[bulletId]
end

return useBullet
