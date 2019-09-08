--[[
	Allows for easy visualization of a radius.

	The `model` must have a PrimaryPart. This is needed for bounding box
	calculations.

	This is useful for determining how far away a player needs to be from an NPC
	to interact, or how far away the player can be before an enemy will start
	aggroing.

	Usage:

		-- Places a red, 20 stud radius at the bottom of an NPC
		visualizeRadius(20, npc, Color3.fromRGB(255, 0, 0))

		-- Using more than one radius. The last value sets how far up the radius
		-- is pushed so they don't overlap
		visualizeRadius(20, npc, Color3.fromRGB(255, 0, 0), 0.2)
		visualizeRadius(30, npc, Color3.fromRGB(255, 206, 73), 0.1)
]]

local t = require(script.Parent.Parent.lib.t)

local visualizeRadiusCheck = t.tuple(
	t.number,
	t.instanceOf("Model"),
	t.Color3,
	t.optional(t.number)
)

local function visualizeRadius(radius, model, color, yOffset)
	assert(visualizeRadiusCheck(radius, model, color, yOffset))

	yOffset = yOffset or 0

	local primary = model.PrimaryPart
	local cframe, size = model:GetBoundingBox()
	local position = cframe.p

	local bottom = position.Y-(size.Y/2)
	local bottomPos = Vector3.new(position.X, bottom+yOffset, position.Z)

	local part = Instance.new("Part")
	part.Color = color
	part.Name = ("Radius%i"):format(radius)
	part.Position = bottomPos
	part.Size = Vector3.new(1, 0.2, 1)
	part.Material = Enum.Material.Neon
	part.Transparency = 0.75
	part.Anchored = false
	part.CanCollide = false

	local mesh = Instance.new("CylinderMesh")
	mesh.Scale = Vector3.new(radius, 1, radius)
	mesh.Parent = part

	local weld = Instance.new("WeldConstraint")
	weld.Part0 = primary
	weld.Part1 = part
	weld.Parent = part

	part.Parent = model

	return part
end

return visualizeRadius
