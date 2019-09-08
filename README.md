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

### Sugar.audio

**`playRandomSound(sounds: Sound[])`**

Plays one of the given sounds at random.

This is useful for things like dialog, where you can have many sounds for when a letter plays, so you can alternate between them instead of having one static sound.

```lua
playRandomSound({ 1, 2, 3, 4 })
```

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

### Sugar.characters

**`clearAccessories(character: Model)`**

Clears out all the accessories from a character.

This is useful when creating your own custom appearance code for characters,
where you need to remove all their accessories and start fresh.

```lua
clearaAccessories(workspace.Player1)
```

**`combineDescriptions(base: HumanoidDescription, override: HumanoidDescription): HumanoidDescription`**

Combines two HumanoidDescriptions into one.

This allows you to easily mix and match a base HumanoidDescription with a predefined HumanoidDescription, so that players can still look like themselves with some alterations.

```lua
local base = Instance.new("HumanoidDescription")
base.HairAccessory = "1"
base.NeckAccessory = "3"

local override = Instance.new("HumanoidDescription")
override.HairAccessory = "2"

local combined = combineDescriptions(base, override)

print(combined.HairAccessory) -- 2
print(combined.NeckAccessory) -- 3
```

**`isAirborne(state: HumanoidStateType): boolean`**

Checks if a character is currently airborne by their HumanoidStateType.

```lua
isAirborne(character.Humanoid:GetState())
```

**`isAlive(character: Model): boolean`**

Checks if the given character is still alive.

This is useful to check various things about the character, such as if they're still in the DatModel, as well as if the Humanoid is alive.

This will check that:

- The `character` is non-nil
- `character` is a descendant of the workspace.
- The Humanoid exists
- The Humanoid's health is greater than 0

```lua
if isAlive(player.Character) then
	print("still living!")
end
```

**`isGrounded(state: HumanoidStateType): boolean`**

Checks if a character is currently on the ground by their HumanoidStateType.

```lua
isGrounded(character.Humanoid:GetState())
```

**`loadAccessories(humanoid: Humanoid, accessories: Array<Accessory>): void`**

Loads all the given accessories onto

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

**`visualizeRadius(size: number, model: Model, color: Color3, yOffset?: number)`**

Allows for easy visualization of a radius.

The `model` must have a PrimaryPart. This is needed for bounding box calculations.

This is useful for determining how far away a player needs to be from an NPC to interact, or how far away the player can be before an enemy will start aggroing.

```lua
-- Places a red, 20 stud radius at the bottom of an NPC
visualizeRadius(20, npc, Color3.fromRGB(255, 0, 0))

-- Using more than one radius. The last value sets how far up the radius is
-- pushed so they don't overlap
visualizeRadius(20, npc, Color3.fromRGB(255, 0, 0), 0.2)
visualizeRadius(30, npc, Color3.fromRGB(255, 206, 73), 0.1)
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

**`onNextEvent(event: RBXScriptSignal, callback: function): void`**

Connects to an event for the next time it's triggered.

A common idiom is to keep a reference to the connection around and disconnect it inside the listener. This function abstracts that.

```lua
-- This will only fire for the next player to join the game
onNextEvent(game.Players.PlayerAdded, function(player)
	print(player, "is the lucky player!")
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

### Sugar.timing

**`async(callback: function): void`**

Runs a function asynchronously in its own thread.

This is similar to `spawn()`, but executes immediately instead of waiting an arbitrary amount of time before executing the wrapped code.

This prints `a`, then one second later prints `b`:

```lua
async(function()
    wait(1)
    print("b")
end)
print(a)
```

**`yield(waitTime: number): void`**

Yields the current thread for the given amount of time.

This is a better alternative to `wait()`, as the amount of time it waits is deterministic. This uses Heartbeat for consistent timing.

```lua
yield(10)
print("Hello")
yield(10)
print("World")
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

