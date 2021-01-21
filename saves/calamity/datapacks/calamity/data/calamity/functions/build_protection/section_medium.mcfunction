# Called from: calamity:build_protection/handle_explosion

# Do the split into 4x4 sections.
execute store result score #tempVar gameVariable run clone ~-4 70 ~-4 ~-1 70 ~-1 ~-4 70 ~-4 filtered minecraft:structure_void force
execute if score #tempVar gameVariable matches 1.. positioned ~-4 ~ ~-4 run function calamity:build_protection/section_small

execute store result score #tempVar gameVariable run clone ~-4 70 ~0 ~-1 70 ~3 ~-4 70 ~0 filtered minecraft:structure_void force
execute if score #tempVar gameVariable matches 1.. positioned ~-4 ~ ~0 run function calamity:build_protection/section_small

execute store result score #tempVar gameVariable run clone ~0 70 ~-4 ~3 70 ~-1 ~0 70 ~-4 filtered minecraft:structure_void force
execute if score #tempVar gameVariable matches 1.. positioned ~0 ~ ~-4 run function calamity:build_protection/section_small

execute store result score #tempVar gameVariable run clone ~0 70 ~0 ~3 70 ~3 ~0 70 ~0 filtered minecraft:structure_void force
execute if score #tempVar gameVariable matches 1.. positioned ~0 ~ ~0 run function calamity:build_protection/section_small