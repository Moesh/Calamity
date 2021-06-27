# Called from: calamity:tick_match

tellraw @s {"translate":"system.message","with":[{"translate":"calamity.cannot.enter.enemy.spawn","color": "red"}]}
title @s times 0 60 20
title @s title {"translate":"calamity.cursed","color": "red"}
playsound calamity:out.of.bounds player @s ~ ~ ~ 200 1
effect give @s minecraft:instant_damage 10
effect give @s minecraft:wither 7 10
effect give @s minecraft:blindness 7