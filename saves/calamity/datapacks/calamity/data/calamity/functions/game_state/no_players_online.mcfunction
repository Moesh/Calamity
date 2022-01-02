# Called from: calamity:tick

#>--------------------------------------------------------------------------------------------------
#> Purpose: No players online are detected as playing the game. Advise the players and end the game.
#>--------------------------------------------------------------------------------------------------

# Send a timestamped message
execute if score #OnlinePlayers gameVariable matches 0 if score displaySecond gameVariable matches 0..9 run tellraw @a {"translate":"system.timestamped.message","color": "red","with":[{"translate":"%s:0%s","hoverEvent":{"action":"show_text","contents":[{"translate":"calamity.hover.sessionID","with":[{"score":{"name":"SessionID","objective":"gameVariable"}}]},"\n",{"translate":"calamity.hover.matchTime","with":[{"score":{"name":"MatchTimeInTicks","objective":"gameVariable"}}]}]},"color":"white","with":[{"score":{"name":"displayMinute", "objective":"gameVariable"} },{"score":{"name":"displaySecond", "objective":"gameVariable"}}]},{"translate":"calamity.error.noPlayers"}]}
execute if score #OnlinePlayers gameVariable matches 0 if score displaySecond gameVariable matches 10.. run tellraw @a {"translate":"system.timestamped.message","color": "red","with":[{"translate":"%s:%s","hoverEvent":{"action":"show_text","contents":[{"translate":"calamity.hover.sessionID","with":[{"score":{"name":"SessionID","objective":"gameVariable"}}]},"\n",{"translate":"calamity.hover.matchTime","with":[{"score":{"name":"MatchTimeInTicks","objective":"gameVariable"}}]}]},"color":"white","with":[{"score":{"name":"displayMinute", "objective":"gameVariable"} },{"score":{"name":"displaySecond", "objective":"gameVariable"}}]},{"translate":"calamity.error.noPlayers"}]}
# Reset any remaining online players
execute if score #OnlinePlayers gameVariable matches 0 run function calamity:game_state/reset
# Reset the arena
execute if score #OnlinePlayers gameVariable matches 0 run scoreboard players set #arenaAction gameVariable 0
execute if score #OnlinePlayers gameVariable matches 0 run function calamity:arena/handler