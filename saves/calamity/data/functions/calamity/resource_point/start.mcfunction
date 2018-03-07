scoreboard players operation @s counter = RunningTime gameRules
scoreboard players tag @s add Running
execute @s ~ ~ ~ execute @s[tag=FacingWest] ~ ~ ~ function calamity:resource_point/update_sign_running
scoreboard players tag @s remove Start