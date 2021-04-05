#marking to end block
tag @s add cushield.end
tag @s add cushield.blocked
scoreboard players set @s cush.cy.dur -10
execute if score disable= cush.main matches 1 unless score @s cush.dis.dont matches 1 run tag @s add cushield.disable

#negating motion
tp @s ~ ~ ~

#damage mechanics
execute if score @s cush.block_total <= @s cush.parry run function cushield:blocked/parry
execute unless score @s cush.block_total <= @s cush.parry run function cushield:blocked/normal

#disabled playsound
execute if entity @s[tag=cushield.disable] run function cushield:blocked/disabled

#clearing effects if any
execute unless data storage cushield:main {effect:"none"} run function cushield:blocked/effects

#reflecting arrows if able
execute if score @s[advancements={entityid:entity_hurt_player={is_projectile=true}}] cush.reflect matches 1 run function cushield:blocked/reflect

#adding to damage
scoreboard players add @s cush.durability 1