#spam detection
scoreboard players add @s[scores={cush.use=1..}] cush.spam 1
scoreboard players remove @s[scores={cush.block_time=3}] cush.spam 1
scoreboard players remove @s[scores={cush.res.dur=1..}] cush.res.dur 1

#adding to total block time
scoreboard players add @s cush.block_total 1

#coyote time
execute if score @s[tag=cushield.coyote] cush.cy.dur matches 1.. run function cushield:block/coyote

#starting block if it just started
execute if score @s cush.block_total matches 1 run function cushield:block/start

#bashing if applicable
execute if score @s cush.sprint matches 1.. if score @s cush.bash matches 1.. run function cushield:block/bash

#giving resistance
execute if score @s[tag=cushield.blocking] cush.res.icn matches 1 run effect give @s minecraft:resistance 2 4 false
execute if score @s[tag=cushield.blocking] cush.res.icn matches 0 run effect give @s minecraft:resistance 2 4 true

#doing damage if any
execute if score @s cush.dmg matches 1.. run function cushield:block/do_damage
scoreboard players reset @s[scores={cush.fall=1..}] cush.fall

#end conditions
execute if score @s cush.atk matches 1.. run tag @s add cushield.end
execute if score @s cush.drop matches 1.. run function cushield:block/drop
execute if score @s cush.spam matches 2.. run tag @s add cushield.end
execute if score @s cush.sprint matches 1.. run tag @s add cushield.end
execute if score @s cush.block_time matches 0 run tag @s add cushield.end
execute if score @s cush.block_total > @s cush.max_time run tag @s add cushield.end

#ending if tagged to do so
execute if entity @s[tag=cushield.end] run function cushield:block/end