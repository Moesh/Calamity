# Called from: calamity:build_protection/handle_explosion

# Do the split into 4x4 sections.
execute store result score #tempVar gameVariable run clone ~-6 69 ~-6 ~-3 69 ~-3 ~-6 69 ~-6 filtered #calamity:void_protection_block force
execute if score #tempVar gameVariable matches 1.. positioned ~-6 ~ ~-6 run function calamity:build_protection/section_small

execute store result score #tempVar gameVariable run clone ~-6 69 ~-2 ~-3 69 ~1 ~-6 69 ~-2 filtered #calamity:void_protection_block force
execute if score #tempVar gameVariable matches 1.. positioned ~-6 ~ ~-2 run function calamity:build_protection/section_small

execute store result score #tempVar gameVariable run clone ~-2 69 ~-6 ~1 69 ~-3 ~-2 69 ~-6 filtered #calamity:void_protection_block force
execute if score #tempVar gameVariable matches 1.. positioned ~-2 ~ ~-6 run function calamity:build_protection/section_small

execute store result score #tempVar gameVariable run clone ~-2 69 ~-2 ~1 69 ~1 ~-2 69 ~-2 filtered #calamity:void_protection_block force
execute if score #tempVar gameVariable matches 1.. positioned ~-2 ~ ~-2 run function calamity:build_protection/section_small

execute store result score #tempVar gameVariable run clone ~-6 69 ~2 ~-3 69 ~5 ~-6 69 ~2 filtered #calamity:void_protection_block force
execute if score #tempVar gameVariable matches 1.. positioned ~-6 ~ ~2 run function calamity:build_protection/section_small

execute store result score #tempVar gameVariable run clone ~2 69 ~-6 ~5 69 ~-3 ~2 69 ~-6 filtered #calamity:void_protection_block force
execute if score #tempVar gameVariable matches 1.. positioned ~2 ~ ~-6 run function calamity:build_protection/section_small

execute store result score #tempVar gameVariable run clone ~-2 69 ~2 ~1 69 ~5 ~-2 69 ~2 filtered #calamity:void_protection_block force
execute if score #tempVar gameVariable matches 1.. positioned ~-2 ~ ~2 run function calamity:build_protection/section_small

execute store result score #tempVar gameVariable run clone ~2 69 ~-2 ~5 69 ~1 ~2 69 ~-2 filtered #calamity:void_protection_block force
execute if score #tempVar gameVariable matches 1.. positioned ~2 ~ ~-2 run function calamity:build_protection/section_small

execute store result score #tempVar gameVariable run clone ~2 69 ~2 ~5 69 ~5 ~2 69 ~2 filtered #calamity:void_protection_block force
execute if score #tempVar gameVariable matches 1.. positioned ~2 ~ ~2 run function calamity:build_protection/section_small
