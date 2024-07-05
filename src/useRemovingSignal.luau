local constants = require(script.Parent.constants)
local isBulletActor = require(script.Parent.util.isBulletActor)

local function useRemovingSignal(bulletActor: Actor): RBXScriptSignal
	assert(isBulletActor(bulletActor), "useRemovingSignal expected actor made in source")
	return bulletActor:GetAttributeChangedSignal(constants.BULLET_REMOVE_ATTRIBUTE)
end

return useRemovingSignal
