execute as @e[type=#entityid:projectile,tag=entityid.attacker.projectile,limit=1,sort=nearest] run function cushield:blocked/reflect/get_type
execute unless score type= cush.main matches 0 run tag @s add cushield.reflect
execute if score type= cush.main matches 1 run tag @s add cushield.reflect.arrow
execute if score type= cush.main matches 2 run tag @s add cushield.reflect.spectral