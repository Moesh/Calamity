scoreboard players operation @s progressSecond = @s counter
#scoreboard players operation @s progressSecond /= TWENTY CONST
scoreboard players operation @s progressSecond %= TWENTY CONST
scoreboard players operation @s[score_progressSecond_min=0,score_progressSecond=0] progressSecond = @s counter
scoreboard players operation @s[score_SuccessCount_min=1] progressSecond /= TWENTY CONST
scoreboard players operation @s[score_SuccessCount_min=1] displaySecond = @s progressSecond
execute @s[score_SuccessCount_min=1] ~ ~ ~ blockdata ~-4 ~ ~ {Text2:"{\"translate\":\"Resetting: %s\",\"with\":[{\"score\":{\"name\":\"@e[c=1,r=5,type=area_effect_cloud,name=ResourcePoint]\",\"objective\":\"displaySecond\"}}]}"}