# Called from: nowhere

#>--------------------------------------------------------------------------------------------------
#> Purpose: This function is used for setting up the moving_piston walls.
#>--------------------------------------------------------------------------------------------------

# Call this function manually while standing on a structure void to make the moving_piston walls for
#   all connected structure void. Structure void is expected to be at layer 70.
function calamity:build_protection/setup/set_wall
function calamity:build_protection/setup/reset_wall

# Remove moving pistons at spawn points
fill 159 45 90 159 46 90 minecraft:air
fill 113 45 90 113 46 90 minecraft:air