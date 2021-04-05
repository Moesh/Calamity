#writing player data to storage
data modify storage cushield:main temp set from entity @s {}
data modify storage cushield:main player.inv set from storage cushield:main temp.Inventory
data modify storage cushield:main player.hand set from storage cushield:main temp.SelectedItem
data remove storage cushield:main temp

#writing used shield to shield object
execute if data storage cushield:main player.inv[{Slot:-106b}].tag.shield run data modify storage cushield:main shield set from storage cushield:main player.inv[{Slot:-106b}]
execute unless data storage cushield:main player.inv[{Slot:-106b}].tag.shield run data modify storage cushield:main shield set from storage cushield:main player.hand
data modify storage cushield:main player set value {}
execute if data storage cushield:main shield.Slot run tag @s add cushield.offhand

#writing to scoreboard
execute store result score @s cush.bash run data get storage cushield:main shield.tag.shield.bash_effect
execute store result score @s cush.parry run data get storage cushield:main shield.tag.shield.parry_time
execute store result score can= cush.cy.dur run data get storage cushield:main shield.tag.shield.can_coyote
execute store result score @s cush.x_angle run data get storage cushield:main shield.tag.shield.x_angle 0.5
execute store result score @s cush.y_angle run data get storage cushield:main shield.tag.shield.y_angle 0.5
execute store result score @s cush.reflect run data get storage cushield:main shield.tag.shield.can_reflect_arrows
execute store result score @s cush.max_time run data get storage cushield:main shield.tag.shield.max_time
execute store result score @s cush.dis.dont run data get storage cushield:main shield.tag.shield.disable_resistant
execute store result score @s cush.dis.time run data get storage cushield:main shield.tag.shield.disable_time
execute store result score @s cush.cooldown run data get storage cushield:main shield.tag.shield.cooldown
execute store result score @s cush.block_val run data get storage cushield:main shield.tag.shield.block_value
execute store result score min= cush.main run data get storage cushield:main shield.tag.shield.minimum_block_value
execute store result score @s cush.py.eff.pl run data get storage cushield:main shield.tag.shield.player_parry_effect
execute store result score @s cush.py.eff.en run data get storage cushield:main shield.tag.shield.entity_parry_effect
execute store result score @s cush.bl.eff.pl run data get storage cushield:main shield.tag.shield.entity_block_effect
execute store result score @s cush.bl.eff.en run data get storage cushield:main shield.tag.shield.entity_block_effect
execute store result score @s cush.durability run data get storage cushield:main shield.tag.shield.current_durability

#default values
execute unless score @s cush.dis.time matches 1.. run scoreboard players set @s cush.dis.time 50

#calculating dynamic values
scoreboard players operation ticks= cush.main = @s cush.max_time
scoreboard players operation ticks= cush.main -= @s cush.parry
scoreboard players operation @s cush.decay = @s cush.block_val
scoreboard players operation @s cush.decay -= min= cush.main
scoreboard players operation @s cush.decay *= 100 num
scoreboard players operation @s cush.decay /= ticks= cush.main