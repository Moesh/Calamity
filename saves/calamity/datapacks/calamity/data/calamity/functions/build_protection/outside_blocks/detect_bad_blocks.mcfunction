# called from the advancement calamity:build_protection/detect_block_under_barrier

advancement revoke @s only calamity:build_protection/detect_block_under_barrier

execute if entity @s[tag=Playing] positioned ~-12 67 ~-12 run function calamity:build_protection/outside_blocks/detect_bad_blocks_12
execute if entity @s[tag=Playing] positioned ~-12 67 ~ run function calamity:build_protection/outside_blocks/detect_bad_blocks_12
execute if entity @s[tag=Playing] positioned ~ 67 ~-12 run function calamity:build_protection/outside_blocks/detect_bad_blocks_12
execute if entity @s[tag=Playing] positioned ~ 67 ~ run function calamity:build_protection/outside_blocks/detect_bad_blocks_12