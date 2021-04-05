# Called from: calamity:build_protection/handle_explosion

# Put the replaced barrier blocks back
fill ~-6 73 ~-6 ~5 73 ~5 minecraft:barrier replace minecraft:glass

# Do the split into 4x4 sections.
execute store result score #tempVar gameVariable run fill ~-6 73 ~-6 ~-3 73 ~-3 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~-6 ~ ~-6 run function calamity:build_protection/section_small

execute store result score #tempVar gameVariable run fill ~-6 73 ~-2 ~-3 73 ~1 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~-6 ~ ~-2 run function calamity:build_protection/section_small

execute store result score #tempVar gameVariable run fill ~-2 73 ~-6 ~1 73 ~-3 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~-2 ~ ~-6 run function calamity:build_protection/section_small

execute store result score #tempVar gameVariable run fill ~-2 73 ~-2 ~1 73 ~1 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~-2 ~ ~-2 run function calamity:build_protection/section_small

execute store result score #tempVar gameVariable run fill ~-6 73 ~2 ~-3 73 ~5 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~-6 ~ ~2 run function calamity:build_protection/section_small

execute store result score #tempVar gameVariable run fill ~2 73 ~-6 ~5 73 ~-3 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~2 ~ ~-6 run function calamity:build_protection/section_small

execute store result score #tempVar gameVariable run fill ~-2 73 ~2 ~1 73 ~5 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~-2 ~ ~2 run function calamity:build_protection/section_small

execute store result score #tempVar gameVariable run fill ~2 73 ~-2 ~5 73 ~1 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~2 ~ ~-2 run function calamity:build_protection/section_small

execute store result score #tempVar gameVariable run fill ~2 73 ~2 ~5 73 ~5 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~2 ~ ~2 run function calamity:build_protection/section_small
