# Called from: calamity:build_protection/handle_explosion

# check if there are blocks and split into the small sections
execute store result score #tempVar gameVariable run fill ~-12 73 ~-12 ~-1 73 ~-1 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~-6 ~ ~-6 run function calamity:build_protection/search/section_medium

execute store result score #tempVar gameVariable run fill ~-12 73 ~0 ~-1 73 ~11 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~-6 ~ ~6 run function calamity:build_protection/search/section_medium

execute store result score #tempVar gameVariable run fill ~0 73 ~-12 ~11 73 ~-1 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~6 ~ ~-6 run function calamity:build_protection/search/section_medium

execute store result score #tempVar gameVariable run fill ~0 73 ~0 ~11 73 ~11 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~6 ~ ~6 run function calamity:build_protection/search/section_medium
