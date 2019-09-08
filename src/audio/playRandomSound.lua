--[[
	Given a list of sounds, this plays one at random.

	This is useful for dialog, where we have multiple sounds that we want to
	choose between for each letter that pops up.
]]

local SoundService = game:GetService("SoundService")

local t = require(script.Parent.Parent.lib.t)
local chooseRandom = require(script.Parent.Parent.generic.chooseRandom)

local playRandomSoundCheck = t.array(t.instanceOf("Sound"))

local function playRandomSound(sounds)
	assert(playRandomSoundCheck(sounds))

	local sound = chooseRandom(sounds)
	SoundService:PlayLocalSound(sound)
end

return playRandomSound
