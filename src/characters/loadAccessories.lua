--[[
	Loads Accessory instances onto a character.

	This is used instead of HumanoidDescriptions because we have non-catalog
	accessories that we need to apply. Those don't have IDs we can use, so we
	have to load them manually.

	Usage:

		loadAccessories(character, accessories)
]]

local t = require(script.Parent.Parent.lib.t)

local loadAccessoriesCheck = t.tuple(
	t.instance("Humanoid"),
	t.array(t.instance("Accessory"))
)

local function loadAccessories(humanoid, accessories)
	assert(loadAccessoriesCheck(humanoid, accessories))

	for _, accessory in pairs(accessories) do
		humanoid:AddAccessory(accessory:Clone())
		humanoid:BuildRigFromAttachments()
	end
end

return loadAccessories
