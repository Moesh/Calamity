function calamity:resource_point/trigger

scoreboard players remove @e[type=area_effect_cloud,name=ResourcePoint,tag=Resetting,scores={counter=1..}] counter 1
tag @e[type=area_effect_cloud,name=ResourcePoint,tag=Resetting,scores={counter=0}] add ReadyToStart

scoreboard players remove @e[type=area_effect_cloud,name=ResourcePoint,tag=Running,scores={counter=1..},tag=!Resetting] counter 1
tag @e[type=area_effect_cloud,name=ResourcePoint,tag=Running,scores={counter=0},tag=!Resetting] add Output

execute at @e[type=area_effect_cloud,name=ResourcePoint,tag=Running,tag=!Resetting] run function calamity:resource_point/update_lights_running 
execute at @e[type=area_effect_cloud,name=ResourcePoint,tag=Running,tag=!Resetting] run function calamity:resource_point/playsound_every_second 
execute at @e[type=area_effect_cloud,name=ResourcePoint,tag=Running,tag=Resetting] run function calamity:resource_point/update_lights_resetting
execute at @e[type=area_effect_cloud,name=ResourcePoint,tag=Running] run function calamity:resource_point/update_sign

execute at @e[type=area_effect_cloud,name=ResourcePoint,tag=Output] run function calamity:resource_point/output
execute at @e[type=area_effect_cloud,name=ResourcePoint,tag=ReadyToStart] run function calamity:resource_point/reset