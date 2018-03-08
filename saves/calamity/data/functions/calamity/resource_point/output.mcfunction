scoreboard players tag @e[type=area_effect_cloud,name=ResourcePoint,tag=Output] add Resetting
scoreboard players operation @e[type=area_effect_cloud,name=ResourcePoint,tag=Output] counter = ResettingTime gameRules
execute @e[type=area_effect_cloud,name=ResourcePoint,tag=Output] ~ ~ ~ say Resources given
execute @s[tag=FacingWest] ~ ~ ~ blockdata ~-3 ~ ~ {Text2:"{\"translate\":\"Activated!\"}"}
execute @s[tag=FacingEast] ~ ~ ~ blockdata ~3 ~ ~ {Text2:"{\"translate\":\"Activated!\"}"}
scoreboard players tag @e[type=area_effect_cloud,name=ResourcePoint,tag=Output] remove Output