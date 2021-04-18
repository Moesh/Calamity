# called from calamity:build_protection/section_small
# Basically now I have to do that all over again to find where the level heigh is.
# On the positive side, I know the roof is not below me. It is a roof after all.
# I am just going to do a normal binary search on the 8 block vertical.

execute store result score #tempBounds gameVariable run fill ~ ~ ~ ~ ~4 ~ minecraft:glass replace minecraft:barrier
execute if score #tempBounds gameVariable matches 1.. positioned ~ ~ ~ run function calamity:build_protection/vert_section_4


execute store result score #tempBounds gameVariable run fill ~ ~4 ~ ~ ~8 ~ minecraft:glass replace minecraft:barrier
execute if score #tempBounds gameVariable matches 1.. positioned ~ ~4 ~ run function calamity:build_protection/vert_section_4
