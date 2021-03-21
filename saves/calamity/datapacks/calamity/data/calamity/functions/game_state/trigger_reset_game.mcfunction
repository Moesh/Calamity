# Called from: calamity:tick

#---------------------------------------------------------------------------------------------------
# Purpose: If the player has requested to return to the lobby and reset the game, let them.
#   This will reset the map to the lobby state, reset the level and ready the game to be ran again.
#---------------------------------------------------------------------------------------------------
# Reset the trigger
tellraw @a {"translate":">>> Returning to lobby mode"}
scoreboard players set GameState gameVariable 0

# Reset the whole arena
# TODO: 
function calamity:load/arena/calamity/load_blocks
function calamity:points/check_mines_and_update_objective
function calamity:points/setup_bossbar

# 
execute as @a run function #calamity:register_player
execute as @a run function calamity:player/set_to_lobby_mode

scoreboard players set BluePoints gameVariable 0
scoreboard players set RedPoints gameVariable 0

scoreboard players reset @a[scores={reset=1..}] reset