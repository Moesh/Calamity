scoreboard players tag @s remove Resetting
scoreboard players tag @s remove Running

execute @a[r=4] ~ ~ ~ detect ~ ~-2 ~ minecraft:bedrock 0 scoreboard players tag @s add GiveMessage
execute @a[r=4] ~ ~ ~ detect ~ ~-3 ~ minecraft:bedrock 0 scoreboard players tag @s add GiveMessage
title @a[tag=GiveMessage] actionbar {"translate":"Ready","color":"green"}
scoreboard players tag @a[tag=GiveMessage] remove GiveMessage

execute @s[tag=FacingWest] ~ ~ ~ blockdata ~-3 ~ ~ {Text2:"{\"translate\":\"Ready\"}"}
execute @s[tag=FacingEast] ~ ~ ~ blockdata ~3 ~ ~ {Text2:"{\"translate\":\"Ready\"}"}
scoreboard players tag @s remove ReadyToStart