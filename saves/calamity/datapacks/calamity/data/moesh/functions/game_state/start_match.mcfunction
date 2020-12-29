# Called from: moesh:game_state/timer_start_match

#---------------------------------------------------------------------------------------------------
# Purpose: Reset the map and player states to neutral
#---------------------------------------------------------------------------------------------------
# Set map rules
difficulty normal
gamerule doInsomnia false
gamerule showDeathMessages true
gamerule announceAdvancements true
gamerule doFireTick true
gamerule doMobSpawning true
gamerule mobGriefing true

# Set map rules and clean-up
# Kill all non-player, non-villager entities
function moesh:load/clear_entities

# Purpose: Establish a SessionID by using game time
execute store result score SessionID gameVariable run time query gametime
scoreboard players operation @a SessionID = SessionID gameVariable

#---------------------------------------------------------------------------------------------------
# Purpose: Give players items and effects and let them play the game.
#---------------------------------------------------------------------------------------------------
# Any player on a blue/red team are playing the game
tag @a[team=blue] add Playing
tag @a[team=red] add Playing

# Send tellraw BEFORE changing any game modes!
tellraw @a {"translate":"%s Go cause a calamity!","color":"green","with":[{"text":">>>","color":"white"}]}
playsound minecraft:event.raid.horn master @a 217 100 195 999999

# Clear the player's items and effects, give them items, refill their health and hunger
execute as @a[tag=Playing] run function moesh:player/refill_items_and_health
gamemode survival @a[tag=Playing]

# Update player triggers
scoreboard players reset * cancelStart
scoreboard players enable @a[tag=Playing] gg

#---------------------------------------------------------------------------------------------------
# Purpose: Update game state
#---------------------------------------------------------------------------------------------------
scoreboard players set StartingMatch gameVariable 0
scoreboard players set GameState gameVariable 1