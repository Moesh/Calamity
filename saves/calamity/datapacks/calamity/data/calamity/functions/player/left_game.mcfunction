# Called from: calamity:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Reset all parts of the map which do not affect the current game state.
#---------------------------------------------------------------------------------------------------
# Player has left the game and their SessionID does not match the current one. Let's reset them.
execute unless score @s sessionID = SessionID gameVariable run tag @s remove Registered
# If a match is in-progress, advise the players that the joining player has been made a spectator.
execute if score GameState gameVariable matches 1 unless score @s sessionID = SessionID gameVariable run tellraw @a {"translate":"system.message","with":[{"translate":"calamity.player.sidelined","color":"green","with":[{"selector":"@s"}]}]}
scoreboard players set @s leftGame 0