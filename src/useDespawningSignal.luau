local constants = require(script.Parent.constants)

local function useDespawningSignal(bulletActor: Actor)
	return bulletActor:GetAttributeChangedSignal(constants.BULLET_DESPAWN_ATTRIBUTE)
end

return useDespawningSignal
