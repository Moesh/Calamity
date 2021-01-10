# Called from: moesh:game_state/timer_start_match

#---------------------------------------------------------------------------------------------------
# Purpose: Reset the map and player states to neutral
#---------------------------------------------------------------------------------------------------
# Set map rules
difficulty normal
gamerule doInsomnia false
gamerule showDeathMessages true
gamerule announceAdvancements false
gamerule doFireTick true

# Set map rules and clean-up
# Kill all non-player, non-villager entities
function moesh:load/clear_entities

# Purpose: Establish a SessionID by using game time
execute store result score SessionID gameVariable run time query gametime
scoreboard players operation @a SessionID = SessionID gameVariable

# Set the map to Phase 1 when the game begins.
scoreboard players set Phase gameVariable 1
scoreboard players operation PhaseMultiplier gameVariable = Phase1Multiplier mapRules

# Make the ore counter visible
function moesh:points/setup_bossbar

#---------------------------------------------------------------------------------------------------
# Purpose: Give players items and effects and let them play the game.
#---------------------------------------------------------------------------------------------------
# Any player on a blue/red team are playing the game
tag @a[team=blue] add Playing
tag @a[team=red] add Playing

# Clear the player's items and effects, give them items, refill their health and hunger
execute as @a[tag=Playing] run function moesh:player/refill_items_and_health
gamemode survival @a[tag=Playing]

# Set the correct scoreboard
scoreboard players operation Goal displayPoints = RequiredToWin mapRules
scoreboard players set Blue displayPoints 0
scoreboard players set Red displayPoints 0
scoreboard objectives setdisplay sidebar displayPoints

# Update player triggers
scoreboard players reset * cancelStart
scoreboard players reset * teamSelected
scoreboard players enable @a[tag=Playing] gg

# Teleport players to starting location
tp @a[team=blue] 192 41 118
spawnpoint @a[team=blue] 192 41 118
tp @a[team=red] 80 41 118
spawnpoint @a[team=red] 80 41 118

# Send tellraw BEFORE changing any game modes!
tellraw @a {"translate":"%s Go cause a calamity!","color":"green","with":[{"text":">>>","color":"white"}]}
tellraw @a {"translate":"%s Phase %s begins! %sx points multiplier.","color":"green","with":[{"text":">>>","color":"white"},{"translate":"1","color":"white"},{"score":{"name":"PhaseMultiplier","objective":"gameVariable"},"color":"white"}]}
playsound minecraft:event.raid.horn master @a 217 100 195 999999
# Purpose: Update game state
scoreboard players set StartingMatch gameVariable 0
scoreboard players set GameState gameVariable 1