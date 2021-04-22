# Called from: calamity:generator/handler

#---------------------------------------------------------------------------------------------------
# Purpose: Update lights for when a generator is charging
#---------------------------------------------------------------------------------------------------
# Lights turn on left to right.

# West
execute as @s[scores={progressLights=0}] run setblock ^2 ^-1 ^3 minecraft:sea_lantern
execute as @s[scores={progressLights=20}] run setblock ^1 ^-1 ^3 minecraft:sea_lantern
execute as @s[scores={progressLights=40}] run setblock ^0 ^-1 ^3 minecraft:sea_lantern
execute as @s[scores={progressLights=60}] run setblock ^-1 ^-1 ^3 minecraft:sea_lantern
execute as @s[scores={progressLights=80}] run setblock ^-2 ^-1 ^3 minecraft:sea_lantern
