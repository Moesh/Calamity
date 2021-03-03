# Called from: calamity:game_state/timer_start_match

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
function calamity:load/kill_entities

# Purpose: Establish a SessionID by using game time
execute store result score SessionID gameVariable run time query gametime
scoreboard players operation @a SessionID = SessionID gameVariable

# Make the ore counter visible
function calamity:points/setup_bossbar

#---------------------------------------------------------------------------------------------------
# Purpose: Give players items and effects and let them play the game.
#---------------------------------------------------------------------------------------------------
# Any player on a blue/red team are playing the game
tag @a[team=blue] add Playing
tag @a[team=red] add Playing

# Clear the player's items and effects, give them items, refill their health and hunger
execute as @a[tag=Playing] run function calamity:player/refill_items_and_health
gamemode survival @a[tag=Playing]

# Set the correct scoreboard
scoreboard players operation Goal displayPoints = OreLeft gameVariable
scoreboard players set Blue displayPoints 0
scoreboard players set Red displayPoints 0
scoreboard objectives setdisplay sidebar displayPoints

# Update player triggers
scoreboard players reset * cancelStart
scoreboard players reset * teamSelected
scoreboard players enable @a[tag=Playing] gg

# Teleport players to starting location
tp @a[team=blue] 159 45 90 0 0
spawnpoint @a[team=blue] 159 45 90
tp @a[team=red] 113 45 90 0 0
spawnpoint @a[team=red] 113 45 90

# Reset players item selection and give players the starting item selection
scoreboard players set @a selectedItem -1
scoreboard players set @a[tag=Playing] giveSpawnItems 1

# Send tellraw BEFORE changing any game modes!
tellraw @a {"translate":"%s Go cause a calamity!","color":"green","with":[{"text":">>>","color":"white"}]}
playsound minecraft:event.raid.horn master @a 217 100 195 999999
# Purpose: Update game state
scoreboard players set StartingMatch gameVariable 0
scoreboard players set GameState gameVariable 1