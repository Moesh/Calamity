function calamity:resource_point/trigger

scoreboard players remove @e[type=area_effect_cloud,name=ResourcePoint,tag=Resetting,score_counter_min=1] counter 1
scoreboard players tag @e[type=area_effect_cloud,name=ResourcePoint,tag=Resetting,score_counter=0] add ReadyToStart

execute @e[type=area_effect_cloud,name=ResourcePoint,tag=Running,score_counter_min=1] ~ ~ ~ scoreboard players remove @s[tag=!Resetting] counter 1
execute @e[type=area_effect_cloud,name=ResourcePoint,tag=Running,score_counter=0] ~ ~ ~ scoreboard players tag @s[tag=!Resetting] add Output

execute @e[type=area_effect_cloud,name=ResourcePoint,tag=Running] ~ ~ ~ function calamity:resource_point/update_lights_running if @s[tag=!Resetting]
execute @e[type=area_effect_cloud,name=ResourcePoint,tag=Running] ~ ~ ~ function calamity:resource_point/update_lights_resetting if @s[tag=Resetting]
execute @e[type=area_effect_cloud,name=ResourcePoint,tag=Running] ~ ~ ~ function calamity:resource_point/update_sign

execute @e[type=area_effect_cloud,name=ResourcePoint,tag=Running] ~ ~ ~ function calamity:resource_point/playsound_every_second if @s[tag=!Resetting]


execute @e[type=area_effect_cloud,name=ResourcePoint] ~ ~ ~ function calamity:resource_point/output if @s[tag=Output]
execute @e[type=area_effect_cloud,name=ResourcePoint] ~ ~ ~ function calamity:resource_point/reset if @s[tag=ReadyToStart]
