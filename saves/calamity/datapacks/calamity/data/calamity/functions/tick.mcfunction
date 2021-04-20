# Called from: #minecraft:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Always tick these functions
#---------------------------------------------------------------------------------------------------

# Some arenas may have special effects or other easter egg cases. Always tick these.
scoreboard players set #arenaAction gameVariable 2
function calamity:arena/handler

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
execute as @a[team=blue,tag=Playing,gamemode=!creative,gamemode=!spectator] at @s if block ~ 252 ~0.3 minecraft:barrier if block ~ 252 ~-0.3 minecraft:barrier if block ~0.3 252 ~ minecraft:barrier if block ~-0.3 252 ~ minecraft:barrier if entity @s[nbt={OnGround: 1b}] run kill @s
execute as @a[team=red,tag=Playing,gamemode=!creative,gamemode=!spectator] at @s if block ~ 253 ~0.3 minecraft:barrier if block ~ 253 ~-0.3 minecraft:barrier if block ~0.3 253 ~ minecraft:barrier if block ~-0.3 253 ~ minecraft:barrier if entity @s[nbt={OnGround: 1b}] run kill @s

# Kill entities which aren't allowed in the spawn area
execute as @e[type=#calamity:banned_from_spawn] at @s if block ~ 251 ~ barrier run kill @s

# Determine game state, if necessary
function calamity:game_state/handler

# What if a player selects a team using a trigger?
execute if score GameState gameVariable matches 0 run function calamity:player/trigger_join_team
execute if score GameState gameVariable matches 0 run function calamity:player/trigger_spectate
execute if score GameState gameVariable matches 0 run function calamity:player/trigger_arena

# Run the functions listed in #calamity:tick_match if a match is running
execute if score GameState gameVariable matches 1 run function #calamity:tick_match