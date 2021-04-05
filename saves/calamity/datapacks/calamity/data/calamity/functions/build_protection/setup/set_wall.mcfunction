#replace barrier with glass so it won't be detected again
execute if block ~ ~ ~ minecraft:barrier run setblock ~ ~ ~ minecraft:glass

fill ~ 0 ~ ~ 67 ~ minecraft:moving_piston replace #calamity:protection_replaceable
execute positioned ~1 ~ ~ if block ~ ~ ~ minecraft:barrier run function calamity:build_protection/setup/set_wall
execute positioned ~-1 ~ ~ if block ~ ~ ~ minecraft:barrier run function calamity:build_protection/setup/set_wall
execute positioned ~ ~ ~1 if block ~ ~ ~ minecraft:barrier run function calamity:build_protection/setup/set_wall
execute positioned ~ ~ ~-1 if block ~ ~ ~ minecraft:barrier run function calamity:build_protection/setup/set_wall
execute positioned ~1 ~ ~-1 if block ~ ~ ~ minecraft:barrier run function calamity:build_protection/setup/set_wall
execute positioned ~1 ~ ~1 if block ~ ~ ~ minecraft:barrier run function calamity:build_protection/setup/set_wall
execute positioned ~-1 ~ ~-1 if block ~ ~ ~ minecraft:barrier run function calamity:build_protection/setup/set_wall
execute positioned ~-1 ~ ~1 if block ~ ~ ~ minecraft:barrier run function calamity:build_protection/setup/set_wall
