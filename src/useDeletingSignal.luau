local constants = require(script.Parent.constants)
local isBulletActor = require(script.Parent.util.isBulletActor)

local function useDeletingSignal(bulletActor: Actor): RBXScriptSignal
	assert(isBulletActor(bulletActor), "useDeletingSignal expected actor made in source")
	return bulletActor:GetAttributeChangedSignal(constants.BULLET_DELETE_ATTRIBUTE)
end

return useDeletingSignal
