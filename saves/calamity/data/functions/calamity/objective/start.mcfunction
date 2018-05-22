scoreboard players operation @s counter = MajorRunningTime gameRules
scoreboard players tag @s add Running
execute @s ~ ~ ~ function calamity:objective/update_sign
scoreboard players tag @s remove Start