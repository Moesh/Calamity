scoreboard players tag @s add Resetting
scoreboard players operation @s counter = ResettingTime gameRules

execute @a[r=4] ~ ~ ~ detect ~ ~-2 ~ minecraft:bedrock 0 scoreboard players tag @s add GiveResources
execute @a[r=4] ~ ~ ~ detect ~ ~-3 ~ minecraft:bedrock 0 scoreboard players tag @s add GiveResources

execute @s[tag=Log] ~ ~ ~ execute @s[tag=TeamBlue] ~ ~ ~ give @a[r=4,team=blue,tag=GiveResources] minecraft:log 16 2
execute @s[tag=GoldIngot] ~ ~ ~ execute @s[tag=TeamBlue] ~ ~ ~ give @a[r=4,team=blue,tag=GiveResources] minecraft:gold_ingot 24
execute @s[tag=Cobblestone] ~ ~ ~ execute @s[tag=TeamBlue] ~ ~ ~ give @a[r=4,team=blue,tag=GiveResources] minecraft:cobblestone 9
execute @s[tag=Arrow] ~ ~ ~ execute @s[tag=TeamBlue] ~ ~ ~ give @a[r=4,team=blue,tag=GiveResources] minecraft:arrow 32
execute @s[tag=TNT] ~ ~ ~ execute @s[tag=TeamBlue] ~ ~ ~ give @a[r=4,team=blue,tag=GiveResources] minecraft:tnt 8
execute @s[tag=Regeneration] ~ ~ ~ execute @s[tag=TeamBlue] ~ ~ ~ effect @a[r=4,team=blue,tag=GiveResources] minecraft:regeneration 45
execute @s[tag=Resistance] ~ ~ ~ execute @s[tag=TeamBlue] ~ ~ ~ effect @a[r=4,team=blue,tag=GiveResources] minecraft:resistence 45 1
execute @s[tag=Strength] ~ ~ ~ execute @s[tag=TeamBlue] ~ ~ ~ effect @a[r=4,team=blue,tag=GiveResources] minecraft:strength 45
execute @s[tag=Strength] ~ ~ ~ execute @s[tag=TeamBlue] ~ ~ ~ effect @a[r=4,team=blue,tag=GiveResources] minecraft:weakness 45 4
execute @s[tag=Speed] ~ ~ ~ execute @s[tag=TeamBlue] ~ ~ ~ effect @a[r=4,team=blue,tag=GiveResources] minecraft:speed 45
execute @s[tag=Haste] ~ ~ ~ execute @s[tag=TeamBlue] ~ ~ ~ effect @a[r=4,team=blue,tag=GiveResources] minecraft:haste 45 1

execute @s[tag=Log] ~ ~ ~ execute @s[tag=TeamRed] ~ ~ ~ give @a[r=4,team=red,tag=GiveResources] minecraft:log 16 2
execute @s[tag=GoldIngot] ~ ~ ~ execute @s[tag=TeamRed] ~ ~ ~ give @a[r=4,team=red,tag=GiveResources] minecraft:gold_ingot 24
execute @s[tag=Cobblestone] ~ ~ ~ execute @s[tag=TeamRed] ~ ~ ~ give @a[r=4,team=red,tag=GiveResources] minecraft:cobblestone 9
execute @s[tag=Arrow] ~ ~ ~ execute @s[tag=TeamRed] ~ ~ ~ give @a[r=4,team=red,tag=GiveResources] minecraft:arrow 32
execute @s[tag=TNT] ~ ~ ~ execute @s[tag=TeamRed] ~ ~ ~ give @a[r=4,team=red,tag=GiveResources] minecraft:tnt 8
execute @s[tag=Regeneration] ~ ~ ~ execute @s[tag=TeamRed] ~ ~ ~ effect @a[r=4,team=red,tag=GiveResources] minecraft:regeneration 45
execute @s[tag=Resistance] ~ ~ ~ execute @s[tag=TeamRed] ~ ~ ~ effect @a[r=4,team=red,tag=GiveResources] minecraft:resistance 45 1
execute @s[tag=Strength] ~ ~ ~ execute @s[tag=TeamRed] ~ ~ ~ effect @a[r=4,team=red,tag=GiveResources] minecraft:strength 45
execute @s[tag=Weakness] ~ ~ ~ execute @s[tag=TeamRed] ~ ~ ~ effect @a[r=4,team=red,tag=GiveResources] minecraft:weakness 45 4
execute @s[tag=Speed] ~ ~ ~ execute @s[tag=TeamRed] ~ ~ ~ effect @a[r=4,team=red,tag=GiveResources] minecraft:speed 45
execute @s[tag=Haste] ~ ~ ~ execute @s[tag=TeamRed] ~ ~ ~ effect @a[r=4,team=red,tag=GiveResources] minecraft:haste 45 1

execute 

scoreboard players tag @a[tag=GiveResources] add GiveMessage
scoreboard players tag @a[tag=GiveResources] remove GiveResources

title @a[tag=GiveMessage] actionbar {"translate":"Resources given!"}
scoreboard players tag @a[tag=GiveMessage] remove GiveMessage


execute @s[tag=FacingWest] ~ ~ ~ blockdata ~-3 ~ ~ {Text2:"{\"translate\":\"Activated!\"}"}
execute @s[tag=FacingEast] ~ ~ ~ blockdata ~3 ~ ~ {Text2:"{\"translate\":\"Activated!\"}"}
scoreboard players tag @s remove Output