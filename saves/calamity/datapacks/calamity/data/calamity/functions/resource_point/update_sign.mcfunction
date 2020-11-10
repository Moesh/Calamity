scoreboard players operation @e[type=area_effect_cloud] progressSecond = @s counter
scoreboard players operation @e[type=area_effect_cloud] progressSecond %= 20 CONST

scoreboard players operation @s[scores={progressSecond=0}] displaySecond = @s counter
scoreboard players operation @s[scores={SuccessCount=1..}] displaySecond /= 20 CONST
scoreboard players operation @s[scores={SuccessCount=1..}] displayPercent = @s counter
scoreboard players operation @s[scores={SuccessCount=1..}] displayPercent *= -100 CONST


scoreboard players operation @s[scores={progressSecond=0},tag=!Resetting] displayPercent /= RunningTime gameRules
scoreboard players operation @s[scores={SuccessCount=1..},tag=!Resetting] displayPercent += 100 CONST
execute as @s[scores={SuccessCount=1..},tag=!Resetting] run tag @s add UpdateSign
execute as @s[tag=UpdateSign,tag=FacingWest] run data modify block ~-3 ~ ~ {} append value {Text2:"{\"translate\":\"resourcePoint.sign.progress\",\"with\":[{\"score\":{\"name\":\"@e[c=1,r=5,type=area_effect_cloud,name=ResourcePoint]\",\"objective\":\"displayPercent\"}}]}"}
execute as @s[tag=UpdateSign,tag=FacingEast] run data modify block ~3 ~ ~ {} append value {Text2:"{\"translate\":\"resourcePoint.sign.progress\",\"with\":[{\"score\":{\"name\":\"@e[c=1,r=5,type=area_effect_cloud,name=ResourcePoint]\",\"objective\":\"displayPercent\"}}]}"}
tag @s[tag=UpdateSign] remove UpdateSign


scoreboard players operation @s[scores={progressSecond=0},tag=Resetting] displayPercent /= ResettingTime gameRules
scoreboard players operation @s[scores={SuccessCount=1..},tag=Resetting] displayPercent += 100 CONST
execute as @s[scores={SuccessCount=1..},tag=Resetting] run tag @s add UpdateSign
execute as @s[tag=UpdateSign,tag=FacingWest] run data modify block ~-3 ~ ~ {} append value {Text2:"{\"translate\":\"resourcePoint.sign.resetting\",\"with\":[{\"score\":{\"name\":\"@e[c=1,r=5,type=area_effect_cloud,name=ResourcePoint]\",\"objective\":\"displayPercent\"}}]}"}
execute as @s[tag=UpdateSign,tag=FacingEast] run data modify block ~3 ~ ~ {} append value {Text2:"{\"translate\":\"resourcePoint.sign.resetting\",\"with\":[{\"score\":{\"name\":\"@e[c=1,r=5,type=area_effect_cloud,name=ResourcePoint]\",\"objective\":\"displayPercent\"}}]}"}
tag @s[tag=UpdateSign] remove UpdateSign