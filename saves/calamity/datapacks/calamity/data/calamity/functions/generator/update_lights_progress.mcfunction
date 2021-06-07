# Called from: calamity:generator/handler

#>--------------------------------------------------------------------------------------------------
#> Purpose: Convert GeneratorTimer into a percentage in preparation for updating lights
#>--------------------------------------------------------------------------------------------------

# This is done in this way to give lots of freedom to change values at ONE SINGLE POINT instead of
# multiple points. This makes it absurdly easy to iterate while game balancing. I like this a lot.
scoreboard players operation @s progressLights = @s GeneratorTimer
scoreboard players operation @s progressLights *= -100 CONST
scoreboard players operation @s[tag=Charging] progressLights /= GeneratorChargeTime mapRules
scoreboard players operation @s[tag=Resetting] progressLights /= GeneratorResetTime mapRules
scoreboard players operation @s progressLights += 100 CONST