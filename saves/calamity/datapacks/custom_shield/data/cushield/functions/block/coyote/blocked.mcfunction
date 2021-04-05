#damaging shield
scoreboard players add @s cush.durability 1

#reflecting if possible
execute if score @s cush.reflect matches 1 unless score @s cush.cy.ref.ty matches 0 run function cushield:block/coyote/reflect

#ending block and starting cooldown
scoreboard players operation @s cush.wait = @s cush.cooldown
execute if score @s cush.cy.disabl matches 1 unless score @s cush.dis.dont matches 1 run function cushield:blocked/disabled
execute if score @s cush.cy.disabl matches 1 unless score @s cush.dis.dont matches 1 run scoreboard players operation @s cush.wait = @s cush.dis.time
scoreboard players operation @s cush.wait.max = @s cush.wait
tag @s remove cushield.can_block

#resetting total
scoreboard players set @s cush.block_total 0
scoreboard players set @s cush.spam 0

#stopping end conditions
scoreboard players reset @s cush.dmg
scoreboard players reset @s cush.atk
scoreboard players reset @s cush.fall
scoreboard players reset @s cush.drop
scoreboard players reset @s cush.sprint

#modifying item
##create item modifier to do this in 1.17
function cushield:block/modify_item
tag @s remove cushield.offhand

#playing sound
playsound shield:large_shield.parry player @a

#particles
execute anchored eyes run particle enchanted_hit ^ ^-0.25 ^0.25 0.1 0.1 0.1 0.2 8 normal @s

#restoring health
execute if score @s cush.cy.dam matches 1.. run function cushield:block/coyote/restore_health
execute if score @s cush.cy.abs matches 1.. run function cushield:block/coyote/restore_absorption

#running player effect if applicable
execute if score @s cush.py.eff.pl matches 1.. run function cushield:blocked/parry/player

#running entity parry effect
scoreboard players operation entity_parry= cush.main = @s cush.py.eff.en
execute if score @s cush.py.eff.en matches 1.. as @e[type=!#entityid:id_skip,tag=cushield.attacker,limit=1] at @s run function cushield:blocked/parry/attacker