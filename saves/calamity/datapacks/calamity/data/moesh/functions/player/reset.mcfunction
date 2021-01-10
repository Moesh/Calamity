# Called from: moesh:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Reset all parts of the map which do not affect the current game state.
#---------------------------------------------------------------------------------------------------

# Tags
tag @s remove Playing

# Clear player of their blessings.
clear @s
effect clear @s
xp set @s 0 levels
xp set @s 0 points

scoreboard players set @s kills 0

# Register player in the food scoreboard
effect give @a minecraft:hunger 1 100 true

# Register the player on the health scoreboard
effect give @s minecraft:absorption 3 4 false
# Refill stats
effect give @s minecraft:instant_health 3 10 true
effect give @s minecraft:saturation 5 10 true

# Reset map to lobby state

# Set players game mode
# Game is in lobby mode and make them join the right team
execute if score GameState gameVariable matches 0 as @s at @s run function moesh:player/set_to_lobby_mode

# Game is in-progress or post-match
execute if score GameState gameVariable matches 1..2 as @s at @s run function moesh:player/spectate