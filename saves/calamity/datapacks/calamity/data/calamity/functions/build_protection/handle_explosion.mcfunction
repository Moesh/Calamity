# Called from: calamity:build_protection/handler

# A tnt has exploded. Now lets fix the walls of moving_piston blocks.
# tnt seems to be able to blow up moving_piston up to around 5 blocks away.
# To know where there is supposed to be moving_piston blocks after they are blown up we use marker blocks at layer y=70 
# Now to fix the wall we just check y=70, if there is a block there then we know we have to fill in some moving_piston blocks
#
# Sadly there is no easy way to find all the y=70 blocks around the explosion.
# We have to check one block at a time to see if there should be a wall or not.
# Thats a lot of blocks we have to check one by one. And just to be sure we should check a little more so we check 24x24 around the explosion.
# 
# To minimize the amount of commands we need to run we split the 24x24 section into 4 smaller sections which are 12x12 big.
# We then check if those sections contains any blocks at y=70. If they do we split the section into smaller 4x4 sections.
# We then go through the blocks one by one in those 4x4 sections and place moving_piston blocks if needed.

execute store result score #tempYLocation gameVariable run data get entity @s Pos[1]

# check if there are blocks and split into the small sections
execute store result score #tempVar gameVariable run fill ~-12 73 ~-12 ~-1 73 ~-1 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~-6 ~ ~-6 run function calamity:build_protection/section_medium

execute store result score #tempVar gameVariable run fill ~-12 73 ~0 ~-1 73 ~11 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~-6 ~ ~6 run function calamity:build_protection/section_medium

execute store result score #tempVar gameVariable run fill ~0 73 ~-12 ~11 73 ~-1 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~6 ~ ~-6 run function calamity:build_protection/section_medium

execute store result score #tempVar gameVariable run fill ~0 73 ~0 ~11 73 ~11 minecraft:glass replace minecraft:barrier
execute if score #tempVar gameVariable matches 1.. positioned ~6 ~ ~6 run function calamity:build_protection/section_medium

# Reset our temp variables
scoreboard players reset #tempVar gameVariable
scoreboard players reset #tempYLocation gameVariable

# Kill the entity if it's the item from a bed explosion
kill @s[type=item]