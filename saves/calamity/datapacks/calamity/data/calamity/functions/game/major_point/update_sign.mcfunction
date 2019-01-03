scoreboard players operation @e[type=area_effect_cloud] progressSecond = @s counter
scoreboard players operation @e[type=area_effect_cloud] progressSecond %= 20 CONST

scoreboard players operation @s[score_progressSecond_min=0,score_progressSecond=0] displaySecond = @s counter
scoreboard players operation @s[score_SuccessCount_min=1] displaySecond /= 20 CONST
scoreboard players operation @s[score_SuccessCount_min=1] displayPercent = @s counter
scoreboard players operation @s[score_SuccessCount_min=1] displayPercent *= -100 CONST

scoreboard players operation @s[score_progressSecond_min=0,score_progressSecond=0,tag=!Resetting] displayPercent /= MajorRunningTime gameRules
scoreboard players operation @s[score_SuccessCount_min=1,tag=!Resetting] displayPercent += 100 CONST
execute @s[score_SuccessCount_min=1,tag=!Resetting] ~ ~ ~ scoreboard players tag @s add UpdateSign
execute @s[tag=UpdateSign] ~ ~ ~ blockdata ~ ~ ~-6 {Text2:"{\"translate\":\"resourcePoint.sign.progress\",\"with\":[{\"score\":{\"name\":\"@e[c=1,r=7,type=area_effect_cloud,name=MajorPoint]\",\"objective\":\"displayPercent\"}}]}"}
scoreboard players tag @s[tag=UpdateSign] remove UpdateSign

scoreboard players operation @s[score_progressSecond_min=0,score_progressSecond=0,tag=Resetting] displayPercent /= MajorResettingTime gameRules
scoreboard players operation @s[score_SuccessCount_min=1,tag=Resetting] displayPercent += 100 CONST
execute @s[score_SuccessCount_min=1,tag=Resetting] ~ ~ ~ scoreboard players tag @s add UpdateSign
execute @s[tag=UpdateSign] ~ ~ ~ blockdata ~ ~ ~-6 {Text2:"{\"translate\":\"resourcePoint.sign.resetting\",\"with\":[{\"score\":{\"name\":\"@e[c=1,r=7,type=area_effect_cloud,name=MajorPoint]\",\"objective\":\"displayPercent\"}}]}"}
scoreboard players tag @s[tag=UpdateSign] remove UpdateSign