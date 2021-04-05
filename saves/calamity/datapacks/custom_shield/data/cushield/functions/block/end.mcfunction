#ending listen
scoreboard players remove @s ehp_listen 1
tag @s remove cushield.blocking

#sounds
execute unless entity @s[tag=cushield.blocked] run function cushield:block/drop_sound

#ending block and starting cooldown
execute unless entity @s[tag=cushield.end_from_hand] run function cushield:hand_check
scoreboard players operation @s cush.wait = @s cush.cooldown
scoreboard players operation @s[tag=cushield.disable] cush.wait = @s cush.dis.time
scoreboard players operation @s cush.wait.max = @s cush.wait
tag @s remove cushield.can_block
tag @s remove cushield.blocked
tag @s remove cushield.end

#clearing resistance and re-applying if applicable 
effect clear @s minecraft:resistance
execute if score @s cush.res.dur matches 1.. run function cushield:block/load_resistance

#reflecting if marked to do so
execute if entity @s[tag=cushield.reflect] run function cushield:blocked/reflect/do

#resetting total
scoreboard players set @s cush.block_total 0
scoreboard players set @s cush.spam 0

#modifying item
##create item modifier to do this in 1.17
function cushield:block/modify_item
tag @s remove cushield.offhand
tag @s remove cushield.disable
tag @s remove cushield.end_from_hand