scoreboard players tag @s add Resetting
scoreboard players operation @s counter = ResettingTime gameRules

execute @a[r=4] ~ ~ ~ detect ~ ~-2 ~ minecraft:bedrock 0 scoreboard players tag @s add GiveMessage
execute @a[r=4] ~ ~ ~ detect ~ ~-3 ~ minecraft:bedrock 0 scoreboard players tag @s add GiveMessage
title @a[tag=GiveMessage] actionbar {"translate":"Resources given!"}
scoreboard players tag @a[tag=GiveMessage] remove GiveMessage

execute @s[tag=FacingWest] ~ ~ ~ blockdata ~-3 ~ ~ {Text2:"{\"translate\":\"Activated!\"}"}
execute @s[tag=FacingEast] ~ ~ ~ blockdata ~3 ~ ~ {Text2:"{\"translate\":\"Activated!\"}"}
scoreboard players tag @s remove Output