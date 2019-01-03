function calamity:resource_point/trigger

scoreboard players remove @e[type=area_effect_cloud,name=ResourcePoint,tag=Resetting,scores={counter=1..}] counter 1
tag @e[type=area_effect_cloud,name=ResourcePoint,tag=Resetting,scores={counter=0}] add ReadyToStart

scoreboard players remove @e[type=area_effect_cloud,name=ResourcePoint,tag=Running,scores={counter=1..},tag=!Resetting] counter 1
tag @e[type=area_effect_cloud,name=ResourcePoint,tag=Running,scores={counter=0},tag=!Resetting] add Output

execute as @e[type=area_effect_cloud,name=ResourcePoint,tag=Running,tag=!Resetting] at @s run function calamity:resource_point/update_lights_running 
execute as @e[type=area_effect_cloud,name=ResourcePoint,tag=Running,tag=!Resetting] at @s run function calamity:resource_point/playsound_every_second 
execute as @e[type=area_effect_cloud,name=ResourcePoint,tag=Running,tag=Resetting] at @s run function calamity:resource_point/update_lights_resetting
execute as @e[type=area_effect_cloud,name=ResourcePoint,tag=Running] at @s run function calamity:resource_point/update_sign

execute as @e[type=area_effect_cloud,name=ResourcePoint,tag=Output] at @s run function calamity:resource_point/output
execute as @e[type=area_effect_cloud,name=ResourcePoint,tag=ReadyToStart] at @s run function calamity:resource_point/reset