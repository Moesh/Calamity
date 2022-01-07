# Called from: calamity:tick

#>--------------------------------------------------------------------------------------------------
#> Purpose: If the player has requested to start the game, let them.
#>--------------------------------------------------------------------------------------------------

# It's time to start the game!
function calamity:game_state/check_if_start_conditions_met
execute as @a[scores={startMatch=1..},team=blue] run tellraw @a {"translate":"system.message","color":"green","with":[{"translate":"calamity.match.started.byPlayer","color":"blue","with":[{"selector":"@s"},{"translate":"▶"}]}]}
execute as @a[scores={startMatch=1..},team=red] run tellraw @a {"translate":"system.message","color":"green","with":[{"translate":"calamity.match.started.byPlayer","color":"red","with":[{"selector":"@s"},{"translate":"▶"}]}]}
execute if score #PlayersPlaying gameVariable matches 0 run tellraw @a {"translate":"system.message","color":"green","with":[{"translate":"calamity.match.cancelled.noPlayers","color":"red","with":[{"translate":"⏹"}]}]}
execute if score #PlayersPlaying gameVariable matches 0 run function calamity:player/trigger/cancel_start

# This variable tracks whether or not game is beginning
execute if score #PlayersPlaying gameVariable matches 1.. run scoreboard players set StartingMatch gameVariable 1

# Start the timer from the beginning
execute if score #PlayersPlaying gameVariable matches 1.. run scoreboard players operation TimeInTicks gameVariable = TimeToStartMatch gameVariable

# Setup new triggers for the player
execute if score #PlayersPlaying gameVariable matches 0.. run scoreboard players reset * startMatch
execute if score #PlayersPlaying gameVariable matches 0.. run scoreboard players enable * startMatch
execute if score #PlayersPlaying gameVariable matches 1.. run scoreboard players reset * startMatch
execute if score #PlayersPlaying gameVariable matches 1.. run scoreboard players enable @a cancelStart