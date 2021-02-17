#replace glass with glass pane so it won't be detected again
execute if block ~ ~ ~ minecraft:yellow_stained_glass run setblock ~ ~ ~ minecraft:yellow_stained_glass_pane
execute if block ~ ~ ~ minecraft:red_stained_glass run setblock ~ ~ ~ minecraft:red_stained_glass_pane
execute if block ~ ~ ~ minecraft:blue_stained_glass run setblock ~ ~ ~ minecraft:blue_stained_glass_pane

fill ~ 0 ~ ~ 67 ~ minecraft:moving_piston replace #calamity:protection_replaceable
execute positioned ~1 ~ ~ if block ~ ~ ~ #calamity:void_protection_block run function calamity:build_protection/setup/set_wall
execute positioned ~-1 ~ ~ if block ~ ~ ~ #calamity:void_protection_block run function calamity:build_protection/setup/set_wall
execute positioned ~ ~ ~1 if block ~ ~ ~ #calamity:void_protection_block run function calamity:build_protection/setup/set_wall
execute positioned ~ ~ ~-1 if block ~ ~ ~ #calamity:void_protection_block run function calamity:build_protection/setup/set_wall
execute positioned ~1 ~ ~-1 if block ~ ~ ~ #calamity:void_protection_block run function calamity:build_protection/setup/set_wall
execute positioned ~1 ~ ~1 if block ~ ~ ~ #calamity:void_protection_block run function calamity:build_protection/setup/set_wall
execute positioned ~-1 ~ ~-1 if block ~ ~ ~ #calamity:void_protection_block run function calamity:build_protection/setup/set_wall
execute positioned ~-1 ~ ~1 if block ~ ~ ~ #calamity:void_protection_block run function calamity:build_protection/setup/set_wall
