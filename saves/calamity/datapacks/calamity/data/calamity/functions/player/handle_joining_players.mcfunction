# Called from: calamity:tick

#---------------------------------------------------------------------------------------------------
# Purpose: A player has just joined the server. Let's process them.
#---------------------------------------------------------------------------------------------------

# Let's first check to see if any online player has left the game
# If a player fails the initial check in this function, they are no longer registered.
# Player has left the game and their SessionID does not match the current one. Let's reset them.
scoreboard players add @a sessionID 0

# This player has no sessionID. We can assume they have been on the map before, but scoreboards
#   have been reset since then. Calamity often hard resets data, but this doesn't apply to offline
#   players.
execute as @a unless score @s sessionID = SessionID gameVariable run tag @s remove Registered
execute as @a unless score @s sessionID = SessionID gameVariable run tellraw @s {"translate":"system.message","color":"red","with":[{"translate":"calamity.player.sessionID.mismatch"}]}
    # If a match is in-progress, advise the players that the joining player has been made a spectator.
    execute as @a if score GameState gameVariable matches 1 unless score @s sessionID = SessionID gameVariable run tellraw @a {"translate":"system.message","with":[{"translate":"calamity.player.sidelined","color":"green","with":[{"selector":"@s"}]}]}

# The functions below will handle players, no matter what state the game is in.
execute as @a[tag=!Registered] at @s run function #calamity:register_player
execute as @a[tag=!Registered] if score GameState gameVariable matches 0 run function calamity:player/set_to_lobby_mode
execute as @a[tag=!Registered] if score GameState gameVariable matches 1 run gamemode spectator @s
scoreboard players set @a[scores={leftGame=1..}] leftGame 0
tag @a[tag=!Registered] add Registered