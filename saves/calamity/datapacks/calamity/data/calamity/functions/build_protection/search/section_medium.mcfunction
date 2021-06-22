# Called from: calamity:build_protection/search/section_large

# Put the replaced barrier blocks back
fill ~-6 250 ~-6 ~5 250 ~5 minecraft:barrier replace minecraft:glass

# Do the split into 4x4 sections.
execute store result score #tempVar gameVariable run fill ~-6 250 ~-6 ~-3 250 ~-3 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~-6 ~ ~-6 run function calamity:build_protection/search/section_small

execute store result score #tempVar gameVariable run fill ~-6 250 ~-2 ~-3 250 ~1 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~-6 ~ ~-2 run function calamity:build_protection/search/section_small

execute store result score #tempVar gameVariable run fill ~-2 250 ~-6 ~1 250 ~-3 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~-2 ~ ~-6 run function calamity:build_protection/search/section_small

execute store result score #tempVar gameVariable run fill ~-2 250 ~-2 ~1 250 ~1 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~-2 ~ ~-2 run function calamity:build_protection/search/section_small

execute store result score #tempVar gameVariable run fill ~-6 250 ~2 ~-3 250 ~5 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~-6 ~ ~2 run function calamity:build_protection/search/section_small

execute store result score #tempVar gameVariable run fill ~2 250 ~-6 ~5 250 ~-3 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~2 ~ ~-6 run function calamity:build_protection/search/section_small

execute store result score #tempVar gameVariable run fill ~-2 250 ~2 ~1 250 ~5 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~-2 ~ ~2 run function calamity:build_protection/search/section_small

execute store result score #tempVar gameVariable run fill ~2 250 ~-2 ~5 250 ~1 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~2 ~ ~-2 run function calamity:build_protection/search/section_small

execute store result score #tempVar gameVariable run fill ~2 250 ~2 ~5 250 ~5 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~2 ~ ~2 run function calamity:build_protection/search/section_small
