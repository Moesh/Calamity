#writing damage to main scoreboard
scoreboard players operation damage= cush.main = @s cush.dmg
scoreboard players reset @s cush.dmg

#saving health boost effect (might remove)
execute if predicate cushield:has_health_boost at @s run function cushield:block/save_health_boost

#applying resistance
execute if score damage= cush.main matches 1.. if score @s cush.res.dur matches 1.. run function cushield:block/do_damage/resistance
scoreboard players operation damage= cush.main /= 10 num

#doing absorption damage
execute if score damage= cush.main matches 1.. if predicate cushield:has_absorption run function cushield:block/do_damage/absorption

#doing health damage
execute if score damage= cush.main matches 1.. run function cushield:block/do_damage/health