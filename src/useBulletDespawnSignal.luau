local constants = require(script.Parent.constants)

local function useBulletDespawnSignal(bulletActor: Actor)
	return bulletActor:GetAttributeChangedSignal(constants.BULLET_DESPAWN_ATTRIBUTE)
end

return useBulletDespawnSignal
