# Called from: calamity:map_calamity_rules, calamity:points/setup_bossbar

#---------------------------------------------------------------------------------------------------
# Purpose: Count the iron ore and fill it out.
#---------------------------------------------------------------------------------------------------
execute store result score OreLeft gameVariable run clone 142 68 182 130 0 194 130 0 182 filtered minecraft:iron_ore force