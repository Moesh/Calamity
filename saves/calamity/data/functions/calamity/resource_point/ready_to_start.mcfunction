scoreboard players tag @e[type=area_effect_cloud,name=ResourcePoint,tag=ReadyToStart] remove Resetting
scoreboard players tag @e[type=area_effect_cloud,name=ResourcePoint,tag=ReadyToStart] remove Running
execute @e[type=area_effect_cloud,name=ResourcePoint,tag=ReadyToStart] ~ ~ ~ say Point reset
execute @s ~ ~ ~ blockdata ~-4 ~ ~ {Text2:"{\"translate\":\"Ready\"}"}
scoreboard players tag @e[type=area_effect_cloud,name=ResourcePoint,tag=ReadyToStart] remove ReadyToStart