#copying item
execute if entity @s[tag=cushield.offhand] run data modify storage cushield:main item set from entity @s Inventory[{Slot:-106b}]
execute unless entity @s[tag=cushield.offhand] run data modify storage cushield:main item set from entity @s SelectedItem

#modifying
execute if entity @s[tag=cushield.blocking] run data modify storage cushield:main item.tag.CustomModelData set from storage cushield:main item.tag.shield.blocking_model
execute if entity @s[tag=cushield.blocking] run data modify storage cushield:main item.tag.blocking set value 1b
execute unless entity @s[tag=cushield.blocking] run data modify storage cushield:main item.tag.CustomModelData set from storage cushield:main item.tag.shield.default_model
execute unless entity @s[tag=cushield.blocking] run data remove storage cushield:main item.tag.blocking

#durability handling
execute if data storage cushield:main item.tag.shield.durability run function cushield:block/do_durability

#placing in box
data modify storage cushield:main item.Slot set value 0b
data modify block 29999999 0 91665 Items set value []
data modify block 29999999 0 91665 Items append from storage cushield:main item
data modify storage cushield:main item set value {}

#replacing
execute if entity @s[tag=cushield.offhand,tag=!cushield.break] run loot replace entity @s weapon.offhand 1 mine 29999999 0 91665 minecraft:debug_stick
execute if entity @s[tag=!cushield.offhand,tag=!cushield.break] run loot replace entity @s weapon.mainhand 1 mine 29999999 0 91665 minecraft:debug_stick
execute if entity @s[tag=cushield.offhand,tag=cushield.break] run replaceitem entity @s weapon.offhand air
execute if entity @s[tag=!cushield.offhand,tag=cushield.break] run replaceitem entity @s weapon.mainhand air
execute if entity @s[tag=cushield.break] anchored eyes run particle item shield ^ ^ ^1 0.1 0.1 0.1 0.1 8
tag @s remove cushield.break
