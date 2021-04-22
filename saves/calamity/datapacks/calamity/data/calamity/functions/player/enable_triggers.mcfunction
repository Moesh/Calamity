# Called from: #calamity:register_player

#>--------------------------------------------------------------------------------------------------
#> Purpose: Reset all potential triggers and enable ones based on current game mode.
#>--------------------------------------------------------------------------------------------------

# Reset everything each time this function is run
scoreboard players reset @s arena
scoreboard players reset @s gg
scoreboard players reset @s selectTeam
scoreboard players reset @s shuffle
scoreboard players reset @s startMatch
scoreboard players reset @s toggleSpectator

# Enable if the match is in lobby mode
execute if score GameState gameVariable matches 0 run scoreboard players enable @s arena
execute if score GameState gameVariable matches 0 run scoreboard players enable @s selectTeam
execute if score GameState gameVariable matches 0 run scoreboard players enable @s shuffle
execute if score GameState gameVariable matches 0 run scoreboard players enable @s startMatch
execute if score GameState gameVariable matches 0 run scoreboard players enable @s toggleSpectator

# Enable if the match is in progress
execute if score GameState gameVariable matches 1 run scoreboard players enable @s gg
# We recheck the forfeit vote to make sure it doesn't end up in an invalid state.
# An invalid state could have been hit by:
#   - Everyone but one players vote for forfeit.
#   - The player who didn't vote leaves and another player joins in the same tick.
#   - The player left check would miss a player has left.
#   - The forfeit vote would end up in an invalid state where everyone has voted for forfeit but
#       the game didn't end.
execute if score GameState gameVariable matches 1 run function calamity:player/trigger_gg

# Enable if post-game
execute if score GameState gameVariable matches 2 run scoreboard players reset @s reset
execute if score GameState gameVariable matches 2 run scoreboard players enable @s reset