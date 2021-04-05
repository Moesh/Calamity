#setting health offset
execute store result score health= cush.main run attribute @s minecraft:generic.max_health get
scoreboard players operation max_health= cush.main = health= cush.main
scoreboard players operation health= cush.main -= @s cush.health
scoreboard players operation damage= cush.main += health= cush.main

#setting up to initialize health
effect give @s minecraft:health_boost 1 3 true

#setting health
execute if score damage= cush.main matches 1..15 run function cushield:block/do_damage/1-15
execute if score damage= cush.main matches 16..30 run function cushield:block/do_damage/16-30
execute if score damage= cush.main matches 31.. run function cushield:block/do_damage/31-40

#finalization
effect clear @s minecraft:health_boost
attribute @s minecraft:generic.max_health modifier remove 63757368-0-0-0-6870

#kill if damage > max_health
execute if score damage= cush.main >= max_health= cush.main run function cushield:block/death