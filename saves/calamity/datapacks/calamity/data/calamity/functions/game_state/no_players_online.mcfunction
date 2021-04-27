# Called from: calamity:tick

#>--------------------------------------------------------------------------------------------------
#> Purpose: No players online are detected as playing the game. Advise the players and end the game.
#>--------------------------------------------------------------------------------------------------

# Send a message
execute if score #OnlinePlayers gameVariable matches 0 run tellraw @a {"translate":"system.message","color": "red","with":[{"translate":"calamity.error.noPlayers"}]}
# Reset any remaining online players
execute if score #OnlinePlayers gameVariable matches 0 run function calamity:game_state/reset
# Reset the arena
execute if score #OnlinePlayers gameVariable matches 0 run scoreboard players set #arenaAction gameVariable 0
execute if score #OnlinePlayers gameVariable matches 0 run function calamity:arena/handler