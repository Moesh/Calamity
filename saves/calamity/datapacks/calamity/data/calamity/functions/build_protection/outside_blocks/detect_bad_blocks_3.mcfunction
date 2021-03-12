# called by calamity:build_protection/outside_blocks/detect_bad_blocks_16

execute positioned ~ ~ ~ if block ~ ~2 ~ minecraft:air unless block ~ ~ ~ #calamity:valid_outside run function calamity:build_protection/outside_blocks/remove_bad_block
execute positioned ~1 ~ ~ if block ~ ~2 ~ minecraft:air unless block ~ ~ ~ #calamity:valid_outside run function calamity:build_protection/outside_blocks/remove_bad_block
execute positioned ~2 ~ ~ if block ~ ~2 ~ minecraft:air unless block ~ ~ ~ #calamity:valid_outside run function calamity:build_protection/outside_blocks/remove_bad_block
execute positioned ~ ~ ~1 if block ~ ~2 ~ minecraft:air unless block ~ ~ ~ #calamity:valid_outside run function calamity:build_protection/outside_blocks/remove_bad_block
execute positioned ~1 ~ ~1 if block ~ ~2 ~ minecraft:air unless block ~ ~ ~ #calamity:valid_outside run function calamity:build_protection/outside_blocks/remove_bad_block
execute positioned ~2 ~ ~1 if block ~ ~2 ~ minecraft:air unless block ~ ~ ~ #calamity:valid_outside run function calamity:build_protection/outside_blocks/remove_bad_block
execute positioned ~ ~ ~2 if block ~ ~2 ~ minecraft:air unless block ~ ~ ~ #calamity:valid_outside run function calamity:build_protection/outside_blocks/remove_bad_block
execute positioned ~1 ~ ~2 if block ~ ~2 ~ minecraft:air unless block ~ ~ ~ #calamity:valid_outside run function calamity:build_protection/outside_blocks/remove_bad_block
execute positioned ~2 ~ ~2 if block ~ ~2 ~ minecraft:air unless block ~ ~ ~ #calamity:valid_outside run function calamity:build_protection/outside_blocks/remove_bad_block