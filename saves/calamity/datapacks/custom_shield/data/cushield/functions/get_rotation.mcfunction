#getting angles
execute anchored eyes positioned ^ ^ ^ run tp 63757368-0-0-0-1 ~ ~ ~ ~ ~
data modify storage cushield:main player_rotation set from entity 63757368-0-0-0-1 Rotation
execute as 63757368-0-0-0-1 at @s facing entity @e[type=!#entityid:id_skip,tag=entityid.attacker,limit=1] eyes run tp @s ~ ~ ~ ~ ~
data modify storage cushield:main entity_rotation.eyes set from entity 63757368-0-0-0-1 Rotation
execute as 63757368-0-0-0-1 at @s facing entity @e[type=!#entityid:id_skip,tag=entityid.attacker,limit=1] feet run tp @s ~ ~ ~ ~ ~
data modify storage cushield:main entity_rotation.feet set from entity 63757368-0-0-0-1 Rotation
execute in minecraft:overworld run tp 63757368-0-0-0-1 0 0 0

#x rotation deviation - angle based on center point between eyes and feet
execute store result score x_rotation= cush.main run data get storage cushield:main entity_rotation.feet[1]
execute store result score temp= cush.main run data get storage cushield:main entity_rotation.eyes[1]
scoreboard players operation x_rotation= cush.main += temp= cush.main
scoreboard players operation x_rotation= cush.main /= 2 num
execute store result score temp= cush.main run data get storage cushield:main player_rotation[1]
scoreboard players operation x_rotation= cush.main -= temp= cush.main
execute if score x_rotation= cush.main matches ..-1 run scoreboard players operation x_rotation= cush.main *= -1 num

#y rotation deviation
execute store result score y_rotation= cush.main run data get storage cushield:main entity_rotation.eyes[0]
execute store result score temp= cush.main run data get storage cushield:main player_rotation[0]
scoreboard players operation y_rotation= cush.main -= temp= cush.main
execute if score y_rotation= cush.main matches ..-1 run scoreboard players add y_rotation= cush.main 360
execute if score y_rotation= cush.main matches 181.. run scoreboard players remove y_rotation= cush.main 360
execute if score y_rotation= cush.main matches ..-1 run scoreboard players operation y_rotation= cush.main *= -1 num

#writing what effect to clear if applicable
execute as @e[type=!#entityid:id_skip,tag=entityid.attacker,limit=1] run function cushield:get_rotation/type

#debug text
#title @s actionbar ["[ ",{"score":{"name":"y_rotation=","objective":"cush.main"}},", ",{"score":{"name":"x_rotation=","objective":"cush.main"}}," ]"]