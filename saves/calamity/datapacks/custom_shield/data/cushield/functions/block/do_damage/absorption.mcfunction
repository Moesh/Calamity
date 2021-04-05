#getting absorption amount
execute store result score absorption= cush.main run data get entity @s AbsorptionAmount

#saving absorption and clearing it
data modify storage cushield:main effect set from entity @s ActiveEffects[{Id:22b}]
effect clear @s minecraft:absorption

#total calculation
scoreboard players operation absorption= cush.main -= damage= cush.main

#damage conditions
execute if score absorption= cush.main matches ..0 run scoreboard players operation damage= cush.main += absorption= cush.main
execute if score absorption= cush.main matches 1.. run function cushield:block/do_damage/absorption/restore