scoreboard players operation @s progressLights = @s PointCounter
#scoreboard players operation @s progressLights /= HUNDRED CONST

execute as @s[tag=FacingWest,scores={progressLights=399..400}] run setblock ~-3 ~-1 ~2 minecraft:sea_lantern
execute as @s[tag=FacingWest,scores={progressLights=300}] run setblock ~-3 ~-1 ~1 minecraft:sea_lantern
execute as @s[tag=FacingWest,scores={progressLights=200}] run setblock ~-3 ~-1 ~0 minecraft:sea_lantern
execute as @s[tag=FacingWest,scores={progressLights=100}] run setblock ~-3 ~-1 ~-1 minecraft:sea_lantern
execute as @s[tag=FacingWest,scores={progressLights=0}] run setblock ~-3 ~-1 ~-2 minecraft:sea_lantern

execute as @s[tag=FacingEast,scores={progressLights=399..400}] run setblock ~3 ~-1 ~-2 minecraft:sea_lantern
execute as @s[tag=FacingEast,scores={progressLights=300}] run setblock ~3 ~-1 ~-1 minecraft:sea_lantern
execute as @s[tag=FacingEast,scores={progressLights=200}] run setblock ~3 ~-1 ~0 minecraft:sea_lantern
execute as @s[tag=FacingEast,scores={progressLights=100}] run setblock ~3 ~-1 ~1 minecraft:sea_lantern
execute as @s[tag=FacingEast,scores={progressLights=0}] run setblock ~3 ~-1 ~2 minecraft:sea_lantern