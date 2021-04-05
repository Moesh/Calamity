execute if entity @s[type=minecraft:arrow] run function cushield:get_projectile_rotation/get_custom_effects
execute if entity @s[type=minecraft:spectral_arrow] run data modify storage cushield:main effect set value 24b
execute if entity @s[type=minecraft:shulker_bullet] run data modify storage cushield:main effect set value 25b