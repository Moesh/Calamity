# Called from: calamity:arena/handler

#>--------------------------------------------------------------------------------------------------
#> Purpose: Load world blocks
#>--------------------------------------------------------------------------------------------------

fill 72 0 89 203 3 143 minecraft:air
fill 72 4 89 203 7 143 minecraft:air
fill 72 8 89 203 11 143 minecraft:air
fill 72 12 89 203 15 143 minecraft:air
fill 72 16 89 203 19 143 minecraft:air
fill 72 20 89 203 23 143 minecraft:air
fill 72 24 89 203 27 143 minecraft:air
fill 72 28 89 203 31 143 minecraft:air
fill 72 32 89 203 35 143 minecraft:air
fill 72 36 89 203 39 143 minecraft:air
fill 72 40 89 203 43 143 minecraft:air
fill 72 44 89 203 47 143 minecraft:air
fill 72 48 89 203 49 143 minecraft:air

#>--------------------------------------------------------------------------------------------------
#> Purpose: Erase things
#>--------------------------------------------------------------------------------------------------

# Erase level loading
fill 138 0 88 138 0 89 minecraft:air
fill 138 0 136 138 0 137 minecraft:air
fill 186 0 88 186 0 89 minecraft:air
fill 186 0 136 186 0 137 minecraft:air
fill 137 0 142 137 0 143 minecraft:air
fill 137 0 94 137 0 95 minecraft:air
fill 89 0 142 89 0 143 minecraft:air
fill 89 0 94 89 0 95 minecraft:air

# Erase data
fill 72 255 143 203 255 89 minecraft:barrier

#> Purpose: Kill all entities and ensure items are left over
#IMPORTANT: This will kill any entity markers. Run before new markers are made.
function calamity:load/kill_entities