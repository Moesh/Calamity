scoreboard players operation @s counter = RunningTime gameRules
tag @s add Running
execute as @s run function calamity:game/resource_point/update_sign
tag @s remove Start