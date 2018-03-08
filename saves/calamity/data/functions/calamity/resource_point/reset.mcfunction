scoreboard players tag @e[type=area_effect_cloud,name=ResourcePoint,tag=ReadyToStart] remove Resetting
scoreboard players tag @e[type=area_effect_cloud,name=ResourcePoint,tag=ReadyToStart] remove Running
execute @e[type=area_effect_cloud,name=ResourcePoint,tag=ReadyToStart] ~ ~ ~ say Point reset
execute @s[tag=FacingWest] ~ ~ ~ blockdata ~-3 ~ ~ {Text2:"{\"translate\":\"Ready\"}"}
execute @s[tag=FacingEast] ~ ~ ~ blockdata ~-3 ~ ~ {Text2:"{\"translate\":\"Ready\"}"}
scoreboard players tag @e[type=area_effect_cloud,name=ResourcePoint,tag=ReadyToStart] remove ReadyToStart