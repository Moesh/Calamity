#summoning arrow
execute if entity @s[tag=cushield.reflect.arrow] anchored eyes run summon minecraft:arrow ^ ^ ^0.5 {Tags:[cushield.new_arrow]}
execute if entity @s[tag=cushield.reflect.spectral] anchored eyes run summon minecraft:spectral_arrow ^ ^ ^0.5 {Tags:[cushield.new_arrow]}

#data init
data modify storage cushield:main arrow set value {Tags:[],Motion:[0d,0d,0d],Owner:[I;0,0,0,0]}

#creating data
execute positioned 0.0 0.0 0.0 run tp 63757368-0-0-0-1 ^ ^ ^1
data modify storage cushield:main arrow.Motion set from entity 63757368-0-0-0-1 Pos
execute in minecraft:overworld run tp 63757368-0-0-0-1 0 0 0
data modify storage cushield:main arrow.Owner set from entity @s UUID

#scaling speed based on block time
scoreboard players operation time= cush.main = @s cush.block_total
execute unless score @s cush.parry matches 1.. run scoreboard players operation time= cush.main *= 2 num
##x
execute store result score red= cush.main run data get storage cushield:main arrow.Motion[0] 100
scoreboard players operation red= cush.main *= time= cush.main
scoreboard players operation red= cush.main /= 100 num
execute store result score motion= cush.main run data get storage cushield:main arrow.Motion[0] 100
execute store result storage cushield:main arrow.Motion[0] double 0.01 run scoreboard players operation motion= cush.main -= red= cush.main
##y
execute store result score red= cush.main run data get storage cushield:main arrow.Motion[1] 100
scoreboard players operation red= cush.main *= time= cush.main
scoreboard players operation red= cush.main /= 100 num
execute store result score motion= cush.main run data get storage cushield:main arrow.Motion[1] 100
execute store result storage cushield:main arrow.Motion[1] double 0.01 run scoreboard players operation motion= cush.main -= red= cush.main
##z
execute store result score red= cush.main run data get storage cushield:main arrow.Motion[2] 100
scoreboard players operation red= cush.main *= time= cush.main
scoreboard players operation red= cush.main /= 100 num
execute store result score motion= cush.main run data get storage cushield:main arrow.Motion[2] 100
execute store result storage cushield:main arrow.Motion[2] double 0.01 run scoreboard players operation motion= cush.main -= red= cush.main

#writing data
data modify entity @e[type=#entityid:projectile,tag=cushield.new_arrow,limit=1,distance=..3] {} merge from storage cushield:main arrow

#removing tags
tag @s remove cushield.reflect
tag @s remove cushield.reflect.arrow
tag @s remove cushield.reflect.spectral