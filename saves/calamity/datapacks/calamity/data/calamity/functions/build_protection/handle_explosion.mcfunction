# Called from: calamity:build_protection/handler

#>--------------------------------------------------------------------------------------------------
#> Purpose: Handle TNT explosions
#>--------------------------------------------------------------------------------------------------

# A TNT has exploded. Now lets fix moving_piston blocks. TNT seems to be able to blow up
#   moving_piston up to around 5 blocks away. The "wall" moving_piston blocks are marked by marker
#   blocks at layer y=254. The "roof" moving_piston blocks are marked by marker blocks at layer
#   y=255. This is the in bounds region. The height of the roof is determined by the height of a
#   marker entity @e[tag=marker,tag=arenaHeight].

# Check for all of these markers to determine where to replace moving_piston blocks. We have to
#   check one block at a time to see if there should be a moving_piston. That is a lot of blocks we
#   have to check, one by one. An x/y/z space of 24x16x24 blocks around the explosion will be
#   checked.

# First check to see if the y height is in range of the arena height. If it is, we have to search
#   y=255 for the bounds region. Since this will be a search over an x/z plane, search y=254 at the
#   same time. If the y height is not in range of the arena height, only search the x/z plane for
#   y=254.
    # The 24x24 x/z search area is split into 12x12 x/z planes and checked for barrier marker blocks. (section_large)
    # If a 12x12 x/z area contains a marker block, split the 12x12 search area 3x3 x/z planes. (section_mediumn)
    # If a 3x3 x/z plane contains a marker block, check each block in that plane for a marker block. (section_small)

# Get the explosion height
execute store result score #tempYLocation gameVariable run data get entity @s Pos[1]

# Only search for fixable height blocks if the explosion was in range of the height
execute store result score #tempHeight gameVariable run data get entity @e[tag=marker,tag=arenaHeight,limit=1,type=minecraft:area_effect_cloud] Pos[1]
scoreboard players operation #tempHeight gameVariable -= #tempYLocation gameVariable
execute if score #tempHeight gameVariable <= 8 CONST if score #tempHeight gameVariable >= -8 CONST run function calamity:build_protection/search/section_large_all
# If the explosion was not in range of the height, only search for walls.
# If it is higher than the map height, it will also be higher than the walls. Only run the wall check if below the map height.
execute if score #tempHeight gameVariable > 8 CONST run function calamity:build_protection/search/section_large

# Reset our temp variables
scoreboard players reset #tempVar gameVariable
scoreboard players reset #tempVar2 gameVariable
scoreboard players reset #tempHeight gameVariable
scoreboard players reset #tempYLocation gameVariable

# Kill the entity if it's the item from a bed explosion
kill @s[type=item]