scoreboard players operation @e[type=area_effect_cloud] progressSecond = @s counter
scoreboard players operation @e[type=area_effect_cloud] progressSecond %= 20 CONST

scoreboard players operation @s[score_progressSecond_min=0,score_progressSecond=0] displaySecond = @s counter
scoreboard players operation @s[score_SuccessCount_min=1] displaySecond /= 20 CONST
scoreboard players operation @s[score_SuccessCount_min=1] displayPercent = @s counter
scoreboard players operation @s[score_SuccessCount_min=1] displayPercent *= -100 CONST


scoreboard players operation @s[score_progressSecond_min=0,score_progressSecond=0,tag=!Resetting] displayPercent /= RunningTime gameRules
scoreboard players operation @s[score_SuccessCount_min=1,tag=!Resetting] displayPercent += 100 CONST
execute @s[score_SuccessCount_min=1,tag=!Resetting] ~ ~ ~ scoreboard players tag @s add UpdateSign
execute @s[tag=UpdateSign] ~ ~ ~ execute @s[tag=FacingWest] ~ ~ ~ blockdata ~-3 ~ ~ {Text2:"{\"translate\":\"Progress: %s%s\",\"with\":[{\"score\":{\"name\":\"@e[c=1,r=5,type=area_effect_cloud,name=ResourcePoint]\",\"objective\":\"displayPercent\"}},\"%\"]}"}
execute @s[tag=UpdateSign] ~ ~ ~ execute @s[tag=FacingEast] ~ ~ ~ blockdata ~3 ~ ~ {Text2:"{\"translate\":\"Progress: %s%s\",\"with\":[{\"score\":{\"name\":\"@e[c=1,r=5,type=area_effect_cloud,name=ResourcePoint]\",\"objective\":\"displayPercent\"}},\"%\"]}"}
scoreboard players tag @s[tag=UpdateSign] remove UpdateSign


scoreboard players operation @s[score_progressSecond_min=0,score_progressSecond=0,tag=Resetting] displayPercent /= ResettingTime gameRules
scoreboard players operation @s[score_SuccessCount_min=1,tag=Resetting] displayPercent += 100 CONST
execute @s[score_SuccessCount_min=1,tag=Resetting] ~ ~ ~ scoreboard players tag @s add UpdateSign
execute @s[tag=UpdateSign] ~ ~ ~ execute @s[tag=FacingWest] ~ ~ ~ blockdata ~-3 ~ ~ {Text2:"{\"translate\":\"Resetting: %s%s\",\"with\":[{\"score\":{\"name\":\"@e[c=1,r=5,type=area_effect_cloud,name=ResourcePoint]\",\"objective\":\"displayPercent\"}},\"%\"]}"}
execute @s[tag=UpdateSign] ~ ~ ~ execute @s[tag=FacingEast] ~ ~ ~ blockdata ~3 ~ ~ {Text2:"{\"translate\":\"Resetting: %s%s\",\"with\":[{\"score\":{\"name\":\"@e[c=1,r=5,type=area_effect_cloud,name=ResourcePoint]\",\"objective\":\"displayPercent\"}},\"%\"]}"}
scoreboard players tag @s[tag=UpdateSign] remove UpdateSign