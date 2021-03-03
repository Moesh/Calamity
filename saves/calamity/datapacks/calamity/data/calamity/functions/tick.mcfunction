# Called from: #minecraft:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Always tick these functions. Calls main game handlers. Sometimes a function is a single
#   line.
#---------------------------------------------------------------------------------------------------
# Any function here usually has it's own handling for lobby time and match time.

# Let's first check to see if any online player has left the game
# If a player fails the initial check in this function, they are no longer registered.
execute as @a[scores={leaveGame=1..}] at @s run function calamity:player/left_game

# The functions below will handle players, no matter what state the game is in.
execute as @a[tag=!Registered] at @s run function #calamity:register_player
execute as @a[tag=!Registered] run function calamity:load/arena/calamity/send_welcome_message
tag @a[tag=!Registered] add Registered

# Feed hungry players, this game isn't about fighting hunger.
effect give @a[scores={food=..19}] minecraft:saturation 1 0 false
effect clear @a[scores={food=20}] minecraft:saturation

# Kill players who are in the void
execute as @a[tag=Playing] at @s if block ~ 69 ~ #calamity:out_of_bounds_block run function calamity:player/out_of_bounds

# Kill players in enemy spawn (But only if their full body is inside and they are standing on a block)
execute as @a[team=blue,tag=Playing,gamemode=!creative,gamemode=!spectator] at @s if block ~ 69 ~0.3 minecraft:red_stained_glass if block ~ 69 ~-0.3 minecraft:red_stained_glass if block ~0.3 69 ~ minecraft:red_stained_glass if block ~-0.3 69 ~ minecraft:red_stained_glass if entity @s[nbt={OnGround:1b}] run kill @s
execute as @a[team=red,tag=Playing,gamemode=!creative,gamemode=!spectator] at @s if block ~ 69 ~0.3 minecraft:blue_stained_glass if block ~ 69 ~-0.3 minecraft:blue_stained_glass if block ~0.3 69 ~ minecraft:blue_stained_glass if block ~-0.3 69 ~ minecraft:blue_stained_glass if entity @s[nbt={OnGround:1b}] run kill @s

# Kill entities which aren't allowed in the spawn area
execute as @e[type=#calamity:banned_from_spawn] at @s if block ~ 69 ~ #calamity:spawn_area_block run kill @s

# Determine game state, if necessary
function calamity:game_state/handler
# What if a player selects a team using a trigger?
execute if score GameState gameVariable matches 0 run function calamity:player/trigger_join_team

# Run the functions listed in #calamity:tick_match if a match is running
execute if score GameState gameVariable matches 1 run function #calamity:tick_match
