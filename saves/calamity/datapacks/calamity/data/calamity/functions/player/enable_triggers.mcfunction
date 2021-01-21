# Called from: calamity:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Register the player on all the scoreboard they need. Enable triggers and set default
#---------------------------------------------------------------------------------------------------

# Always run
scoreboard players set @s sneakTime 0

# Enable if the match is in lobby mode
execute if score GameState gameVariable matches 0 run scoreboard players reset @s startMatch
execute if score GameState gameVariable matches 0 run scoreboard players enable @s startMatch

# Enable if the match is in progress
execute if score GameState gameVariable matches 1 run scoreboard players reset @s gg
execute if score GameState gameVariable matches 1 run scoreboard players enable @s gg
# We recheck the forfeit vote to make sure it doesn't end up in an invalid state
#
# An invalid state could have been hit by:
# Everyone but one players vote for forfeit.
# The player who didn't vote leaves and another player joins in the same tick.
# The player left check in calamity:game_state/handler would miss a player has left.
# The forfeit vote would end up in an invalid state where everyone has voted for forfeit but the game didn't end.
execute if score GameState gameVariable matches 1 run function calamity:game_state/trigger_gg

# Enable if post-game
execute if score GameState gameVariable matches 2 run scoreboard players reset @s reset
execute if score GameState gameVariable matches 2 run scoreboard players enable @s reset