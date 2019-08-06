# Sugar

An opinionated library full of utility functions that come up commonly during game development.

## Installation

**Model File (Roblox Studio)**
- Download the `rbxm` model file attached to the latest release from the [GitHub releases page](https://github.com/vocksel/sugar/releases).
- Insert the model into Studio into a place like `ReplicatedStorage`

**Filesystem**
- Copy the `src` directory into your codebase
- Rename the folder to `sugar`
- Use a plugin like [Rojo](https://github.com/LPGhatguy/rojo) to sync the files into a place

## API

Require Sugar like any module:

```lua
local Sugar = require(game.ReplicatedStorage.Sugar)
```

Now explore the API:

### Sugar.colors

**`brighten(color: Color3, percent: integer): Color3`**

Brightens a color by a percentage. Useful for having one base color in UI and modifying another.

```lua
local color = Color3.fromRGB(200, 200, 200)
local brighterColor = brighten(color, 20)
```

**`darken(color: Color3, percent: integer): Color3`**

Darkens a color by a percentage. Useful for having one base color in UI and modifying another.

```lua
local color = Color3.fromRGB(200, 200, 200)
local darkerColor = darken(color, 20)
```

### Sugar.debug

**`pretty(value: any): string`**

Converts a value into a nicely formatted string.

This is mostly used for tables as a way to inspect the contents. [`inspect.lua`](https://github.com/kikito/inspect.lua) is the next best thing, but is a bit slow and bogs things down if used in succession. This function is a lot more lightweight.

```lua
local t = {
	foo = true,
	bar = false
}

print(pretty(t))
```
### Sugar.generic

**`bind(obj: table, method: Function): Function`**

Binds a method with its object so that it can be used independently.

This is useful when exposing a method when you don't also want to attach the object to it. For example, when exporting an API.

```lua
local obj = {
	str = "Example",
	foo = function(self)
		print(self.str)
	end
}

local method = bind(obj, obj.foo)

print(method()) -- "Example"
```

**`chooseRandom(list: array): any`**

Returns a random item from the list.

```lua
local item = chooseRandom({ 1, 2, 3, 4, 5 })
print(item) -- 1/5 chance of getting any of them
```

**`getSortedKeys(object: table): array`**

Returns an array of keys from the given object, sorted alphabetically.

This is used so we get a consistent, alphabetical output for tables. Typically dicctionary-like tables aren't sorted, so this fixes that.

```lua
local object = {
	delta = true,
	alpha = true,
	bravo = true,
}

local keys = getSortedKeys(object)

for _, key in pairs(keys) do
	print(key)
end

-- "alpha"
-- "bravo"
-- "delta"
```

**`maybeCall(callback: Function)`**

Calls the given function if it actually exists.

Useful in Roact components where a callback passed as a prop is optional, so you don't always know if you want to run it.

```lua
maybeCall(nil) -- does nothing

maybeCall(function()
	print("Hello!") -- prints hello
end)
```

**`new(props: object, children: object): Instance`**

Allows you to easily construct complex hierarchies of instances.

This has been particularly useful in unit tests, as we can easily fake the DataModel.

```lua
local mockDataModel = new({
	Name = "game"
}, {
	ServerScriptService = newFolder({
		Script = Instance.new("Script")
	}),
	ReplicatedStorage = newFolder({
		Module = Instance.new("ModuleScript")
	})
})
```

### Sugar.mouse

**`getMouseHit(ignoreList: Instance[]): BasePart | nil`**

Returns the BasePart that the mouse hit.

Works the same as `Player:GetMouse().Hit` but allows you to pass in an ignore list, instead of relying on TargetFilter.

```lua
local mouseHit = getMouseHit()

-- Or with an ignore list:
local mouseHit = getMouseHit({ LocalPlayer.Character, workspace.Foo})
```

**`getMouseUnitRay(): Ray | nil`**

Returns a unit ray from the camera to the mouse's position.

This is useful in conjunction with other code to make longer rays that shoot towards the direction of the mouse.

```lua
local unitRay = getMouseRay()
local ray = new Ray(unitRay.Origin, unitRay.Direction.mul(math.huge))
```

### Sugar.networking

**`fireExceptTo(player: Player, event: RemoteEvent, ...args: any[]): void`**

Fires the given event to all players except the one passed in.

This is used for replication. Typically one player will perform an action locally, then tell the server about it. The server then verifies and tells all clients except the one that just performed the action to do the same.

```lua
-- Client
local function changeBaseplateColor()
	local newColor = Color3.fromRGB(255, 0, 0)
	workspace.Baseplate.Color = newColor
	changeColorEvent:FireServer(newColor)
end

changeColorEvent.OnClientEvent:Connect(function(color)
	workspace.Baseplate.Color = color
end)

changeBaseplateColor()

-- Server
changeColorEvent.OnServerEvent:Connect(function(player, color)
	fireExceptTo(player, changeColorEvent, color)
end)
```

### Sugar.players

All UserIds are converted to strings as these are serializable and typically set as keys in tables. Using integers is not great in this case, as they are considered array indices. All functions relating to players in this library revolve around strings for UserIds because of this.

**`getCharacterFromUserId(userId: string): Model | nil`**

Gets the character of a player by their stringified UserId.

```lua
local player = game.Players.LocalPlayer
local userId = tostring(player.UserId)
local char = getCharacterFromUserId(userId)
```

**`getPlayerFromUserId(userId: string): Player | nil`**

Gets a player from their stringified UserId.

```lua
local player = getPlayerFromUserId(userId)
```

**`getUserId(player: Player): string`**

Gets the stringified version of a player's UserId. The pattern `tostring(player.UserId)` is common so this abstracts that way.

```lua
local player = game.Players.LocalPlayer
local userId = getUserId(player)
```

**`getUserIdFromCharacter(character: Model): string`**

Get a player's stringified UserId from their character.

```lua
local player = game.Players.LocalPlayer
local character = player.Character
local userId = getUserIdFromCharacter(character)
```

## Development

Install [Rojo](https://github.com/rojo-rbx/rojo/) and then run the following commands:

```sh
$ rojo build -o sugar.rbxlx
$ rojo serve
```

Open the newly generated place file and start the Rojo plugin.

From here you can modify anything under `src/` and your changes will be synced in.

When you're ready to test, simply press F5 to play the.

