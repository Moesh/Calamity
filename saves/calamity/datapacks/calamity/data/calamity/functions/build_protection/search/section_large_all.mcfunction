# Called from: calamity:build_protection/handle_explosion

# check if there are blocks and split into the small sections
execute store result score #tempVar gameVariable run fill ~-12 254 ~-12 ~-1 255 ~-1 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~-6 ~ ~-6 run function calamity:build_protection/search/section_medium_all

execute store result score #tempVar gameVariable run fill ~-12 254 ~0 ~-1 255 ~11 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~-6 ~ ~6 run function calamity:build_protection/search/section_medium_all

execute store result score #tempVar gameVariable run fill ~0 254 ~-12 ~11 255 ~-1 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~6 ~ ~-6 run function calamity:build_protection/search/section_medium_all

execute store result score #tempVar gameVariable run fill ~0 254 ~0 ~11 255 ~11 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~6 ~ ~6 run function calamity:build_protection/search/section_medium_all
