# Called from: calamity:build_protection/handler

# A tnt has exploded. Now lets fix the walls of moving_piston blocks.
# tnt seems to be able to blow up moving_piston up to around 5 blocks away.
# To know where there is supposed to be moving_piston blocks after they are blown up we use marker blocks at layer y=70 
# Now to fix the wall we just check y=70, if there is a block there then we know we have to fill in some moving_piston blocks
#
# Sadly there is no easy way to find all the y=70 blocks around the explosion.
# We have to check one block at a time to see if there should be a wall or not.
# Thats 11x11 blocks we have to check one by one. And just to be sure we should check a little more so we check 16x16 around the explosion.
# 
# To minimize the amount of commands we need to run we split the 16x16 section into 4 smaller sections which are 8x8 big.
# We then check if those sections contains any blocks at y=70. If they do we split the section into smaller 4x4 sections.
# We then go through the blocks one by one in those 4x4 sections and place moving_piston blocks if needed.

execute store result score #tempYLocation gameVariable run data get entity @s Pos[1]

# check if there are blocks and split into the small sections
execute store result score #tempVar gameVariable run clone ~-8 69 ~-8 ~-1 69 ~-1 ~-8 69 ~-8 filtered #calamity:void_protection_block force
execute if score #tempVar gameVariable matches 1.. positioned ~-4 ~ ~-4 run function calamity:build_protection/section_medium

execute store result score #tempVar gameVariable run clone ~-8 69 ~0 ~-1 69 ~7 ~-8 69 ~0 filtered #calamity:void_protection_block force
execute if score #tempVar gameVariable matches 1.. positioned ~-4 ~ ~3 run function calamity:build_protection/section_medium

execute store result score #tempVar gameVariable run clone ~0 69 ~-8 ~7 69 ~-1 ~0 69 ~-8 filtered #calamity:void_protection_block force
execute if score #tempVar gameVariable matches 1.. positioned ~3 ~ ~-4 run function calamity:build_protection/section_medium

execute store result score #tempVar gameVariable run clone ~0 69 ~0 ~7 69 ~7 ~0 69 ~0 filtered #calamity:void_protection_block force
execute if score #tempVar gameVariable matches 1.. positioned ~3 ~ ~3 run function calamity:build_protection/section_medium

# Reset our temp variables
scoreboard players reset #tempVar gameVariable
scoreboard players reset #tempYLocation gameVariable