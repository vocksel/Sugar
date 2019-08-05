# Sugar

A library full of utility functions that come up commonly during game development.

## Installation

**Model File (Roblox Studio)**
- Download the `rbxm` model file attached to the latest release from the [GitHub releases page](https://github.com/vocksel/sugar/releases).
- Insert the model into Studio into a place like `ReplicatedStorage`

**Filesystem**
- Copy the `src` directory into your codebase
- Rename the folder to `import`
- Use a plugin like [Rojo](https://github.com/LPGhatguy/rojo) to sync the files into a place

## Development
``
Install [Rojo](https://github.com/rojo-rbx/rojo/) and then run the following commands:

```sh
$ rojo build -o place.rbxlx
$ rojo serve
```

Open the newly generated place file and start the Rojo plugin.

From here you can modify anything under `src/` and your changes will be synced in.

When you're ready to test, simply press F5 to play the.
`
