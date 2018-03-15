# Progressing
# More than one second left
execute @s[tag=!Resetting,score_displaySecond_min=2] ~ ~ ~ execute @a[r=7] ~ ~ ~ detect ~ ~-2 ~ minecraft:bedrock 0 scoreboard players tag @s add GiveMessage
title @a[tag=GiveMessage] actionbar {"translate":"resourcePoint.statusMessage.progressSeconds","color":"green","with":[{"score":{"name":"@e[type=area_effect_cloud,name=MajorPoint,r=7]","objective":"displaySecond"},"color":"white"}]}
scoreboard players tag @a[tag=GiveMessage] remove GiveMessage
# One second message
execute @s[tag=!Resetting,score_displaySecond_min=1,score_displaySecond=1] ~ ~ ~ execute @a[r=7] ~ ~ ~ detect ~ ~-2 ~ minecraft:bedrock 0 scoreboard players tag @s add GiveMessage
title @a[tag=GiveMessage] actionbar {"translate":"resourcePoint.statusMessage.progressSecond","color":"green","with":[{"score":{"name":"@e[type=area_effect_cloud,name=MajorPoint,r=7]","objective":"displaySecond"},"color":"white"}]}
scoreboard players tag @a[tag=GiveMessage] remove GiveMessage


# Resetting
# More than one second left
execute @s[tag=Resetting,score_displaySecond_min=2] ~ ~ ~ execute @a[r=7] ~ ~ ~ detect ~ ~-2 ~ minecraft:bedrock 0 scoreboard players tag @s add GiveMessage
title @a[tag=GiveMessage] actionbar {"translate":"resourcePoint.statusMessage.resettingSeconds","color":"green","with":[{"score":{"name":"@e[type=area_effect_cloud,name=MajorPoint,r=7]","objective":"displaySecond"},"color":"white"}]}
scoreboard players tag @a[tag=GiveMessage] remove GiveMessage
# One second message
execute @s[tag=Resetting,score_displaySecond_min=1,score_displaySecond=1] ~ ~ ~ execute @a[r=7] ~ ~ ~ detect ~ ~-2 ~ minecraft:bedrock 0 scoreboard players tag @s add GiveMessage
title @a[tag=GiveMessage] actionbar {"translate":"resourcePoint.statusMessage.resettingSecond","color":"green","with":[{"score":{"name":"@e[type=area_effect_cloud,name=MajorPoint,r=7]","objective":"displaySecond"},"color":"white"}]}
scoreboard players tag @a[tag=GiveMessage] remove GiveMessage