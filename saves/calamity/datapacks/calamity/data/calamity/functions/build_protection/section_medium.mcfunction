# Called from: calamity:build_protection/handle_explosion

# Do the split into 4x4 sections.
execute store result score #tempVar gameVariable run clone ~-4 69 ~-4 ~-1 69 ~-1 ~-4 69 ~-4 filtered #calamity:void_protection_block force
execute if score #tempVar gameVariable matches 1.. positioned ~-4 ~ ~-4 run function calamity:build_protection/section_small

execute store result score #tempVar gameVariable run clone ~-4 69 ~0 ~-1 69 ~3 ~-4 69 ~0 filtered #calamity:void_protection_block force
execute if score #tempVar gameVariable matches 1.. positioned ~-4 ~ ~0 run function calamity:build_protection/section_small

execute store result score #tempVar gameVariable run clone ~0 69 ~-4 ~3 69 ~-1 ~0 69 ~-4 filtered #calamity:void_protection_block force
execute if score #tempVar gameVariable matches 1.. positioned ~0 ~ ~-4 run function calamity:build_protection/section_small

execute store result score #tempVar gameVariable run clone ~0 69 ~0 ~3 69 ~3 ~0 69 ~0 filtered #calamity:void_protection_block force
execute if score #tempVar gameVariable matches 1.. positioned ~0 ~ ~0 run function calamity:build_protection/section_small