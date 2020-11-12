# Progressing


# More than one second left
execute at @s[tag=Running,scores={displaySecond=2..}] if entity @a[distance=..4] if block ~ ~-2 ~ minecraft:bedrock run tag @s add GiveMessage
title @a[tag=GiveMessage] actionbar {"translate":"resourcePoint.statusMessage.progressSeconds","color":"green","with":[{"score":{"name":"@e[type=area_effect_cloud,name=ResourcePoint,distance=..4]","objective":"displaySecond"},"color":"white"}]}
tag @a[tag=GiveMessage] remove GiveMessage

# One second message
execute at @s[tag=Running,scores={displaySecond=1}] if entity @a[distance=..4] if block ~ ~-2 ~ minecraft:bedrock run tag @s add GiveMessage
title @a[tag=GiveMessage] actionbar {"translate":"resourcePoint.statusMessage.progressSecond","color":"green","with":[{"score":{"name":"@e[type=area_effect_cloud,name=ResourcePoint,distance=..4]","objective":"displaySecond"},"color":"white"}]}
tag @a[tag=GiveMessage] remove GiveMessage


# Resetting
# More than one second left
execute at @s[tag=Resetting,scores={displaySecond=2..}] if entity @a[distance=..4] if block ~ ~-2 ~ minecraft:bedrock run tag @s add GiveMessage
title @a[tag=GiveMessage] actionbar {"translate":"resourcePoint.statusMessage.resettingSeconds","color":"green","with":[{"score":{"name":"@e[type=area_effect_cloud,name=ResourcePoint,distance=..4]","objective":"displaySecond"},"color":"white"}]}
tag @a[tag=GiveMessage] remove GiveMessage
# One second message
execute at @s[tag=Resetting,scores={displaySecond=1}] if entity @a[distance=..4] if block ~ ~-2 ~ minecraft:bedrock run tag @s add GiveMessage
title @a[tag=GiveMessage] actionbar {"translate":"resourcePoint.statusMessage.resettingSecond","color":"green","with":[{"score":{"name":"@e[type=area_effect_cloud,name=ResourcePoint,distance=..4]","objective":"displaySecond"},"color":"white"}]}
tag @a[tag=GiveMessage] remove GiveMessage