local constants = require(script.Parent.constants)
local isBulletActor = require(script.Parent.util.isBulletActor)

local function deleteBullet(bulletActor: Actor)
	assert(isBulletActor(bulletActor), "deleteBullet expected actor made in source")
	bulletActor:SetAttribute(constants.BULLET_DELETE_ATTRIBUTE, true)
end

return deleteBullet
