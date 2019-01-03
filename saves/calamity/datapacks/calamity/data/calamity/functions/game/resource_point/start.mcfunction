scoreboard players operation @s counter = RunningTime gameRules
scoreboard players tag @s add Running
execute @s ~ ~ ~ function calamity:resource_point/update_sign
scoreboard players tag @s remove Start