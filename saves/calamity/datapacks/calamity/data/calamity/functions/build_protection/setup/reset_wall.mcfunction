execute if block ~ ~ ~ minecraft:yellow_stained_glass_pane run setblock ~ ~ ~ minecraft:yellow_stained_glass
execute if block ~ ~ ~ minecraft:red_stained_glass_pane run setblock ~ ~ ~ minecraft:red_stained_glass
execute if block ~ ~ ~ minecraft:blue_stained_glass_pane run setblock ~ ~ ~ minecraft:blue_stained_glass

execute positioned ~1 ~ ~ if block ~ ~ ~ #calamity:void_protection_setup_block run function calamity:build_protection/setup/reset_wall
execute positioned ~-1 ~ ~ if block ~ ~ ~ #calamity:void_protection_setup_block run function calamity:build_protection/setup/reset_wall
execute positioned ~ ~ ~1 if block ~ ~ ~ #calamity:void_protection_setup_block run function calamity:build_protection/setup/reset_wall
execute positioned ~ ~ ~-1 if block ~ ~ ~ #calamity:void_protection_setup_block run function calamity:build_protection/setup/reset_wall
execute positioned ~1 ~ ~-1 if block ~ ~ ~ #calamity:void_protection_setup_block run function calamity:build_protection/setup/reset_wall
execute positioned ~1 ~ ~1 if block ~ ~ ~ #calamity:void_protection_setup_block run function calamity:build_protection/setup/reset_wall
execute positioned ~-1 ~ ~-1 if block ~ ~ ~ #calamity:void_protection_setup_block run function calamity:build_protection/setup/reset_wall
execute positioned ~-1 ~ ~1 if block ~ ~ ~ #calamity:void_protection_setup_block run function calamity:build_protection/setup/reset_wall