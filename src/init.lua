return {
	audio = {
		playRandomSound = require(script.audio.playRandomSound),
	},

	characters = {
		clearAccessories = require(script.characters.clearAccessories),
		combineDescriptions = require(script.characters.combineDescriptions),
		isAirborne = require(script.characters.isAirborne),
		isAlive = require(script.characters.isAlive),
		isGrounded = require(script.characters.isGrounded),
		loadAccessories = require(script.characters.loadAccessories),
	},

	colors = {
		brighten = require(script.colors.brighten),
		darken = require(script.colors.darken),
	},

	debug = {
		pretty = require(script.debug.pretty),
		visualizeRadius = require(script.debug.visualizeRadius),
	},

	generic = {
		bind = require(script.generic.bind),
		chooseRandom = require(script.generic.chooseRandom),
		debounce = require(script.generic.debounce),
		getSortedKeys = require(script.generic.getSortedKeys),
		maybeCall = require(script.generic.maybeCall),
		new = require(script.generic.new),
	},

	mouse = {
		getMouseHit = require(script.mouse.getMouseHit),
		getMouseUnitRay = require(script.mouse.getMouseUnitRay),
	},

	networking = {
		fireExceptTo = require(script.networking.fireExceptTo),
		onNextEvent = require(script.networking.onNextEvent),
	},

	players = {
		getCharacterFromUserId = require(script.players.getCharacterFromUserId),
		getPlayerFromUserId = require(script.players.getPlayerFromUserId),
		getUserId = require(script.players.getUserId),
		getUserIdFromCharacter = require(script.players.getUserIdFromCharacter),
	},

	timing = {
		async = require(script.timing.async),
		yield = require(script.timing.yield),
	}
}
