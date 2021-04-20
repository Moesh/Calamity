# Called from: calamity:build_protection/search/section_large_all

# Put the replaced barrier blocks back
fill ~-6 73 ~-6 ~5 74 ~5 minecraft:barrier replace minecraft:glass

# Do the split into 4x4 sections.
execute store result score #tempVar gameVariable run fill ~-6 73 ~-6 ~-3 74 ~-3 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~-6 ~ ~-6 run function calamity:build_protection/search/section_small_all

execute store result score #tempVar gameVariable run fill ~-6 73 ~-2 ~-3 74 ~1 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~-6 ~ ~-2 run function calamity:build_protection/search/section_small_all

execute store result score #tempVar gameVariable run fill ~-2 73 ~-6 ~1 74 ~-3 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~-2 ~ ~-6 run function calamity:build_protection/search/section_small_all

execute store result score #tempVar gameVariable run fill ~-2 73 ~-2 ~1 74 ~1 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~-2 ~ ~-2 run function calamity:build_protection/search/section_small_all

execute store result score #tempVar gameVariable run fill ~-6 73 ~2 ~-3 74 ~5 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~-6 ~ ~2 run function calamity:build_protection/search/section_small_all

execute store result score #tempVar gameVariable run fill ~2 73 ~-6 ~5 74 ~-3 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~2 ~ ~-6 run function calamity:build_protection/search/section_small_all

execute store result score #tempVar gameVariable run fill ~-2 73 ~2 ~1 74 ~5 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~-2 ~ ~2 run function calamity:build_protection/search/section_small_all

execute store result score #tempVar gameVariable run fill ~2 73 ~-2 ~5 74 ~1 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~2 ~ ~-2 run function calamity:build_protection/search/section_small_all

execute store result score #tempVar gameVariable run fill ~2 73 ~2 ~5 74 ~5 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~2 ~ ~2 run function calamity:build_protection/search/section_small_all
