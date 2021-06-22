# Called from: calamity:build_protection/handle_explosion

#>--------------------------------------------------------------------------------------------------
#> Purpose: Check if there are blocks and split into the small sections
#>--------------------------------------------------------------------------------------------------

execute store result score #tempVar gameVariable run fill ~-12 255 ~-12 ~-1 255 ~-1 minecraft:glass replace minecraft:barrier
execute store result score #tempVar2 gameVariable run fill ~-12 250 ~-12 ~-1 250 ~-1 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~-6 ~ ~-6 run function calamity:build_protection/search/section_medium_all
execute if score #tempVar2 gameVariable matches 1.. if score #tempVar gameVariable matches 0 positioned ~-6 ~ ~-6 run function calamity:build_protection/search/section_medium

execute store result score #tempVar gameVariable run fill ~-12 255 ~0 ~-1 255 ~11 minecraft:glass replace minecraft:barrier
execute store result score #tempVar2 gameVariable run fill ~-12 250 ~0 ~-1 250 ~11 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~-6 ~ ~6 run function calamity:build_protection/search/section_medium_all
execute if score #tempVar2 gameVariable matches 1.. if score #tempVar gameVariable matches 0 positioned ~-6 ~ ~6 run function calamity:build_protection/search/section_medium

execute store result score #tempVar gameVariable run fill ~0 255 ~-12 ~11 255 ~-1 minecraft:glass replace minecraft:barrier
execute store result score #tempVar2 gameVariable run fill ~0 250 ~-12 ~11 250 ~-1 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~6 ~ ~-6 run function calamity:build_protection/search/section_medium_all
execute if score #tempVar2 gameVariable matches 1.. if score #tempVar gameVariable matches 0 positioned ~6 ~ ~-6 run function calamity:build_protection/search/section_medium

execute store result score #tempVar gameVariable run fill ~0 255 ~0 ~11 255 ~11 minecraft:glass replace minecraft:barrier
execute store result score #tempVar2 gameVariable run fill ~0 250 ~0 ~11 250 ~11 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~6 ~ ~6 run function calamity:build_protection/search/section_medium_all
execute if score #tempVar2 gameVariable matches 1.. if score #tempVar gameVariable matches 0 positioned ~6 ~ ~6 run function calamity:build_protection/search/section_medium
