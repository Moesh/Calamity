# Called from: minecraft:load

#---------------------------------------------------------------------------------------------------
# Purpose: Reset all parts of the map which do not affect the current game state.
#---------------------------------------------------------------------------------------------------
# Control where commands output and how
gamerule commandBlockOutput false
gamerule logAdminCommands false
gamerule sendCommandFeedback true

# Set specific rules for this map
gamerule doDaylightCycle false
gamerule keepInventory false
gamerule doTileDrops true
gamerule doWeatherCycle false
weather clear 1000000
gamerule showDeathMessages true
gamerule naturalRegeneration true
gamerule doImmediateRespawn true

# Other gamerules
gamerule disableRaids true
gamerule doInsomnia false
gamerule doLimitedCrafting false
gamerule announceAdvancements false
gamerule doEntityDrops true
gamerule doFireTick true
gamerule doMobLoot true
gamerule doMobSpawning false
gamerule mobGriefing false
gamerule doPatrolSpawning false
gamerule doTraderSpawning false

# Probably never needs to change
gamerule maxCommandChainLength 65536
gamerule maxEntityCramming 0
gamerule randomTickSpeed 10
gamerule reducedDebugInfo false
gamerule disableElytraMovementCheck true
gamerule spectatorsGenerateChunks true
gamerule spawnRadius 7

tellraw @a[gamemode=creative] {"translate":">>> %s","color":"white","with":[{"translate":"Gamerules set","color":"light_purple"}]}

# Submitted for the approval of the Midnight Society...
time set midnight
tellraw @a[gamemode=creative] {"translate":">>> %s","color":"white","with":[{"translate":"Time set to midnight","color":"light_purple"}]}

# The vanilla datapack has only a few required items to make the game work, like fluids.
# We'll replace this in our datapack.
datapack disable vanilla
tellraw @a[gamemode=creative] {"translate":">>> %s","color":"white","with":[{"translate":"Vanilla datapack disabled","color":"light_purple"}]}
