scoreboard players tag @s remove Resetting
scoreboard players tag @s remove Running
execute @a[r=4] ~ ~ ~ detect ~ ~-2 ~ minecraft:bedrock 0 title @s actionbar {"translate":"Ready","color":"green"}
execute @s[tag=FacingWest] ~ ~ ~ blockdata ~-3 ~ ~ {Text2:"{\"translate\":\"Ready\"}"}
execute @s[tag=FacingEast] ~ ~ ~ blockdata ~3 ~ ~ {Text2:"{\"translate\":\"Ready\"}"}
scoreboard players tag @s remove ReadyToStart