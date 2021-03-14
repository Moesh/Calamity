# Called from: calamity:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Reset all parts of the map which do not affect the current game state.
#---------------------------------------------------------------------------------------------------
# Player has left the game and their SessionID does not match the current one. Let's reset them.
execute unless score @s sessionID = SessionID gameVariable run tag @s remove Registered

# If a match is in-progress, advise the players that the joining player has been made a spectator.
execute if score GameState gameVariable matches 1 unless score @s sessionID = SessionID gameVariable run tellraw @a {"translate":"%s %s has been moved to the sidelines. Nothing has been affected. The match continues!","color":"green","with":[{"text":">>>","color":"white"},{"selector":"@s"}]}

# 
scoreboard players set @s leftGame 0