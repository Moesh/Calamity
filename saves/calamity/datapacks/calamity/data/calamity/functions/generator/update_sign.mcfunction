# Called from: calamity:generator/handler

#---------------------------------------------------------------------------------------------------
# Purpose: Update sign on all resource and effect points
#---------------------------------------------------------------------------------------------------
# Only update signs every second
scoreboard players operation @s progressSecond = @s PointTimer
scoreboard players operation @s progressSecond %= 20 CONST

# Take PointTimer and convert it to seconds and a percentage, for some dumb reason.
scoreboard players operation @s[scores={progressSecond=0}] displaySecond = @s PointTimer
scoreboard players operation @s[scores={progressSecond=0}] displaySecond /= 20 CONST

# Calculate percentage to be totally obtuse and awesome.
scoreboard players operation @s displayPercent = @s PointTimer
scoreboard players operation @s displayPercent *= -100 CONST
scoreboard players operation @s displayPercent /= PointChargeTime mapRules
scoreboard players operation @s displayPercent += 100 CONST
# Update sign with charging percentage
execute at @s[tag=Charging] at @s run data merge block ^ ^ ^3 {Text2: '{"translate":"calamity.generator.sign.progress","with":[{"score":{"name":"@e[limit=1,distance=..4,type=area_effect_cloud]","objective":"displayPercent"}}]}'}
# Update sign with resetting percentage
execute at @s[tag=Resetting] at @s run data merge block ^ ^ ^3 {Text2: '{"translate":"calamity.generator.sign.resetting","with":[{"score":{"name":"@e[limit=1,distance=..4,type=area_effect_cloud]","objective":"displayPercent"}}]}'}
