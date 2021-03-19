# Called from: calamity:tick

#---------------------------------------------------------------------------------------------------
# Purpose: If the player has requested to return to the lobby and reset the game, let them.
#   This will reset the map to the lobby state, reset the level and ready the game to be ran again.
#---------------------------------------------------------------------------------------------------
# Reset the trigger
scoreboard players set GameState gameVariable 0

tellraw @a {"translate":">>> Returning to lobby mode"}
function calamity:load/arena/calamity/load_blocks
function calamity:points/check_mines_and_update_objective
function calamity:points/setup_bossbar
execute at @a run function calamity:player/reset_data
execute at @a run function calamity:player/enable_triggers
execute at @a run function calamity:player/refill_items_and_health
execute at @a run function calamity:player/set_to_lobby_mode

scoreboard players set BluePoints gameVariable 0
scoreboard players set RedPoints gameVariable 0

scoreboard players reset @a[scores={reset=1..}] reset