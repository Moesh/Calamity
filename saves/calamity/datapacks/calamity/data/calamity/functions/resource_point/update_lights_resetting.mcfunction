scoreboard players operation @s progressLights = @s PointTimer
#scoreboard players operation @s progressLights /= HUNDRED CONST

execute if entity @s[tag=FacingWest,scores={progressLights=380}] run setblock ~-3 ~-1 ~-2 minecraft:redstone_lamp
execute if entity @s[tag=FacingWest,scores={progressLights=300}] run setblock ~-3 ~-1 ~-1 minecraft:redstone_lamp
execute if entity @s[tag=FacingWest,scores={progressLights=200}] run setblock ~-3 ~-1 ~0 minecraft:redstone_lamp
execute if entity @s[tag=FacingWest,scores={progressLights=100}] run setblock ~-3 ~-1 ~1 minecraft:redstone_lamp
execute if entity @s[tag=FacingWest,scores={progressLights=0}] run setblock ~-3 ~-1 ~2 minecraft:redstone_lamp

execute if entity @s[tag=FacingEast,scores={progressLights=380}] run setblock ~3 ~-1 ~2 minecraft:redstone_lamp
execute if entity @s[tag=FacingEast,scores={progressLights=300}] run setblock ~3 ~-1 ~1 minecraft:redstone_lamp
execute if entity @s[tag=FacingEast,scores={progressLights=200}] run setblock ~3 ~-1 ~0 minecraft:redstone_lamp
execute if entity @s[tag=FacingEast,scores={progressLights=100}] run setblock ~3 ~-1 ~-1 minecraft:redstone_lamp
execute if entity @s[tag=FacingEast,scores={progressLights=0}] run setblock ~3 ~-1 ~-2 minecraft:redstone_lamp
