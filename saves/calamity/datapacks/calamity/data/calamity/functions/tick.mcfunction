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
execute as @a[tag=!Registered] run tellraw @s {"translate":"%s Calamity by Moesh","color":"light_purple","with":[{"text":">>>","color":"white"}]}
tag @a[tag=!Registered] add Registered


# Feed hungry players, this game isn't about fighting hunger.
effect give @a[scores={food=..19}] minecraft:saturation 1 0 false
effect clear @a[scores={food=20}] minecraft:saturation

## Kill players who are in the void
#execute as @a[tag=Playing] at @s if block ~ 69 ~ air run effect give @s minecraft:slowness 1 7
#execute as @a[tag=Playing] at @s if block ~ 69 ~ air run effect give @s minecraft:weakness 1 7
#execute as @a[tag=Playing] at @s if block ~ 69 ~ air run effect give @s minecraft:mining_fatigue 1 7
#execute as @a[tag=Playing] at @s if block ~ 69 ~ air run title @s subtitle {"translate": "Out of bounds!","color":"red"} 
#execute as @a[tag=Playing] at @s if block ~ 69 ~ air run title @s title {"translate": ""} 

# Determine game state, if necessary
function calamity:game_state/handler
# What if a player selects a team using a trigger?
execute if score GameState gameVariable matches 0 run function calamity:player/trigger_join_team

# Run the functions listed in #calamity:tick_match if a match is running
execute if score GameState gameVariable matches 1 run function #calamity:tick_match
