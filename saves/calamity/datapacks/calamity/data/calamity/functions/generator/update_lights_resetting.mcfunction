# Called from: calamity:generator/handler

#---------------------------------------------------------------------------------------------------
# Purpose: Update lights for when a generator is charging
#---------------------------------------------------------------------------------------------------
# Lights turn off right to left.

execute if entity @s[scores={progressLights=..20}] run setblock ^-2 ^-1 ^3 minecraft:redstone_lamp
execute if entity @s[scores={progressLights=40}] run setblock ^-1 ^-1 ^3 minecraft:redstone_lamp
execute if entity @s[scores={progressLights=60}] run setblock ^0 ^-1 ^3 minecraft:redstone_lamp
execute if entity @s[scores={progressLights=80}] run setblock ^1 ^-1 ^3 minecraft:redstone_lamp
execute if entity @s[scores={progressLights=99..100}] run setblock ^2 ^-1 ^3 minecraft:redstone_lamp
