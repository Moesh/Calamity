#starting listen
scoreboard players add @s ehp_listen 1
execute if score @s[tag=!ehp_listen] ehp_listen matches 1.. run function entityid:listen/ehp_enable
tag @s add cushield.blocking

#sounds
playsound shield:large_shield.up.bump player @s
playsound shield:large_shield.up.ruffle player @s ~ ~ ~ 1 2 0
playsound shield:large_shield.up.shift player @s

#saving resistance to scoreboard
scoreboard players set @s cush.res.dur 0
scoreboard players set @s cush.res.icn 0
execute if predicate cushield:has_resistance run function cushield:block/save_resistance

#setting up damage check
effect clear @s minecraft:resistance
scoreboard players reset @s cush.dmg
scoreboard players reset @s cush.atk
scoreboard players reset @s cush.fall
scoreboard players reset @s cush.drop
scoreboard players reset @s cush.sprint

#getting stats
function cushield:get_shield_stats

#modifying item
##create item modifier to do this in 1.17
function cushield:block/modify_item