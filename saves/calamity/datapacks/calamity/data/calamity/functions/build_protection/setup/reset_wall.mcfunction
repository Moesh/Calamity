#replace glass with barrier so it can be detected again
execute if block ~ ~ ~ minecraft:glass run setblock ~ ~ ~ minecraft:barrier

execute positioned ~1 ~ ~ if block ~ ~ ~ minecraft:barrier run function calamity:build_protection/setup/reset_wall
execute positioned ~-1 ~ ~ if block ~ ~ ~ minecraft:barrier run function calamity:build_protection/setup/reset_wall
execute positioned ~ ~ ~1 if block ~ ~ ~ minecraft:barrier run function calamity:build_protection/setup/reset_wall
execute positioned ~ ~ ~-1 if block ~ ~ ~ minecraft:barrier run function calamity:build_protection/setup/reset_wall
execute positioned ~1 ~ ~-1 if block ~ ~ ~ minecraft:barrier run function calamity:build_protection/setup/reset_wall
execute positioned ~1 ~ ~1 if block ~ ~ ~ minecraft:barrier run function calamity:build_protection/setup/reset_wall
execute positioned ~-1 ~ ~-1 if block ~ ~ ~ minecraft:barrier run function calamity:build_protection/setup/reset_wall
execute positioned ~-1 ~ ~1 if block ~ ~ ~ minecraft:barrier run function calamity:build_protection/setup/reset_wall