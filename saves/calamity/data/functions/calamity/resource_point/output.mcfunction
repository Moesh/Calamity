scoreboard players tag @s add Resetting
scoreboard players operation @s counter = ResettingTime gameRules

execute @s[tag=TeamBlue] ~ ~ ~ execute @a[r=4,team=blue] ~ ~ ~ detect ~ ~-2 ~ minecraft:bedrock 0 scoreboard players tag @s add GiveResources
execute @s[tag=TeamBlue] ~ ~ ~ execute @a[r=4,team=blue] ~ ~ ~ detect ~ ~-3 ~ minecraft:bedrock 0 scoreboard players tag @s add GiveResources
execute @s[tag=TeamRed] ~ ~ ~ execute @a[r=4,team=red] ~ ~ ~ detect ~ ~-2 ~ minecraft:bedrock 0 scoreboard players tag @s add GiveResources
execute @s[tag=TeamRed] ~ ~ ~ execute @a[r=4,team=red] ~ ~ ~ detect ~ ~-3 ~ minecraft:bedrock 0 scoreboard players tag @s add GiveResources

execute @s[tag=Log] ~ ~ ~ give @a[r=4,tag=GiveResources] minecraft:log 16 2
execute @s[tag=GoldIngot] ~ ~ ~ give @a[r=4,tag=GiveResources] minecraft:gold_ingot 24
execute @s[tag=Cobblestone] ~ ~ ~ give @a[r=4,tag=GiveResources] minecraft:cobblestone 9
execute @s[tag=Arrow] ~ ~ ~ give @a[r=4,tag=GiveResources] minecraft:arrow 32
execute @s[tag=TNT] ~ ~ ~ give @a[r=4,tag=GiveResources] minecraft:tnt 8
execute @s[tag=Regeneration] ~ ~ ~ effect @a[r=4,tag=GiveResources] minecraft:regeneration 45
execute @s[tag=Resistance] ~ ~ ~ effect @a[r=4,tag=GiveResources] minecraft:resistence 45 1
execute @s[tag=Strength] ~ ~ ~ effect @a[r=4,tag=GiveResources] minecraft:strength 45
execute @s[tag=Speed] ~ ~ ~ effect @a[r=4,tag=GiveResources] minecraft:speed 45
execute @s[tag=Haste] ~ ~ ~ effect @a[r=4,tag=GiveResources] minecraft:haste 45 1

scoreboard players tag @a[tag=GiveResources] add GiveMessage
scoreboard players tag @a[tag=GiveResources] remove GiveResources

title @a[tag=GiveMessage] actionbar {"translate":"Resources given!"}
scoreboard players tag @a[tag=GiveMessage] remove GiveMessage


execute @s[tag=FacingWest] ~ ~ ~ blockdata ~-3 ~ ~ {Text2:"{\"translate\":\"Activated!\"}"}
execute @s[tag=FacingEast] ~ ~ ~ blockdata ~3 ~ ~ {Text2:"{\"translate\":\"Activated!\"}"}
scoreboard players tag @s remove Output