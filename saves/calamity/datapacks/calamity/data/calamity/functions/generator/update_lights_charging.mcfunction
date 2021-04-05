# Called from: calamity:generator/handler

#---------------------------------------------------------------------------------------------------
# Purpose: Update lights for when a generator is charging
#---------------------------------------------------------------------------------------------------
# Lights turn on left to right.

# West
execute as @s[tag=FacingWest,scores={progressLights=0}] run setblock ~-3 ~-1 ~2 minecraft:sea_lantern
execute as @s[tag=FacingWest,scores={progressLights=20}] run setblock ~-3 ~-1 ~1 minecraft:sea_lantern
execute as @s[tag=FacingWest,scores={progressLights=40}] run setblock ~-3 ~-1 ~0 minecraft:sea_lantern
execute as @s[tag=FacingWest,scores={progressLights=60}] run setblock ~-3 ~-1 ~-1 minecraft:sea_lantern
execute as @s[tag=FacingWest,scores={progressLights=80}] run setblock ~-3 ~-1 ~-2 minecraft:sea_lantern

# East
execute as @s[tag=FacingEast,scores={progressLights=0}] run setblock ~3 ~-1 ~-2 minecraft:sea_lantern
execute as @s[tag=FacingEast,scores={progressLights=20}] run setblock ~3 ~-1 ~-1 minecraft:sea_lantern
execute as @s[tag=FacingEast,scores={progressLights=40}] run setblock ~3 ~-1 ~0 minecraft:sea_lantern
execute as @s[tag=FacingEast,scores={progressLights=60}] run setblock ~3 ~-1 ~1 minecraft:sea_lantern
execute as @s[tag=FacingEast,scores={progressLights=80}] run setblock ~3 ~-1 ~2 minecraft:sea_lantern