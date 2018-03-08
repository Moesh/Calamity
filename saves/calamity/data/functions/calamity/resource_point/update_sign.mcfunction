scoreboard players operation @s progressSecond = @s counter
#scoreboard players operation @s progressSecond /= TWENTY CONST
scoreboard players operation @s progressSecond %= TWENTY CONST

scoreboard players operation @s[score_progressSecond_min=0,score_progressSecond=0,tag=!Resetting] displaySecond = @s counter
scoreboard players operation @s[score_SuccessCount_min=1,tag=!Resetting] displaySecond /= TWENTY CONST
execute @s[score_SuccessCount_min=1,tag=!Resetting] ~ ~ ~ blockdata ~-3 ~ ~ {Text2:"{\"translate\":\"Progress: %s\",\"with\":[{\"score\":{\"name\":\"@e[c=1,r=5,type=area_effect_cloud,name=ResourcePoint]\",\"objective\":\"displaySecond\"}}]}"}

scoreboard players operation @s[score_progressSecond_min=0,score_progressSecond=0,tag=Resetting] displaySecond = @s counter
scoreboard players operation @s[score_SuccessCount_min=1,tag=Resetting] displaySecond /= TWENTY CONST
execute @s[score_SuccessCount_min=1,tag=Resetting] ~ ~ ~ blockdata ~-3 ~ ~ {Text2:"{\"translate\":\"Resetting: %s\",\"with\":[{\"score\":{\"name\":\"@e[c=1,r=5,type=area_effect_cloud,name=ResourcePoint]\",\"objective\":\"displaySecond\"}}]}"}