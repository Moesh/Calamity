#calculating display durabiltiy
execute store result score max= cush.durability run data get storage cushield:main item.tag.shield.durability
scoreboard players operation display= cush.durability = @s cush.durability
scoreboard players operation display= cush.durability *= 100 num
scoreboard players operation display= cush.durability /= max= cush.durability
execute if score @s cush.durability matches 1.. if score display= cush.durability matches 0 run scoreboard players set display= cush.durability 1
execute if score @s cush.durability > max= cush.durability run tag @s add cushield.break

#storing durabilty values
execute unless data storage cushield:main item.tag.shield.current_durability run data modify storage cushield:main item.tag.shield.current_durability set value 0
execute store result storage cushield:main item.tag.shield.current_durability int 1 run scoreboard players get @s cush.durability
execute store result storage cushield:main item.tag.Damage int 1 run scoreboard players get display= cush.durability