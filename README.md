# Colosseum Mode

## Introduction
Colosseum Mode is a custom game mode for Beyond All Reason (BAR) that removes the traditional economy and gives each player a fixed metal budget to spend before the battle begins. All units from all factions are available, and players have 5 minutes to build their armies before combat starts. The mode is designed for fast, strategic, and faction-agnostic battles.

## Tweakunits and Tweakdefs
- **Tweakunits**: These files override unit build options and properties, such as which units factories and commanders can build, disabling reclaiming, and setting up special rules for the Colosseum experience.
- **Tweakdefs**: These files dynamically modify unit and weapon definitions, such as converting all energy costs to metal, removing energy costs for firing weapons, and setting unit limits.

## Setting Up a Lobby with Colosseum Tweaks

There are two ways to set up the tweaks in the lobby:

### Method 1: Using the UI
1. Start a BAR lobby and create a new game room.
2. In the lobby, open the tweaks panel (usually found in advanced or host options).
3. Copy the contents of the desired tweakunits and tweakdefs files, convert them to base64 (see below), and paste them into the appropriate fields in the lobby.
4. Start the game—Colosseum Mode rules will be applied.

### Method 2: Using Chat Commands
1. In the lobby chat, use the following commands to set the tweaks (after converting your tweak file to base64):
   - `!bset tweakunits <your_base64_string>`
   - `!bset tweakdefs <your_base64_string>`
2. You can paste long base64 strings directly after the command. Repeat for each tweak file you want to apply.
3. Start the game—Colosseum Mode rules will be applied.

## Development Guide
### Writing Tweaks
- Tweakunits and tweakdefs are Lua scripts that can use logic (loops, conditions) to modify unit and weapon definitions.
- Tweakdefs can access `UnitDefs` and `WeaponDefs` to make dynamic changes.

### Base64 Conversion
To use your tweaks in the BAR lobby, you must convert the Lua file contents to base64:
1. Use an online tool like [base64encode.org](https://www.base64encode.org/) or a command-line tool:
   - On Linux/macOS: `base64 myfile.lua > myfile.b64`
   - On Windows (PowerShell): `[Convert]::ToBase64String([IO.File]::ReadAllBytes('myfile.lua')) > myfile.b64`
2. Paste the base64 string into the lobby tweaks panel.

### Useful Resources
- [BAR Official Website](https://www.beyondallreason.info/)
- [BAR GitHub](https://github.com/beyond-all-reason/Beyond-All-Reason)
- [SpringRTS Wiki](https://springrts.com/wiki/Main_Page)
- [BAR Discord](https://discord.gg/beyondallreason)
