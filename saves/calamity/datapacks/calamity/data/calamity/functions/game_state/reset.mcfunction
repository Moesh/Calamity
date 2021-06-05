# Called from: calamity:tick

#>--------------------------------------------------------------------------------------------------
#> Purpose: If the player has requested to return to the lobby and reset the game, let them.
#   This will reset the map to the lobby state, reset the level and ready the game to be ran again.
#>--------------------------------------------------------------------------------------------------

# Reset the trigger
tellraw @a {"translate":"system.message","color":"green","with":[{"translate":"calamity.resetting"}]}
scoreboard players reset @a[scores={reset=1..}] reset
scoreboard players set GameState gameVariable 0
scoreboard players set BluePoints gameVariable 0
scoreboard players set Blue displayPoints 0
scoreboard players set RedPoints gameVariable 0
scoreboard players set Red displayPoints 0

# Fake players need to join a new team to get rid of their prefixes
team join fakeBlue Blue
team join fakeRed Red

# Reload entire arena. We should not need to erase, as the build should be entirely reset, and no
#   player should have built outside the arena. This is the default action for arena handler.
function calamity:arena/handler

# Send welcome message
scoreboard players set #arenaAction gameVariable 4
function calamity:arena/handler

# Update the SessionID so players are properly handled
execute store result score SessionID gameVariable run time query gametime
scoreboard players operation @a sessionID = SessionID gameVariable

# Return the player to the lobby state
execute as @a run function #calamity:register_player
execute as @a run function calamity:player/set_to_lobby_mode