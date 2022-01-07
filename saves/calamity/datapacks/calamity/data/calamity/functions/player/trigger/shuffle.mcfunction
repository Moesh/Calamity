# Called from: calamity:game_state/tick_lobby

#>--------------------------------------------------------------------------------------------------
#> Purpose: A player has requested to shuffle the players into teams. Let's do it intelligently.
#>--------------------------------------------------------------------------------------------------

# /trigger shuffle set 1: Shuffle players who are not on a team
# /trigger shuffle set 2: Shuffle all players who are not spectators (i.e. opted out)

# Count players
execute store result score #FreePlayers gameVariable if entity @a[team=]
execute store result score #BluePlayers gameVariable if entity @a[team=blue]
execute store result score #RedPlayers gameVariable if entity @a[team=red]
# Add them up in #tempVar
scoreboard players operation #tempVar gameVariable = #FreePlayers gameVariable
scoreboard players operation #tempVar gameVariable += #BluePlayers gameVariable
scoreboard players operation #tempVar gameVariable += #RedPlayers gameVariable

# Errors
execute if entity @a[scores={shuffle=1}] if score #FreePlayers gameVariable matches 0 run function calamity:player/trigger/shuffle_error_no_players
execute if entity @a[scores={shuffle=2}] if score #tempVar gameVariable matches 0 run function calamity:player/trigger/shuffle_error_no_players

# Recursively shuffle remaining available players (without a team, but still opted in)
execute if entity @a[scores={shuffle=1}] if score #FreePlayers gameVariable matches 1.. run function calamity:game_state/shuffle_players

# Recursively shuffle all available players
execute if entity @a[scores={shuffle=2}] if score #tempVar gameVariable matches 1.. run team leave @a[team=red]
execute if entity @a[scores={shuffle=2}] if score #tempVar gameVariable matches 1.. run team leave @a[team=blue]
execute if entity @a[scores={shuffle=2}] if score #tempVar gameVariable matches 1.. run function calamity:game_state/shuffle_players

# Always reset and enable the shuffle trigger during lobby stage
scoreboard players reset @a shuffle
scoreboard players enable @a shuffle