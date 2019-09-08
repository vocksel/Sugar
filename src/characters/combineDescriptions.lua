local t = require(script.Parent.Parent.lib.t)

local HUMANOID_DESCRIPTION_PROPS = {
	"BackAccessory", "FaceAccessory", "FrontAccessory", "HairAccessory",
	"HatAccessory", "NeckAccessory", "ShouldersAccessory",

	"BodyTypeScale", "DepthScale", "HeadScale", "HeightScale",
	"ProportionScale", "WidthScale",

	"ClimbAnimation", "FallAnimation", "IdleAnimation", "JumpAnimation",
	"RunAnimation", "SwimAnimation", "WalkAnimation",

	"Face", "Head", "LeftArm", "LeftLeg", "RightArm", "RightLeg", "Torso",

	"GraphicTShirt", "Pants", "Shirt",

	"HeadColor", "LeftArmColor", "LeftLegColor", "RightArmColor",
	"RightLegColor", "TorsoColor"
}

local combineDescriptionsCheck = t.tuple(
	t.instanceOf("HumanoidDescription"),
	t.instanceOf("HumanoidDescription")
)

local function combineDescriptions(base, override)
	assert(combineDescriptionsCheck(base, override))

	local defaults = Instance.new("HumanoidDescription")

	local description = base:Clone()
	for _, prop in pairs(HUMANOID_DESCRIPTION_PROPS) do
		if override[prop] ~= defaults[prop] then
			description[prop] = override[prop]
		end
	end
	return description
end

return combineDescriptions
