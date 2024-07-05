local constants = require(script.Parent.Parent.constants)

local function isBulletActor(bulletActor: Actor): boolean
	if typeof(bulletActor) ~= "Instance" or not bulletActor:IsA("Actor") then
		return false
	end

	local bulletSourceId = bulletActor:GetAttribute(constants.SOURCE_ID_ATTRIBUTE)
	local bulletId = bulletActor:GetAttribute(constants.BULLET_ID_ATTRIBUTE)
	return bulletSourceId ~= nil and bulletId ~= nil
end

return isBulletActor
