# Called from: calamity:generator/handler

#>--------------------------------------------------------------------------------------------------
#> Purpose: Start the generator!
#>--------------------------------------------------------------------------------------------------

# Each arena could have a special time set for the generator
scoreboard players operation @s GeneratorTimer = GeneratorChargeTime mapRules
execute if entity @s[tag=TeamBlue] run playsound calamity:generator.start master @a[team=blue] ~ ~-2 ~
execute if entity @s[tag=TeamRed] run playsound calamity:generator.start master @a[team=red] ~ ~-2 ~
tag @s add Charging
tag @s remove Start