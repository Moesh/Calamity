# Called from: #calamity:register_player, calamity:game_state/start_match, calamity:player/trigger_reset_game

#---------------------------------------------------------------------------------------------------
# Purpose: Take ores from players and keep track until the end of the game.
#---------------------------------------------------------------------------------------------------

# Refill health and food
effect give @s minecraft:regeneration 3 10 false
effect give @s minecraft:saturation 5 100 false