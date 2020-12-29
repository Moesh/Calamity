# Called from: moesh:tick

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

# Enable if post-game
execute if score GameState gameVariable matches 2 run scoreboard players reset @s reset
execute if score GameState gameVariable matches 2 run scoreboard players enable @s reset