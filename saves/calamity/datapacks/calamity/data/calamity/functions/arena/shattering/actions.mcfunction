# Called from: calamity:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Always tick these functions. Calls main game handlers. Sometimes a function is a single
#   line.
#---------------------------------------------------------------------------------------------------

# This torch particle replication is so important that we must dedicate an entire section to it.
# Torch flame
execute if score #tableCandle gameVariable matches 0 run particle minecraft:flame 136.125 58.65 68.86 0 0 0 0 1 normal
scoreboard players add #tableCandle gameVariable 1
execute if score #tableCandle gameVariable matches 5.. run scoreboard players set #tableCandle gameVariable 0
# Torch smoke!
execute if score #tableCandleSmoke gameVariable matches 0 run particle minecraft:smoke 136.125 58.65 68.86 0 0.1 0 0 1 normal
scoreboard players add #tableCandleSmoke gameVariable 1
execute if score #tableCandleSmoke gameVariable matches 45.. run scoreboard players set #tableCandleSmoke gameVariable 0