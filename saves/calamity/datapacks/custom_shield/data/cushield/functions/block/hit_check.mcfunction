#resetting effect block value
data modify storage cushield:main effect set value "none"

#getting rotation values for hit check
execute unless entity @s[advancements={entityid:entity_hurt_player={is_projectile=true}}] run function cushield:get_rotation
execute if entity @s[advancements={entityid:entity_hurt_player={is_projectile=true}}] run function cushield:get_projectile_rotation

#damage reduction calculation
execute if score @s cush.x_angle >= x_rotation= cush.main if score @s cush.y_angle >= y_rotation= cush.main run function cushield:blocked

#doing damage
execute if score @s cush.dmg matches ..0 run stopsound @a player minecraft:entity.player.hurt
execute unless score @s cush.dmg matches ..0 run function cushield:block/do_damage