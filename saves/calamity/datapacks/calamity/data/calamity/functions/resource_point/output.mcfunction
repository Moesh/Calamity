# Called from: calamity:resource_point/handler

#---------------------------------------------------------------------------------------------------
# Purpose: Resource point has finished charging, check for nearby players and give resources or
#   apply team effects. Update players and state.
#---------------------------------------------------------------------------------------------------

# Update resource point state
tag @s add Resetting
tag @s remove Charging
scoreboard players operation @s PointTimer = PointResetTime mapRules

# Determine if nearby players are standing on bedrock (2 blocks down is y-3)
execute as @s[tag=TeamBlue] run tag @a[distance=..4,team=blue] add CheckIfStandingOnPoint
execute as @s[tag=TeamRed] run tag @a[distance=..4,team=red] add CheckIfStandingOnPoint

execute if entity @s[tag=Effect] as @a[tag=CheckIfStandingOnPoint,distance=..4] if block ~ ~-3 ~ minecraft:bedrock run tag @s add GiveEffects
execute if entity @s[tag=Effect] as @a[tag=CheckIfStandingOnPoint,distance=..4] if block ~ ~-2 ~ minecraft:bedrock run tag @s add GiveEffects
execute if entity @s[tag=Resource] as @a[tag=CheckIfStandingOnPoint,distance=..4] if block ~ ~-3 ~ minecraft:bedrock run tag @s add GiveResources
execute if entity @s[tag=Resource] as @a[tag=CheckIfStandingOnPoint,distance=..4] if block ~ ~-2 ~ minecraft:bedrock run tag @s add GiveResources
execute if entity @s[tag=Enchant] as @a[tag=CheckIfStandingOnPoint,distance=..4] if block ~ ~-3 ~ minecraft:bedrock run tag @s add Enchant
execute if entity @s[tag=Enchant] as @a[tag=CheckIfStandingOnPoint,distance=..4] if block ~ ~-2 ~ minecraft:bedrock run tag @s add Enchant
tag @a remove CheckIfStandingOnPoint

# A player successfully captured an important resource point, let's reward them for it!
scoreboard players set @a[tag=GiveEffects] captureScore 1
scoreboard players set @a[tag=GiveResources] captureScore 1

execute as @a[team=blue,tag=GiveEffects,limit=1] run tag @a[team=blue] add GiveEffects
execute as @a[team=red,tag=GiveEffects,limit=1] run tag @a[team=red] add GiveEffects

# Check for resource point type and give resources/effects
execute as @s[tag=Log] run give @a[distance=..4,tag=GiveResources] minecraft:oak_log 16
execute as @s[tag=Scaffolding] run give @a[distance=..4,tag=GiveResources] minecraft:scaffolding 16
execute as @s[tag=GoldIngot] run give @a[distance=..4,tag=GiveResources] minecraft:gold_ingot 24
execute as @s[tag=Chain] run give @a[distance=..4,tag=GiveResources] minecraft:chain 24
execute as @s[tag=Cobblestone] run give @a[distance=..4,tag=GiveResources] minecraft:cobblestone 9
execute as @s[tag=Arrow] run give @a[distance=..4,tag=GiveResources] minecraft:arrow 16
execute as @s[tag=TNT] run give @a[distance=..4,tag=GiveResources] minecraft:tnt 8
execute as @s[tag=Regeneration] run effect give @a[tag=GiveEffects] minecraft:regeneration 45
execute as @s[tag=Resistance] run effect give @a[tag=GiveEffects] minecraft:resistance 45 1
execute as @s[tag=Strength] run effect give @a[tag=GiveEffects] minecraft:strength 45
execute as @s[tag=Speed] run effect give @a[tag=GiveEffects] minecraft:speed 45 1
execute as @s[tag=Haste] run effect give @a[tag=GiveEffects] minecraft:haste 45 1
execute as @a[tag=Enchant,limit=1] run function calamity:resource_point/enchant

# Play success sounds
execute as @a[tag=GiveEffects] run playsound minecraft:entity.generic.drink player @s
execute as @s[tag=GiveResources] run playsound minecraft:entity.player.levelup master @a ~ ~ ~ 0.5 0.5

# Give title message and resource/effect
tag @a[tag=GiveResources] add GiveMessage
tag @a[tag=GiveResources] remove GiveResources
tag @a[tag=GiveEffects] add GiveMessage
tag @a[tag=GiveEffects] remove GiveEffects
tag @a[tag=Enchant] remove Enchant

# Resources
execute as @s[tag=Log] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.item","with":[{"translate":"block.minecraft.birch_log"},{"text":"16"}]}
execute as @s[tag=GoldIngot] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.item","with":[{"translate":"item.minecraft.gold_ingot"},{"text":"24"}]}
execute as @s[tag=Cobblestone] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.item","with":[{"translate":"block.minecraft.cobblestone"},{"text":"9"}]}
execute as @s[tag=Arrow] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.item","with":[{"translate":"item.minecraft.arrow"},{"text":"32"}]}
execute as @s[tag=TNT] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.item","with":[{"translate":"block.minecraft.tnt"},{"text":"8"}]}
execute as @s[tag=Points] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.item","with":[{"translate":"block.minecraft.tnt"},{"text":"8"}]}
# Effects
execute as @s[tag=Regeneration] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.effect","with":[{"translate":"effect.minecraft.regeneration"},{"text":"45"}]}
execute as @s[tag=Resistance] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.effect","with":[{"translate":"effect.minecraft.resistance"},{"text":"45"},{"translate":"resourcePoint.output.effect.level2"}]}
execute as @s[tag=Strength] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.effect","with":[{"translate":"effect.minecraft.strength"},{"text":"45"}]}
execute as @s[tag=Speed] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.effect","with":[{"translate":"effect.minecraft.speed"},{"text":"45"},{"translate":"resourcePoint.output.effect.level2"}]}
execute as @s[tag=Haste] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.effect","with":[{"translate":"effect.minecraft.haste"},{"text":"45"},{"translate":"resourcePoint.output.effect.level2"}]}
tag @a[tag=GiveMessage] remove GiveMessage

# Update signs
execute as @s[tag=FacingWest] run data merge block ~-3 ~ ~ {Text2:"{\"translate\":\"resourcePoint.sign.activated\"}"}
execute as @s[tag=FacingEast] run data merge block ~3 ~ ~ {Text2:"{\"translate\":\"resourcePoint.sign.activated\"}"} 

# Tag which caused the handler to call this function
tag @s remove Output