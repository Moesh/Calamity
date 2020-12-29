# Called from: moesh:tick

#---------------------------------------------------------------------------------------------------
# Purpose: If the player has requested to return to the lobby and reset the game, let them.
#---------------------------------------------------------------------------------------------------

execute if entity @a[gamemode=!spectator] run tellraw @a {"translate":">>> Returning to lobby mode"}
execute at @a at @s run function moesh:player/reset


# Setup new triggers for the player
scoreboard players reset * startMatch
scoreboard players enable @a cancelStart