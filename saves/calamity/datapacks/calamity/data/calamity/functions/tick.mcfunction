# Called from: #minecraft:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Always tick these functions. Calls main game handlers. Sometimes a function is a single
#   line.
#---------------------------------------------------------------------------------------------------
# Any function here usually has it's own handling for lobby time and match time.
function calamity:details

# We know a player has just joined the game. If they're cool, let them pass. If they're not cool,
#   then let them know they're gonna be cool and process them until they are cool. Cool? Cool.
function calamity:player/handle_joining_players

# Feed hungry players, this game isn't about fighting hunger.
effect give @a[scores={food=..19}] minecraft:saturation 1 0 false
effect clear @a[scores={food=20}] minecraft:saturation

# Flag dead players and then do things to them.
execute as @a[scores={timeSinceDeath=0}] if score GameState gameVariable matches 0 run function calamity:player/give_lobby_effects
execute as @a[scores={timeSinceDeath=0}] if score GameState gameVariable matches 1 run function calamity:player/give_match_effects

# Kill players in enemy spawn (But only if their full body is inside and they are standing on a block)
execute as @a[team=blue,tag=Playing,gamemode=!creative,gamemode=!spectator] at @s if block ~ 70 ~0.3 minecraft:barrier if block ~ 70 ~-0.3 minecraft:barrier if block ~0.3 70 ~ minecraft:barrier if block ~-0.3 70 ~ minecraft:barrier if entity @s[nbt={OnGround: 1b}] run kill @s
execute as @a[team=red,tag=Playing,gamemode=!creative,gamemode=!spectator] at @s if block ~ 71 ~0.3 minecraft:barrier if block ~ 71 ~-0.3 minecraft:barrier if block ~0.3 71 ~ minecraft:barrier if block ~-0.3 71 ~ minecraft:barrier if entity @s[nbt={OnGround: 1b}] run kill @s

# Kill entities which aren't allowed in the spawn area
execute as @e[type=#calamity:banned_from_spawn] at @s if block ~ 72 ~ barrier run kill @s

# Determine game state, if necessary
function calamity:game_state/handler

# What if a player selects a team using a trigger?
execute if score GameState gameVariable matches 0 run function calamity:player/trigger_join_team
execute if score GameState gameVariable matches 0 run function calamity:player/trigger_spectate

# Run the functions listed in #calamity:tick_match if a match is running
execute if score GameState gameVariable matches 1 run function #calamity:tick_match
