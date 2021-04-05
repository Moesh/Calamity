data modify storage cushield:main entity set value {}
data modify storage cushield:main entity set from entity @s
execute if data storage cushield:main entity.Potion run function cushield:get_projectile_rotation/convert_potion
execute if data storage cushield:main entity.CustomPotionEffects run data modify storage cushield:main effect set from storage cushield:main entity.CustomPotionEffects[0].Id