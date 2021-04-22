# Called from: calamity:generator/handler

#>--------------------------------------------------------------------------------------------------
#> Purpose: Start the generator!
#>--------------------------------------------------------------------------------------------------

# Each arena could have a special time set for the generator
scoreboard players operation @s GeneratorTimer = PointChargeTime mapRules
tag @s add Charging
tag @s remove Start