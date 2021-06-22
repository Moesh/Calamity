# Called from: calamity:build_protection/search/section_medium

# Put the replaced barrier blocks back
fill ~ 250 ~ ~3 250 ~3 minecraft:barrier replace minecraft:glass

# Check if there is supposed to be a moving_piston wall and fix the wall
execute positioned ~0 ~ ~0 if block ~ 250 ~ minecraft:barrier run function calamity:build_protection/fix_wall
execute positioned ~1 ~ ~0 if block ~ 250 ~ minecraft:barrier run function calamity:build_protection/fix_wall
execute positioned ~2 ~ ~0 if block ~ 250 ~ minecraft:barrier run function calamity:build_protection/fix_wall
execute positioned ~3 ~ ~0 if block ~ 250 ~ minecraft:barrier run function calamity:build_protection/fix_wall
execute positioned ~0 ~ ~1 if block ~ 250 ~ minecraft:barrier run function calamity:build_protection/fix_wall
execute positioned ~1 ~ ~1 if block ~ 250 ~ minecraft:barrier run function calamity:build_protection/fix_wall
execute positioned ~2 ~ ~1 if block ~ 250 ~ minecraft:barrier run function calamity:build_protection/fix_wall
execute positioned ~3 ~ ~1 if block ~ 250 ~ minecraft:barrier run function calamity:build_protection/fix_wall
execute positioned ~0 ~ ~2 if block ~ 250 ~ minecraft:barrier run function calamity:build_protection/fix_wall
execute positioned ~1 ~ ~2 if block ~ 250 ~ minecraft:barrier run function calamity:build_protection/fix_wall
execute positioned ~2 ~ ~2 if block ~ 250 ~ minecraft:barrier run function calamity:build_protection/fix_wall
execute positioned ~3 ~ ~2 if block ~ 250 ~ minecraft:barrier run function calamity:build_protection/fix_wall
execute positioned ~0 ~ ~3 if block ~ 250 ~ minecraft:barrier run function calamity:build_protection/fix_wall
execute positioned ~1 ~ ~3 if block ~ 250 ~ minecraft:barrier run function calamity:build_protection/fix_wall
execute positioned ~2 ~ ~3 if block ~ 250 ~ minecraft:barrier run function calamity:build_protection/fix_wall
execute positioned ~3 ~ ~3 if block ~ 250 ~ minecraft:barrier run function calamity:build_protection/fix_wall