# called from calamity:build_protection/find_roof

fill ~ ~ ~ ~ ~4 ~ minecraft:barrier replace minecraft:glass

execute store result score #tempBounds gameVariable run fill ~ ~ ~ ~ ~2 ~ minecraft:glass replace minecraft:barrier
execute if score #tempBounds gameVariable matches 1.. positioned ~ ~ ~ run function calamity:build_protection/vert_section_2

execute store result score #tempBounds gameVariable run fill ~ ~2 ~ ~ ~4 ~ minecraft:glass replace minecraft:barrier
execute if score #tempBounds gameVariable matches 1.. positioned ~ ~2 ~ run function calamity:build_protection/vert_section_2