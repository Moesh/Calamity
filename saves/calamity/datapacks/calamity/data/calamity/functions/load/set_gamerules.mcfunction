# Called from: minecraft:load

#---------------------------------------------------------------------------------------------------
# Purpose: Reset all parts of the map which do not affect the current game state.
#---------------------------------------------------------------------------------------------------
# Control where commands output and how
gamerule commandBlockOutput false
gamerule logAdminCommands false
gamerule sendCommandFeedback false

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
gamerule reducedDebugInfo true
gamerule disableElytraMovementCheck true
gamerule spectatorsGenerateChunks true
gamerule spawnRadius 7
# Submitted for the approval of the Midnight Society...
time set midnight