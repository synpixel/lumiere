local constants = require(script.Parent.constants)

local function despawnBullet(bulletActor: Actor)
	bulletActor:SetAttribute(constants.BULLET_DESPAWN_ATTRIBUTE, true)
end

return despawnBullet
