# Called from: calamity:generator/handler

#---------------------------------------------------------------------------------------------------
# Purpose: Update lights for when a generator is charging
#---------------------------------------------------------------------------------------------------
# Lights turn off right to left.

# West
execute if entity @s[tag=FacingWest,scores={progressLights=..20}] run setblock ~-3 ~-1 ~-2 minecraft:redstone_lamp
execute if entity @s[tag=FacingWest,scores={progressLights=40}] run setblock ~-3 ~-1 ~-1 minecraft:redstone_lamp
execute if entity @s[tag=FacingWest,scores={progressLights=60}] run setblock ~-3 ~-1 ~0 minecraft:redstone_lamp
execute if entity @s[tag=FacingWest,scores={progressLights=80}] run setblock ~-3 ~-1 ~1 minecraft:redstone_lamp
execute if entity @s[tag=FacingWest,scores={progressLights=99..100}] run setblock ~-3 ~-1 ~2 minecraft:redstone_lamp

# East
execute if entity @s[tag=FacingEast,scores={progressLights=..20}] run setblock ~3 ~-1 ~2 minecraft:redstone_lamp
execute if entity @s[tag=FacingEast,scores={progressLights=40}] run setblock ~3 ~-1 ~1 minecraft:redstone_lamp
execute if entity @s[tag=FacingEast,scores={progressLights=60}] run setblock ~3 ~-1 ~0 minecraft:redstone_lamp
execute if entity @s[tag=FacingEast,scores={progressLights=80}] run setblock ~3 ~-1 ~-1 minecraft:redstone_lamp
execute if entity @s[tag=FacingEast,scores={progressLights=99..100}] run setblock ~3 ~-1 ~-2 minecraft:redstone_lamp
