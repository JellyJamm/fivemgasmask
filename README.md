# FiveM Gask Mask Script v2
a FiveM gas mask script with a Discord role permission system.

## Description
By inputting a command, you become immune to tear gas. Input another command to disable it.

## Commands
`/gasmask on` - takes on

`/gasmask off` - takes off

`/gasmask` - toggles

## Images
![Equipped](https://cdn.discordapp.com/attachments/695031619819536565/786382849699741716/gasmask1.PNG)

![Unequipped](https://cdn.discordapp.com/attachments/695031619819536565/786383093165850654/gasmask2.PNG)

## Videos
https://i.gyazo.com/74d939211e350472aeac709fb4e5feb5.mp4

https://i.gyazo.com/03e2d847fcadf741a61db0f5d4dd0a60.mp4

## Requirements
https://github.com/sadboilogan/discord_perms

**IMPORTANT NOTE:** Do not change the name of the resource. It must be named `dicord_perms`

## Installation
* Set up `discord_perms` (link above)
* Drop the **fivemgasmask-master** folder in your resources directory
* Open the `config.lua` file in **fivemgasmask-master** and input the roles you would like to give access to the gas mask
* Add `start discord_perms` and `start fivemgasmask-master` in your **server.cfg**
* Restart server

**NOTE:** Make sure discord_perms is started ***before*** this script. 

## Improvements in v2
* Added config
* If using a ped, equips an actual gas mask (configurable in the config.lua)
* Given the option to toggle the gasmask opposed to using on and off 

## Contributions
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[GNU GPL 3.0](https://github.com/JellyJamm/disablecombatroll/blob/main/LICENSE)
