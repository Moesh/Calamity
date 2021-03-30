# Called from: calamity:tick

#---------------------------------------------------------------------------------------------------
# Purpose: If the player has requested to return to the lobby and reset the game, let them.
#   This will reset the map to the lobby state, reset the level and ready the game to be ran again.
#---------------------------------------------------------------------------------------------------
# Reset the trigger
tellraw @a {"translate":"%s Returning to lobby mode","color":"green","with":[{"translate":">>>","color":"white"}]}
scoreboard players reset @a[scores={reset=1..}] reset
scoreboard players set GameState gameVariable 0
scoreboard players set BluePoints gameVariable 0
scoreboard players set RedPoints gameVariable 0

# Fake players need to join a new team to get rid of their prefixes
team join fakeBlue Blue
team join fakeRed Red

# Reset the whole arena
# TODO: Add support for multiple arenas
function calamity:load/arena/calamity/load_blocks
function calamity:points/check_mines_and_update_objective
function calamity:points/setup_bossbar

# Return the player to the lobby state
execute as @a run function #calamity:register_player
execute as @a run function calamity:player/set_to_lobby_mode