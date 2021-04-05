#grabbing player inventory
data modify storage cushield:main player set from entity @s Inventory

#listen handling
scoreboard players remove @s[tag=cushield.coyote] ehp_listen 1

#clearing tags
tag @s remove cushield.coyote
tag @s remove cushield.coyote.0
tag @s remove cushield.coyote.1
tag @s remove cushield.coyote.2
tag @s remove cushield.coyote.3
tag @s remove cushield.coyote.4
tag @s remove cushield.coyote.5
tag @s remove cushield.coyote.6
tag @s remove cushield.coyote.7
tag @s remove cushield.coyote.8
tag @s remove cushield.coyote.off

#adding tags
execute if data storage cushield:main player[{Slot:0b,tag:{shield:{can_coyote:1}}}] run tag @s add cushield.coyote.0
execute if data storage cushield:main player[{Slot:0b,tag:{shield:{can_coyote:1}}}] run tag @s add cushield.coyote
execute if data storage cushield:main player[{Slot:1b,tag:{shield:{can_coyote:1}}}] run tag @s add cushield.coyote.1
execute if data storage cushield:main player[{Slot:1b,tag:{shield:{can_coyote:1}}}] run tag @s add cushield.coyote
execute if data storage cushield:main player[{Slot:2b,tag:{shield:{can_coyote:1}}}] run tag @s add cushield.coyote.2
execute if data storage cushield:main player[{Slot:2b,tag:{shield:{can_coyote:1}}}] run tag @s add cushield.coyote
execute if data storage cushield:main player[{Slot:3b,tag:{shield:{can_coyote:1}}}] run tag @s add cushield.coyote.3
execute if data storage cushield:main player[{Slot:3b,tag:{shield:{can_coyote:1}}}] run tag @s add cushield.coyote
execute if data storage cushield:main player[{Slot:4b,tag:{shield:{can_coyote:1}}}] run tag @s add cushield.coyote.4
execute if data storage cushield:main player[{Slot:4b,tag:{shield:{can_coyote:1}}}] run tag @s add cushield.coyote
execute if data storage cushield:main player[{Slot:5b,tag:{shield:{can_coyote:1}}}] run tag @s add cushield.coyote.5
execute if data storage cushield:main player[{Slot:5b,tag:{shield:{can_coyote:1}}}] run tag @s add cushield.coyote
execute if data storage cushield:main player[{Slot:6b,tag:{shield:{can_coyote:1}}}] run tag @s add cushield.coyote.6
execute if data storage cushield:main player[{Slot:6b,tag:{shield:{can_coyote:1}}}] run tag @s add cushield.coyote
execute if data storage cushield:main player[{Slot:7b,tag:{shield:{can_coyote:1}}}] run tag @s add cushield.coyote.7
execute if data storage cushield:main player[{Slot:7b,tag:{shield:{can_coyote:1}}}] run tag @s add cushield.coyote
execute if data storage cushield:main player[{Slot:8b,tag:{shield:{can_coyote:1}}}] run tag @s add cushield.coyote.8
execute if data storage cushield:main player[{Slot:8b,tag:{shield:{can_coyote:1}}}] run tag @s add cushield.coyote
execute if data storage cushield:main player[{Slot:-106b,tag:{shield:{can_coyote:1}}}] run tag @s add cushield.coyote.off
execute if data storage cushield:main player[{Slot:-106b,tag:{shield:{can_coyote:1}}}] run tag @s add cushield.coyote

#listen handling
execute store success score @s cush.cy.has if entity @s[tag=cushield.coyote]
scoreboard players add @s[tag=cushield.coyote] ehp_listen 1
execute if score @s[tag=!ehp_listen] ehp_listen matches 1.. run function entityid:listen/ehp_enable

#clearing storage
data modify storage cushield:main player set value {}

#scheduling revoking
schedule function cushield:coyote/revoke_shield_updates 1t