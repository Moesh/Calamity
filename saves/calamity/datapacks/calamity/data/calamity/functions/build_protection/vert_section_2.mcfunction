# called from calamity:build_protection/vert_section_2

# yay you found it!


fill ~ ~ ~ ~ ~3 ~ minecraft:barrier replace minecraft:glass

execute positioned ~ ~ ~ if block ~ ~ ~ minecraft:barrier run fill ~ ~-1 ~ ~ ~-1 ~ minecraft:moving_piston replace #calamity:protection_replaceable
execute positioned ~ ~1 ~ if block ~ ~ ~ minecraft:barrier run fill ~ ~-1 ~ ~ ~-1 ~ minecraft:moving_piston replace #calamity:protection_replaceable
