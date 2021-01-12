# Called from: moesh:tick

#---------------------------------------------------------------------------------------------------
# Purpose: If the player has requested to return to the lobby and reset the game, let them.
#   This will reset the map to the lobby state, reset the level and ready the game to be ran again.
#---------------------------------------------------------------------------------------------------
# Reset the trigger
scoreboard players set GameState gameVariable 0

tellraw @a {"translate":">>> Returning to lobby mode"}
function moesh:load/map_calamity
execute as @a run function moesh:player/spectate
execute at @a run function moesh:player/reset
execute at @a run function moesh:player/refill_items_and_health
execute at @a run function moesh:player/set_to_lobby_mode
execute at @a run function moesh:player/enable_triggers

# Reset the ores bossbar.
bossbar set moesh:iron_ore visible false
bossbar remove moesh:iron_ore

scoreboard players set BluePoints gameVariable 0
scoreboard players set RedPoints gameVariable 0


scoreboard players reset @a[scores={reset=1..}] reset