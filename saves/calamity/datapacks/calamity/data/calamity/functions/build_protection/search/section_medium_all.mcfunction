# Called from: calamity:build_protection/search/section_large_all

# Put the replaced barrier blocks back
fill ~-6 254 ~-6 ~5 255 ~5 minecraft:barrier replace minecraft:glass
fill ~-6 250 ~-6 ~5 250 ~5 minecraft:barrier replace minecraft:glass


# Do the split into 4x4 sections.
execute store result score #tempVar gameVariable run fill ~-6 254 ~-6 ~-3 255 ~-3 minecraft:glass replace minecraft:barrier
execute store result score #tempVar2 gameVariable run fill ~-6 250 ~-6 ~-3 250 ~-3 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~-6 ~ ~-6 run function calamity:build_protection/search/section_small_all
execute if score #tempVar2 gameVariable matches 1.. if score #tempVar matches 0 positioned ~-6 ~ ~-6 run function calamity:build_protection/search/section_small

execute store result score #tempVar gameVariable run fill ~-6 254 ~-2 ~-3 255 ~1 minecraft:glass replace minecraft:barrier
execute store result score #tempVar2 gameVariable run fill ~-6 250 ~-2 ~-3 250 ~1 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~-6 ~ ~-2 run function calamity:build_protection/search/section_small_all
execute if score #tempVar2 gameVariable matches 1.. if score #tempVar matches 0 positioned ~-6 ~ ~-2 run function calamity:build_protection/search/section_small

execute store result score #tempVar gameVariable run fill ~-2 254 ~-6 ~1 255 ~-3 minecraft:glass replace minecraft:barrier
execute store result score #tempVar2 gameVariable run fill ~-2 250 ~-6 ~1 250 ~-3 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~-2 ~ ~-6 run function calamity:build_protection/search/section_small_all
execute if score #tempVar2 gameVariable matches 1.. if score #tempVar matches 0 positioned ~-2 ~ ~-6 run function calamity:build_protection/search/section_small

execute store result score #tempVar gameVariable run fill ~-2 254 ~-2 ~1 255 ~1 minecraft:glass replace minecraft:barrier
execute store result score #tempVar2 gameVariable run fill ~-2 250 ~-2 ~1 250 ~1 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~-2 ~ ~-2 run function calamity:build_protection/search/section_small_all
execute if score #tempVar2 gameVariable matches 1.. if score #tempVar matches 0 positioned ~-2 ~ ~-2 run function calamity:build_protection/search/section_small

execute store result score #tempVar gameVariable run fill ~-6 254 ~2 ~-3 255 ~5 minecraft:glass replace minecraft:barrier
execute store result score #tempVar2 gameVariable run fill ~-6 250 ~2 ~-3 250 ~5 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~-6 ~ ~2 run function calamity:build_protection/search/section_small_all
execute if score #tempVar2 gameVariable matches 1.. if score #tempVar matches 0 positioned ~-6 ~ ~2 run function calamity:build_protection/search/section_small

execute store result score #tempVar gameVariable run fill ~2 254 ~-6 ~5 255 ~-3 minecraft:glass replace minecraft:barrier
execute store result score #tempVar2 gameVariable run fill ~2 250 ~-6 ~5 250 ~-3 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~2 ~ ~-6 run function calamity:build_protection/search/section_small_all
execute if score #tempVar2 gameVariable matches 1.. if score #tempVar matches 0 positioned ~2 ~ ~-6 run function calamity:build_protection/search/section_small

execute store result score #tempVar gameVariable run fill ~-2 254 ~2 ~1 255 ~5 minecraft:glass replace minecraft:barrier
execute store result score #tempVar2 gameVariable run fill ~-2 250 ~2 ~1 250 ~5 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~-2 ~ ~2 run function calamity:build_protection/search/section_small_all
execute if score #tempVar2 gameVariable matches 1.. if score #tempVar matches 0 positioned ~-2 ~ ~2 run function calamity:build_protection/search/section_small

execute store result score #tempVar gameVariable run fill ~2 254 ~-2 ~5 255 ~1 minecraft:glass replace minecraft:barrier
execute store result score #tempVar2 gameVariable run fill ~2 250 ~-2 ~5 250 ~1 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~2 ~ ~-2 run function calamity:build_protection/search/section_small_all
execute if score #tempVar2 gameVariable matches 1.. if score #tempVar matches 0 positioned ~2 ~ ~-2 run function calamity:build_protection/search/section_small

execute store result score #tempVar gameVariable run fill ~2 254 ~2 ~5 255 ~5 minecraft:glass replace minecraft:barrier
execute store result score #tempVar2 gameVariable run fill ~2 250 ~2 ~5 250 ~5 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~2 ~ ~2 run function calamity:build_protection/search/section_small_all
execute if score #tempVar2 gameVariable matches 1.. if score #tempVar matches 0 positioned ~2 ~ ~2 run function calamity:build_protection/search/section_small
