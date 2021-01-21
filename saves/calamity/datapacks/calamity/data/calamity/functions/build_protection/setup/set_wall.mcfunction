#replace structure void with void air so it wont be detected again
setblock ~ ~ ~ minecraft:black_stained_glass

fill ~ 0 ~ ~ 67 ~ minecraft:moving_piston
execute positioned ~1 ~ ~ if block ~ ~ ~ minecraft:structure_void run function calamity:build_protection/setup/set_wall
execute positioned ~-1 ~ ~ if block ~ ~ ~ minecraft:structure_void run function calamity:build_protection/setup/set_wall
execute positioned ~ ~ ~1 if block ~ ~ ~ minecraft:structure_void run function calamity:build_protection/setup/set_wall
execute positioned ~ ~ ~-1 if block ~ ~ ~ minecraft:structure_void run function calamity:build_protection/setup/set_wall
execute positioned ~1 ~ ~-1 if block ~ ~ ~ minecraft:structure_void run function calamity:build_protection/setup/set_wall
execute positioned ~1 ~ ~1 if block ~ ~ ~ minecraft:structure_void run function calamity:build_protection/setup/set_wall
execute positioned ~-1 ~ ~-1 if block ~ ~ ~ minecraft:structure_void run function calamity:build_protection/setup/set_wall
execute positioned ~-1 ~ ~1 if block ~ ~ ~ minecraft:structure_void run function calamity:build_protection/setup/set_wall