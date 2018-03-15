scoreboard players tag @s add Resetting
scoreboard players operation @s counter = ResettingTime gameRules

execute @s[tag=!Effect] ~ ~ ~ execute @s[tag=TeamBlue] ~ ~ ~ execute @a[r=4,team=blue] ~ ~ ~ detect ~ ~-2 ~ minecraft:bedrock 0 scoreboard players tag @s add GiveResources
execute @s[tag=!Effect] ~ ~ ~ execute @s[tag=TeamBlue] ~ ~ ~ execute @a[r=4,team=blue] ~ ~ ~ detect ~ ~-3 ~ minecraft:bedrock 0 scoreboard players tag @s add GiveResources
execute @s[tag=Effect] ~ ~ ~ execute @s[tag=TeamBlue] ~ ~ ~ execute @a[r=4,team=blue] ~ ~ ~ detect ~ ~-2 ~ minecraft:bedrock 0 scoreboard players tag @a[team=blue] add GiveEffects
execute @s[tag=Effect] ~ ~ ~ execute @s[tag=TeamBlue] ~ ~ ~ execute @a[r=4,team=blue] ~ ~ ~ detect ~ ~-3 ~ minecraft:bedrock 0 scoreboard players tag @a[team=blue] add GiveEffects

execute @s[tag=!Effect] ~ ~ ~ execute @s[tag=TeamRed] ~ ~ ~ execute @a[r=4,team=red] ~ ~ ~ detect ~ ~-2 ~ minecraft:bedrock 0 scoreboard players tag @s add GiveResources
execute @s[tag=!Effect] ~ ~ ~ execute @s[tag=TeamRed] ~ ~ ~ execute @a[r=4,team=red] ~ ~ ~ detect ~ ~-3 ~ minecraft:bedrock 0 scoreboard players tag @s add GiveResources
execute @s[tag=Effect] ~ ~ ~ execute @s[tag=TeamRed] ~ ~ ~ execute @a[r=4,team=red] ~ ~ ~ detect ~ ~-2 ~ minecraft:bedrock 0 scoreboard players tag @a[team=red] add GiveEffects
execute @s[tag=Effect] ~ ~ ~ execute @s[tag=TeamRed] ~ ~ ~ execute @a[r=4,team=red] ~ ~ ~ detect ~ ~-3 ~ minecraft:bedrock 0 scoreboard players tag @a[team=red] add GiveEffects

execute @s[tag=Log] ~ ~ ~ give @a[r=4,tag=GiveResources] minecraft:log 16 2
execute @s[tag=GoldIngot] ~ ~ ~ give @a[r=4,tag=GiveResources] minecraft:gold_ingot 24
execute @s[tag=Cobblestone] ~ ~ ~ give @a[r=4,tag=GiveResources] minecraft:cobblestone 9
execute @s[tag=Arrow] ~ ~ ~ give @a[r=4,tag=GiveResources] minecraft:arrow 32
execute @s[tag=TNT] ~ ~ ~ give @a[r=4,tag=GiveResources] minecraft:tnt 8

execute @s[tag=Regeneration] ~ ~ ~ effect @a[tag=GiveEffects] minecraft:regeneration 45
execute @s[tag=Resistance] ~ ~ ~ effect @a[tag=GiveEffects] minecraft:resistance 45 1
execute @s[tag=Strength] ~ ~ ~ effect @a[tag=GiveEffects] minecraft:strength 45
execute @s[tag=Speed] ~ ~ ~ effect @a[tag=GiveEffects] minecraft:speed 45 1
execute @s[tag=Haste] ~ ~ ~ effect @a[tag=GiveEffects] minecraft:haste 45 1

# Play success sounds
execute @a[tag=GiveEffects] ~ ~ ~ playsound minecraft:entity.generic.drink player @s

execute @a[team=blue,tag=GiveResources] ~ ~ ~ scoreboard players tag @e[type=area_effect_cloud,name=ResourcePoint,r=4,c=1,tag=TeamBlue] add PlaySuccessSound
execute @a[team=red,tag=GiveResources] ~ ~ ~ scoreboard players tag @e[type=area_effect_cloud,name=ResourcePoint,r=4,c=1,tag=TeamRed] add PlaySuccessSound
execute @s[tag=PlaySuccessSound] ~ ~ ~ execute @s[tag=TeamBlue] ~ ~ ~ playsound minecraft:entity.player.levelup master @a[team=blue] ~ ~ ~ 0.5 0.5
execute @s[tag=PlaySuccessSound] ~ ~ ~ execute @s[tag=TeamRed] ~ ~ ~ playsound minecraft:entity.player.levelup master @a[team=red] ~ ~ ~ 0.5 0.5
scoreboard players tag @s[tag=PlaySuccessSound] remove PlaySuccessSound

# Give title message and reset
scoreboard players tag @a[tag=GiveResources] add GiveMessage
scoreboard players tag @a[tag=GiveEffects] add GiveMessage
scoreboard players tag @a[tag=GiveResources] remove GiveResources
scoreboard players tag @a[tag=GiveEffects] remove GiveEffects
execute @s[tag=Log] ~ ~ ~ title @a[r=4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.item","with":[{"translate":"tile.log.birch.name"},{"text":"16"}]}
execute @s[tag=GoldIngot] ~ ~ ~ title @a[r=4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.item","with":[{"translate":"item.ingotGold.name"},{"text":"24"}]}
execute @s[tag=Cobblestone] ~ ~ ~ title @a[r=4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.item","with":[{"translate":"tile.stonebrick.name"},{"text":"9"}]}
execute @s[tag=Arrow] ~ ~ ~ title @a[r=4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.item","with":[{"translate":"item.arrow.name"},{"text":"32"}]}
execute @s[tag=TNT] ~ ~ ~ title @a[r=4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.item","with":[{"translate":"tile.tnt.name"},{"text":"8"}]}
execute @s[tag=Regeneration] ~ ~ ~ title @a[r=4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.effect","with":[{"translate":"effect.regeneration"},{"text":"45"}]}
execute @s[tag=Resistance] ~ ~ ~ title @a[r=4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.effect","with":[{"translate":"effect.resistance"},{"text":"45"},{"translate":"resourcePoint.output.effect.level2"}]}
execute @s[tag=Strength] ~ ~ ~ title @a[r=4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.effect","with":[{"translate":"effect.damageBoost"},{"text":"45"}]}
execute @s[tag=Speed] ~ ~ ~ title @a[r=4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.effect","with":[{"translate":"effect.moveSpeed"},{"text":"45"},{"translate":"resourcePoint.output.effect.level2"}]}
execute @s[tag=Haste] ~ ~ ~ title @a[r=4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.effect","with":[{"translate":"effect.digSpeed"},{"text":"45"},{"translate":"resourcePoint.output.effect.level2"}]}
scoreboard players tag @a[tag=GiveMessage] remove GiveMessage
execute @s[tag=FacingWest] ~ ~ ~ blockdata ~-3 ~ ~ {Text2:"{\"translate\":\"resourcePoint.sign.activated\"}"}
execute @s[tag=FacingEast] ~ ~ ~ blockdata ~3 ~ ~ {Text2:"{\"translate\":\"resourcePoint.sign.activated\"}"}
scoreboard players tag @s remove Output