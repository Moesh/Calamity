scoreboard players operation @s counter = RunningTime gameRules
tag @s add Running
execute as @s run function calamity:resource_point/update_sign
scoreboard players tag @s remove Start