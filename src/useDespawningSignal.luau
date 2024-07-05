local constants = require(script.Parent.constants)
local isBulletActor = require(script.Parent.util.isBulletActor)

local function useDespawningSignal(bulletActor: Actor): RBXScriptSignal
	assert(isBulletActor(bulletActor), "useDespawningSignal expected actor made in factory")
	return bulletActor:GetAttributeChangedSignal(constants.BULLET_DESPAWN_ATTRIBUTE)
end

return useDespawningSignal
