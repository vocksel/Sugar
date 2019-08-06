return {
	colors = {
		brighten = require(script.colors.brighten),
		darken = require(script.colors.darken),
	},

	debug = {
		pretty = require(script.debug.pretty)
	},

	generic = {
		bind = require(script.generic.bind),
		chooseRandom = require(script.generic.chooseRandom),
		getSortedKeys = require(script.generic.getSortedKeys),
		maybeCall = require(script.generic.maybeCall),
		new = require(script.generic.new),
	},

	mouse = {
		getMouseHit = require(script.mouse.getMouseHit),
		getMouseUnitRay = require(script.mouse.getMouseUnitRay),
	},

	networking = {
		fireExceptTo = require(script.networking.fireExceptTo)
	},

	players = {
		getCharacterFromUserId = require(script.players.getCharacterFromUserId),
		getPlayerFromUserId = require(script.players.getPlayerFromUserId),
		getUserId = require(script.players.getUserId),
		getUserIdFromCharacter = require(script.players.getUserIdFromCharacter),
	},
}
