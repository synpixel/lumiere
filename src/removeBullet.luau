local constants = require(script.Parent.constants)
local isBulletActor = require(script.Parent.util.isBulletActor)

local function removeBullet(bulletActor: Actor)
	assert(isBulletActor(bulletActor), "removeBullet expected actor made in source")
	bulletActor:SetAttribute(constants.BULLET_REMOVE_ATTRIBUTE, true)
end

return removeBullet
