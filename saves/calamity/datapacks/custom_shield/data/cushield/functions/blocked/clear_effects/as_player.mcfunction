#clearing specified effect
execute if score @s cush.effect matches 1 run effect clear @s minecraft:speed
execute if score @s cush.effect matches 2 run effect clear @s minecraft:slowness
execute if score @s cush.effect matches 3 run effect clear @s minecraft:haste
execute if score @s cush.effect matches 4 run effect clear @s minecraft:mining_fatigue
execute if score @s cush.effect matches 5 run effect clear @s minecraft:strength
execute if score @s cush.effect matches 6 run effect clear @s minecraft:instant_health
execute if score @s cush.effect matches 7 run effect clear @s minecraft:instant_damage
execute if score @s cush.effect matches 8 run effect clear @s minecraft:jump_boost
execute if score @s cush.effect matches 9 run effect clear @s minecraft:nausea
execute if score @s cush.effect matches 10 run effect clear @s minecraft:regeneration
execute if score @s cush.effect matches 11 run effect clear @s minecraft:resistance
execute if score @s cush.effect matches 12 run effect clear @s minecraft:fire_resistance
execute if score @s cush.effect matches 13 run effect clear @s minecraft:water_breathing
execute if score @s cush.effect matches 14 run effect clear @s minecraft:invisibility
execute if score @s cush.effect matches 15 run effect clear @s minecraft:blindness
execute if score @s cush.effect matches 16 run effect clear @s minecraft:night_vision
execute if score @s cush.effect matches 17 run effect clear @s minecraft:hunger
execute if score @s cush.effect matches 18 run effect clear @s minecraft:weakness
execute if score @s cush.effect matches 19 run effect clear @s minecraft:poison
execute if score @s cush.effect matches 20 run effect clear @s minecraft:wither
execute if score @s cush.effect matches 21 run effect clear @s minecraft:health_boost
execute if score @s cush.effect matches 22 run effect clear @s minecraft:absorption
execute if score @s cush.effect matches 23 run effect clear @s minecraft:saturation
execute if score @s cush.effect matches 24 run effect clear @s minecraft:glowing
execute if score @s cush.effect matches 25 run effect clear @s minecraft:levitation
execute if score @s cush.effect matches 26 run effect clear @s minecraft:luck
execute if score @s cush.effect matches 27 run effect clear @s minecraft:unluck
execute if score @s cush.effect matches 28 run effect clear @s minecraft:slow_falling
execute if score @s cush.effect matches 29 run effect clear @s minecraft:conduit_power
execute if score @s cush.effect matches 30 run effect clear @s minecraft:dolphins_grace
execute if score @s cush.effect matches 31 run effect clear @s minecraft:bad_omen
execute if score @s cush.effect matches 32 run effect clear @s minecraft:hero_of_the_village

#resetting score
scoreboard players reset @s cush.effect