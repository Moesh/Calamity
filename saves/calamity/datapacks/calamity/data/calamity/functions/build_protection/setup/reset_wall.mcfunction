setblock ~ ~ ~ minecraft:structure_void

execute positioned ~1 ~ ~ if block ~ ~ ~ minecraft:black_stained_glass run function calamity:build_protection/setup/reset_wall
execute positioned ~-1 ~ ~ if block ~ ~ ~ minecraft:black_stained_glass run function calamity:build_protection/setup/reset_wall
execute positioned ~ ~ ~1 if block ~ ~ ~ minecraft:black_stained_glass run function calamity:build_protection/setup/reset_wall
execute positioned ~ ~ ~-1 if block ~ ~ ~ minecraft:black_stained_glass run function calamity:build_protection/setup/reset_wall
execute positioned ~1 ~ ~-1 if block ~ ~ ~ minecraft:black_stained_glass run function calamity:build_protection/setup/reset_wall
execute positioned ~1 ~ ~1 if block ~ ~ ~ minecraft:black_stained_glass run function calamity:build_protection/setup/reset_wall
execute positioned ~-1 ~ ~-1 if block ~ ~ ~ minecraft:black_stained_glass run function calamity:build_protection/setup/reset_wall
execute positioned ~-1 ~ ~1 if block ~ ~ ~ minecraft:black_stained_glass run function calamity:build_protection/setup/reset_wall