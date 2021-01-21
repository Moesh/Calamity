# Called from: calamity:tick

#---------------------------------------------------------------------------------------------------
# Purpose: If the player has requested to start the game, let them.
#---------------------------------------------------------------------------------------------------
# This variable tracks whether or not game is beginning.
scoreboard players set StartingMatch gameVariable 1

# Start the timer from the beginning
scoreboard players operation TimeInTicks gameVariable = TimeToStartMatch gameVariable

# Setup new triggers for the player
scoreboard players reset * startMatch
scoreboard players enable @a cancelStart