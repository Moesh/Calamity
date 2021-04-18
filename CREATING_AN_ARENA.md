# Creating an arena for Calamity

Calamity 5+ has been redesigned to allow multiple arenas for the same gamemode and ruleset. The goal is to let level designers to do what they do best and build the level instead of spending all their time digging through function files.

Don't get it wrong, there is still a bit of work required to create a new arena. You'll need to do some planning on the shape and size of your arena. You'll need to thinking about how to erase the thing entirely.

# Requirements


## Expected files for a pull request
```
calamity/
┣ data/
┃ ┣ calamity/
┃ ┃ ┣ functions/
┃ ┃ ┃ ┣ arena/
┃ ┃ ┃ ┃ ┣ your_arena_name/
┃ ┃ ┃ ┃ ┃ ┣ actions.mcfunction
┃ ┃ ┃ ┃ ┃ ┣ develop.mcfunction
┃ ┃ ┃ ┃ ┃ ┣ erase.mcfunction
┃ ┃ ┃ ┃ ┃ ┣ load_blocks.mcfunction
┃ ┃ ┃ ┃ ┃ ┣ send_welcome_message.mcfunction
┃ ┃ ┃ ┃ ┃ ┗ set_arena_rules.mcfunction
┃ ┃ ┃ ┃ ┗ handler.mcfunction [edits required to make new entries]
┃ ┃ ┗ tags/
┃ ┃   ┣ functions/
┃ ┃ ┃ ┃ ┣ load_arena_1_modern.json [example]
┃ ┃ ┃ ┃ ┣ load_arena_<#>_<your_arena_name>.json
┃ ┃ ┗ structures/
┃ ┃   ┣ your_arena_name/
┃ ┃ ┃ ┃ ┣ lobby.nbt
┃ ┃ ┃ ┃ ┣   ...<additional files>
┃ ┃ ┃ ┃ ┣ logo.nbt
┃ ┃ ┃ ┃ ┣   ...<additional files>
┃ ┃ ┃ ┃ ┣ arena.nbt
┃ ┃ ┃ ┃ ┣   ...<additional files>
```
## Rules
- Arena height goes from y0 to y67.
    - Barrier layer is placed at y68.
- In bounds detection
    - `y70`: Red team x/y spawn zone.
    - `y71`: Move blue team x/y spawn zone. 
    - `y72`: Kills entities who are not allowed here. Works in conjunction with y70 and y71.
    - `y73`: Void lane protection layer (edge)
        - Players cannot place blocks under this layer.
        - Entities can still pass through this block.
        - Spawns
    - `y74`: "In bounds" body indicator is placed at . If a player is under this block, they are in bounds.
    - `z87`: Arena structure blocks should begin here
- Announcer plays at `136 150 89`
- Only the current custom dimension is supported. Consider the fog of war as a feature to enhance your map