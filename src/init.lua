return {
	children = {
		getNamedChildren = require(script.Parent.children.getNamedChildren)
	},

	colors = {
		brighten = require(script.Parent.colors.brighten),
		darken = require(script.Parent.colors.darken),
	},

	debug = {
		pretty = require(script.Parent.debug.pretty)
	},

	generic = {
		bind = require(script.Parent.generic.bind),
		chooseRandom = require(script.Parent.generic.chooseRandom),
		getSortedKeys = require(script.Parent.generic.getSortedKeys),
		maybeCall = require(script.Parent.generic.maybeCall),
		new = require(script.Parent.generic.new),
	},

	mouse = {
		getMouseHit = require(script.Parent.mouse.getMouseHit),
		getMouseUnitRay = require(script.Parent.mouse.getMouseUnitRay),
	},

	networking = {
		fireExceptTo = require(script.Parent.networking.fireExceptTo)
	},

	players = {
		getCharacterFromUserId = require(script.Parent.players.getCharacterFromUserId),
		getUserIdFromCharacter = require(script.Parent.players.getUserIdFromCharacter),
		getPlayerFromUserId = require(script.Parent.players.getPlayerFromUserId),
		getPlayerUserId = require(script.Parent.players.getPlayerUserId),
	},
}
