# Called from: #minecraft:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Always tick these functions. Calls main game handlers. Sometimes a function is a single
#   line.
#---------------------------------------------------------------------------------------------------
# Any function here usually has it's own handling for lobby time and match time.

# Let's first check to see if any online player has left the game
execute as @a[scores={leaveGame=1..}] at @s run function moesh:player/left_game

# The functions below will handle players, no matter what state the game is in.
execute as @a[tag=!Registered] at @s run function moesh:player/reset
execute as @a[tag=!Registered] at @s run function moesh:player/enable_triggers
execute as @a[tag=!Registered] at @s run function moesh:player/refill_items_and_health
execute as @a[tag=!Registered] run tellraw @s {"translate":"%s Calamity by Moesh","color":"light_purple","with":[{"text":">>>","color":"white"}]}
tag @a[tag=!Registered] add Registered

# Determine game state, if necessary
function moesh:game_state/handler

# Run the functions listed in #moesh:tick_match if a match is running
execute if score GameState gameVariable matches 1 run function #moesh:tick_match

# Convert end_stone item to cobblestone item.
execute as @e[type=item,nbt={Item:{id:"minecraft:end_stone"}}] run data merge entity @s {Item:{id:"minecraft:cobblestone"}}

