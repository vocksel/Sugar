--[[
	Combines two HumanoidDescriptions into one.

	This allows you to easily mix and match a base HumanoidDescription with a
	predefined HumanoidDescription, so that players can still look like
	themselves with some alterations.

	Usage:

		local base = Instance.new("HumanoidDescription")
		base.HairAccessory = 1
		base.NeckAccessory = 3

		local override = Instance.new("HumanoidDescription")
		override.HairAccessory = 2

		local combined = combineDescriptions(base, override)

		print(combined.HairAccessory) -- 2
		print(combined.NeckAccessory) -- 3
]]

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
