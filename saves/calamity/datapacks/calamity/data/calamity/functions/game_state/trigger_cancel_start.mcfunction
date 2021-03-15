# Called from: calamity:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Cancel the timer to start a match
#---------------------------------------------------------------------------------------------------
scoreboard players set StartingMatch gameVariable 0
tellraw @a {"translate":"%s Match has been cancelled","color":"red","with":[{"text":">>>","color":"white"}]}

# Setup new triggers for the player
scoreboard players reset * cancelStart
scoreboard players enable @a startMatch