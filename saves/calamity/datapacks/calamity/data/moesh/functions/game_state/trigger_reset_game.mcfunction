# Called from: moesh:tick

#---------------------------------------------------------------------------------------------------
# Purpose: If the player has requested to return to the lobby and reset the game, let them.
#---------------------------------------------------------------------------------------------------
# Reset the trigger
scoreboard players set GameState gameVariable 0

tellraw @a {"translate":">>> Returning to lobby mode"}
execute at @a at @s run function moesh:player/reset
execute at @a at @s run function moesh:player/refill_items_and_health
execute at @a at @s run function moesh:player/set_to_lobby_mode
execute at @a at @s run function moesh:player/enable_triggers


scoreboard players reset @a[scores={reset=1..}] reset