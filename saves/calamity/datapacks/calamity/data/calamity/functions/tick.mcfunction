# Called from: #minecraft:tick

#>--------------------------------------------------------------------------------------------------
#> Purpose: Calamity's entry point. This function ticks every second, and handles top-level logic
#>   for the game. Sometimes functions which have no home also find their way to this function.
#>--------------------------------------------------------------------------------------------------

# We know a player has just joined the game. If they're cool, let them pass. If they're not cool,
#   then let them know they're gonna be cool and process them until they are cool. Cool? Cool.
function calamity:player/handle_joining_players

# Feed hungry players, this game isn't about fighting hunger.
effect give @a[scores={food=..19}] minecraft:saturation 1 0 false
effect clear @a[scores={food=20}] minecraft:saturation

# Some arenas may have special effects or other easter egg cases. Always tick these.
scoreboard players set #arenaAction gameVariable 2
function calamity:arena/handler

# Determine game state, if necessary
execute if score GameState gameVariable matches 0 run function calamity:game_state/tick_lobby
execute if score GameState gameVariable matches 1 run function calamity:game_state/tick_match
execute if score GameState gameVariable matches 2 run function calamity:game_state/tick_post_game