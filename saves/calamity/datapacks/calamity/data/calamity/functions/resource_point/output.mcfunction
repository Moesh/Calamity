tag @s add Resetting
tag @s remove Running
scoreboard players operation @s PointTimer = PointResetTime gameRules

# Determine if nearby players are standing on bedrock (2 blocks down is y-3)
execute as @s[tag=!Effect,tag=TeamBlue] run tag @a[distance=..4,team=blue] add CheckIfStandingOnPoint
execute as @s[tag=!Effect,tag=TeamRed] run tag @a[distance=..4,team=red] add CheckIfStandingOnPoint

execute as @a[tag=CheckIfStandingOnPoint] if block ~ ~-3 ~ minecraft:bedrock run tag @s add GiveEffects
execute as @a[tag=CheckIfStandingOnPoint] if block ~ ~-2 ~ minecraft:bedrock run tag @s add GiveEffects
execute as @a[tag=CheckIfStandingOnPoint] if block ~ ~-3 ~ minecraft:bedrock run tag @s add GiveResources
execute as @a[tag=CheckIfStandingOnPoint] if block ~ ~-2 ~ minecraft:bedrock run tag @s add GiveResources

# Red team
execute at @s[tag=!Effect,tag=TeamRed] if entity @a[distance=..4,team=red] if block ~ ~-3 ~ minecraft:bedrock run tag @a[distance=..4,team=red] add GiveResources
execute at @s[tag=Effect,tag=TeamRed] if entity @a[distance=..4,team=red] if block ~ ~-3 ~ minecraft:bedrock run tag @a[team=red] add GiveEffects

execute as @s[tag=Log] run give @a[distance=..4,tag=GiveResources] minecraft:oak_log 16
execute as @s[tag=GoldIngot] run give @a[distance=..4,tag=GiveResources] minecraft:gold_ingot 24
execute as @s[tag=Cobblestone] run give @a[distance=..4,tag=GiveResources] minecraft:cobblestone 9
execute as @s[tag=Arrow] run give @a[distance=..4,tag=GiveResources] minecraft:arrow 32
execute as @s[tag=TNT] run give @a[distance=..4,tag=GiveResources] minecraft:tnt 8

execute as @s[tag=Regeneration] run effect give @a[tag=GiveEffects] minecraft:regeneration 45
execute as @s[tag=Resistance] run effect give @a[tag=GiveEffects] minecraft:resistance 45 1
execute as @s[tag=Strength] run effect give @a[tag=GiveEffects] minecraft:strength 45
execute as @s[tag=Speed] run effect give @a[tag=GiveEffects] minecraft:speed 45 1
execute as @s[tag=Haste] run effect give @a[tag=GiveEffects] minecraft:haste 45 1

# Play success sounds
execute as @a[tag=GiveEffects] run playsound minecraft:entity.generic.drink player @s
execute as @s[tag=GiveResources] run playsound minecraft:entity.player.levelup master @a ~ ~ ~ 0.5 0.5

# Give title message and reset
tag @a[tag=GiveResources] add GiveMessage
tag @a[tag=GiveEffects] add GiveMessage
tag @a[tag=GiveResources] remove GiveResources
tag @a[tag=GiveEffects] remove GiveEffects
# Resources
execute as @s[tag=Log] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.item","with":[{"translate":"block.minecraft.birch_log"},{"text":"16"}]}
execute as @s[tag=GoldIngot] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.item","with":[{"translate":"item.minecraft.gold_ingot"},{"text":"24"}]}
execute as @s[tag=Cobblestone] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.item","with":[{"translate":"block.minecraft.cobblestone"},{"text":"9"}]}
execute as @s[tag=Arrow] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.item","with":[{"translate":"item.minecraft.arrow"},{"text":"32"}]}
execute as @s[tag=TNT] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.item","with":[{"translate":"block.minecraft.tnt"},{"text":"8"}]}
# Effects
execute as @s[tag=Regeneration] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.effect","with":[{"translate":"effect.minecraft.regeneration"},{"text":"45"}]}
execute as @s[tag=Resistance] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.effect","with":[{"translate":"effect.minecraft.resistance"},{"text":"45"},{"translate":"resourcePoint.output.effect.level2"}]}
execute as @s[tag=Strength] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.effect","with":[{"translate":"effect.minecraft.strength"},{"text":"45"}]}
execute as @s[tag=Speed] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.effect","with":[{"translate":"effect.minecraft.speed"},{"text":"45"},{"translate":"resourcePoint.output.effect.level2"}]}
execute as @s[tag=Haste] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.effect","with":[{"translate":"effect.minecraft.haste"},{"text":"45"},{"translate":"resourcePoint.output.effect.level2"}]}
tag @a[tag=GiveMessage] remove GiveMessage


execute as @s[tag=FacingWest] run data merge block ~-3 ~ ~ {Text2:"{\"translate\":\"resourcePoint.sign.activated\"}"}
execute as @s[tag=FacingEast] run data merge block ~3 ~ ~ {Text2:"{\"translate\":\"resourcePoint.sign.activated\"}"} 
tag @s remove Output