# Called from: calamity:arena/calamity/set_arena_rules, calamity:points/setup_bossbar

#---------------------------------------------------------------------------------------------------
# Purpose: Count the iron ore and fill it out.
#---------------------------------------------------------------------------------------------------
execute store result score OreLeft gameVariable run clone 142 67 181 130 0 195 130 0 181 filtered minecraft:iron_ore force