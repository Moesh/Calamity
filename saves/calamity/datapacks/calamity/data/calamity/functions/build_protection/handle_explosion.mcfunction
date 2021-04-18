# Called from: calamity:build_protection/handler

# A tnt has exploded. Now lets fix the walls of moving_piston blocks.
# tnt seems to be able to blow up moving_piston up to around 5 blocks away.
# To know where there is supposed to be moving_piston blocks after they are blown up we use marker blocks at layer y=[y coordinate used below] 
# Now to fix the wall we just check y=[y coordinate used below], if there is a block there then we know we have to fill in some moving_piston blocks
#
# Sadly there is no easy way to find all the y=[y coordinate used below] blocks around the explosion.
# We have to check one block at a time to see if there should be a wall or not.
# Thats a lot of blocks we have to check one by one. And just to be sure we should check a little more so we check 24x24 around the explosion.
# 
# To minimize the amount of commands we need to run we split the 24x24 section into 4 smaller sections which are 12x12 big.
# We then check if those sections contains any blocks at y=[y coordinate used below]. If they do we split the section into smaller 4x4 sections.
# We then go through the blocks one by one in those 4x4 sections and place moving_piston blocks if needed.
#
# But we also have to fix the moving_piston blocks that may be under the level maximum height barriers, aka the roof.
# These moving_pistons are only going to exist where the in bounds area is marked. In bounds is determined by a barrier layer at
# y=[y coordinate used below that is +1 the other y coordinate used below].
#
# If it is a wall build a wall. If it is not a wall and in bounds build a roof.

execute store result score #tempYLocation gameVariable run data get entity @s Pos[1]

# check if there are blocks and split into the small sections
execute store result score #tempVar gameVariable run fill ~-12 73 ~-12 ~-1 73 ~-1 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~-6 ~ ~-6 run function calamity:build_protection/section_medium

execute store result score #tempBounds gameVariable if score #tempVar gameVariable matches 0 run fill ~-12 74 ~-12 ~-1 74 ~-1 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 0 if score #tempBounds gameVariable matches 1.. positioned ~-6 ~ ~-6 run function calamity:build_protection/section_medium


execute store result score #tempVar gameVariable run fill ~-12 73 ~0 ~-1 73 ~11 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~-6 ~ ~6 run function calamity:build_protection/section_medium

execute store result score #tempBounds gameVariable if score #tempVar gameVariable matches 0 run fill ~-12 74 ~0 ~-1 74 ~11 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 0 if score #tempBounds gameVariable matches 1.. positioned ~-6 ~ ~6 run function calamity:build_protection/section_medium


execute store result score #tempVar gameVariable run fill ~0 73 ~-12 ~11 73 ~-1 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~6 ~ ~-6 run function calamity:build_protection/section_medium

execute store result score #tempBounds gameVariable if score #tempVar gameVariable matches 0 run fill ~0 74 ~-12 ~11 74 ~-1 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 0 if score #tempBounds gameVariable matches 1.. positioned ~6 ~ ~-6 run function calamity:build_protection/section_medium



execute store result score #tempVar gameVariable run fill ~0 73 ~0 ~11 73 ~11 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~6 ~ ~6 run function calamity:build_protection/section_medium

execute store result score #tempBounds gameVariable if score #tempVar gameVariable matches 0 run fill ~0 74 ~0 ~11 74 ~11 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 0 if score #tempBounds gameVariable matches 1.. positioned ~6 ~ ~6 run function calamity:build_protection/section_medium

# Reset our temp variables
scoreboard players reset #tempVar gameVariable
scoreboard players reset #tempYLocation gameVariable
scoreboard players reset #tempBounds gameVariable

# Kill the entity if it's the item from a bed explosion
kill @s[type=item]