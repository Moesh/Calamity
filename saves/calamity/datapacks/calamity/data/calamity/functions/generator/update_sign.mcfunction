# Called from: calamity:generator/handler

#>--------------------------------------------------------------------------------------------------
#> Purpose: Update sign on all resource and effect points
#>--------------------------------------------------------------------------------------------------

# Only update signs every second
scoreboard players operation @s progressSecond = @s GeneratorTimer
scoreboard players operation @s progressSecond %= 20 CONST

# Take GeneratorTimer and convert it to seconds and a percentage, for some dumb reason.
scoreboard players operation @s[scores={progressSecond=0}] displaySecond = @s GeneratorTimer
scoreboard players operation @s[scores={progressSecond=0}] displaySecond /= 20 CONST

# Calculate percentage to be totally obtuse and awesome.
scoreboard players operation @s displayPercent = @s GeneratorTimer
scoreboard players operation @s displayPercent *= -100 CONST
scoreboard players operation @s displayPercent /= GeneratorChargeTime mapRules
scoreboard players operation @s displayPercent += 100 CONST

# Update sign with charging percentage
execute at @s[tag=Charging] at @s run data merge block ^ ^ ^3 {Text3: '{"translate":"calamity.generator.sign.progress","with":[{"score":{"name":"@e[limit=1,distance=..4,type=minecraft:area_effect_cloud]","objective":"displayPercent"}}]}'}
# Update sign with resetting percentage
execute at @s[tag=Resetting] at @s run data merge block ^ ^ ^3 {Text3: '{"translate":"calamity.generator.sign.resetting","with":[{"score":{"name":"@e[limit=1,distance=..4,type=minecraft:area_effect_cloud]","objective":"displayPercent"}}]}'}