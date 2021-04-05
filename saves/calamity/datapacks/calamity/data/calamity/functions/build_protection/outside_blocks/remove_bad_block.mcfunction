# called by calamity:build_protection/outside_blocks/detect_bad_blocks_3

setblock ~ ~ ~ air destroy

execute positioned ~1 ~ ~ unless block ~ ~ ~ #calamity:valid_outside run function calamity:build_protection/outside_blocks/remove_bad_block
execute positioned ~-1 ~ ~ unless block ~ ~ ~ #calamity:valid_outside run function calamity:build_protection/outside_blocks/remove_bad_block
execute positioned ~ ~1 ~ unless block ~ ~ ~ #calamity:valid_outside run function calamity:build_protection/outside_blocks/remove_bad_block
execute positioned ~ ~-1 ~ unless block ~ ~ ~ #calamity:valid_outside run function calamity:build_protection/outside_blocks/remove_bad_block
execute positioned ~ ~ ~1 unless block ~ ~ ~ #calamity:valid_outside run function calamity:build_protection/outside_blocks/remove_bad_block
execute positioned ~ ~ ~-1 unless block ~ ~ ~ #calamity:valid_outside run function calamity:build_protection/outside_blocks/remove_bad_block