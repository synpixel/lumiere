local constants = require(script.Parent.constants)
local isBulletActor = require(script.Parent.util.isBulletActor)

local function despawnBullet(bulletActor: Actor)
	assert(isBulletActor(bulletActor), "despawnBullet expected actor made in factory")
	bulletActor:SetAttribute(constants.BULLET_DESPAWN_ATTRIBUTE, true)
end

return despawnBullet
