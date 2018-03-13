scoreboard players operation @s progressSecond = @s counter
#scoreboard players operation @s progressSecond /= TWENTY CONST
scoreboard players operation @s progressSecond %= TWENTY CONST

scoreboard players operation @s[score_progressSecond_min=0,score_progressSecond=0,tag=!Resetting] displaySecond = @s counter
scoreboard players operation @s[score_SuccessCount_min=1,tag=!Resetting] displaySecond /= TWENTY CONST
execute @s[score_SuccessCount_min=1,tag=!Resetting] ~ ~ ~ scoreboard players tag @s add UpdateSign
execute @s[tag=UpdateSign] ~ ~ ~ execute @s[tag=FacingWest] ~ ~ ~ blockdata ~-3 ~ ~ {Text2:"{\"translate\":\"resourcePoint.sign.progress\",\"with\":[{\"score\":{\"name\":\"@e[c=1,r=5,type=area_effect_cloud,name=ResourcePoint]\",\"objective\":\"displaySecond\"}}]}"}
execute @s[tag=UpdateSign] ~ ~ ~ execute @s[tag=FacingEast] ~ ~ ~ blockdata ~3 ~ ~ {Text2:"{\"translate\":\"resourcePoint.sign.progress\",\"with\":[{\"score\":{\"name\":\"@e[c=1,r=5,type=area_effect_cloud,name=ResourcePoint]\",\"objective\":\"displaySecond\"}}]}"}
scoreboard players tag @s[tag=UpdateSign] remove UpdateSign

scoreboard players operation @s[score_progressSecond_min=0,score_progressSecond=0,tag=Resetting] displaySecond = @s counter
scoreboard players operation @s[score_SuccessCount_min=1,tag=Resetting] displaySecond /= TWENTY CONST
execute @s[score_SuccessCount_min=1,tag=Resetting] ~ ~ ~ scoreboard players tag @s add UpdateSign
execute @s[tag=UpdateSign] ~ ~ ~ execute @s[tag=FacingWest] ~ ~ ~ blockdata ~-3 ~ ~ {Text2:"{\"translate\":\"resourcePoint.sign.resetting\",\"with\":[{\"score\":{\"name\":\"@e[c=1,r=5,type=area_effect_cloud,name=ResourcePoint]\",\"objective\":\"displaySecond\"}}]}"}
execute @s[tag=UpdateSign] ~ ~ ~ execute @s[tag=FacingEast] ~ ~ ~ blockdata ~3 ~ ~ {Text2:"{\"translate\":\"resourcePoint.sign.resetting\",\"with\":[{\"score\":{\"name\":\"@e[c=1,r=5,type=area_effect_cloud,name=ResourcePoint]\",\"objective\":\"displaySecond\"}}]}"}
scoreboard players tag @s[tag=UpdateSign] remove UpdateSign