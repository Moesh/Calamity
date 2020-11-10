tag @s remove Resetting
tag @s remove Running

execute as @a[distance=..4] if block ~ ~-2 ~ minecraft:bedrock run tag @s add GiveMessage
execute as @a[distance=..4] if block ~ ~-3 ~ minecraft:bedrock run tag @s add GiveMessage
title @a[tag=GiveMessage] actionbar {"translate":"Ready","color":"green"}
tag @a[tag=GiveMessage] remove GiveMessage

execute as @s[tag=FacingWest] run data merge block ~-3 ~ ~ {Text2:"{\"translate\":\"resourcePoint.sign.ready\"}"}
execute as @s[tag=FacingEast] run data merge block ~3 ~ ~ {Text2:"{\"translate\":\"resourcePoint.sign.ready\"}"}
tag @s remove ReadyToStart