# Called from: nowhere

#>--------------------------------------------------------------------------------------------------
#> Purpose: Erase blocks
#>--------------------------------------------------------------------------------------------------

# Blue spawn
fill 143 40 88 175 67 99 minecraft:moving_piston replace minecraft:air
# Lane sides
fill 142 0 87 142 67 180 minecraft:moving_piston
fill 141 68 196 176 0 196 minecraft:moving_piston
fill 176 0 87 176 67 195 minecraft:moving_piston
fill 143 0 87 175 67 87 minecraft:moving_piston
# Lane ceiling
fill 142 68 87 176 68 196 minecraft:moving_piston

# Ensure spawn is always clear.
fill 165 48 90 165 49 90 minecraft:air

# Crosslane
fill 141 0 180 131 67 180 minecraft:moving_piston
fill 141 0 196 131 67 196 minecraft:moving_piston
fill 141 68 180 131 68 196 minecraft:moving_piston