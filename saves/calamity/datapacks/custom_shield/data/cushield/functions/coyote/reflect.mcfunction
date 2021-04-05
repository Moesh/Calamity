scoreboard players set @s cush.cy.ref.ty 0
scoreboard players set type= cush.main 0
execute if entity @s[advancements={entityid:entity_hurt_player={is_projectile=true}}] as @e[type=#entityid:projectile,tag=entityid.attacker.projectile,limit=1,sort=nearest] run function cushield:blocked/reflect/get_type
execute unless score type= cush.main matches 0 run scoreboard players operation @s cush.cy.ref.ty = type= cush.main