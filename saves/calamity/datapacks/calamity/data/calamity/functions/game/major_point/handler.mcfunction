function calamity:major_point/trigger

scoreboard players remove @e[type=area_effect_cloud,name=MajorPoint,tag=Resetting,score_counter_min=1] counter 1
scoreboard players tag @e[type=area_effect_cloud,name=MajorPoint,tag=Resetting,score_counter=0] add ReadyToStart

execute @e[type=area_effect_cloud,name=MajorPoint,tag=Running,score_counter_min=1] ~ ~ ~ scoreboard players remove @s[tag=!Resetting] counter 1
execute @e[type=area_effect_cloud,name=MajorPoint,tag=Running,score_counter=0] ~ ~ ~ scoreboard players tag @s[tag=!Resetting] add Output

execute @e[type=area_effect_cloud,name=MajorPoint,tag=Running] ~ ~ ~ function calamity:major_point/update_lights_running if @s[tag=!Resetting]
execute @e[type=area_effect_cloud,name=MajorPoint,tag=Running] ~ ~ ~ function calamity:major_point/update_lights_resetting if @s[tag=Resetting]
execute @e[type=area_effect_cloud,name=MajorPoint,tag=Running] ~ ~ ~ function calamity:major_point/update_sign

execute @e[type=area_effect_cloud,name=MajorPoint,tag=Running] ~ ~ ~ function calamity:major_point/playsound_every_second if @s[tag=!Resetting]


execute @e[type=area_effect_cloud,name=MajorPoint,tag=Output] ~ ~ ~ function calamity:major_point/output
execute @e[type=area_effect_cloud,name=MajorPoint] ~ ~ ~ function calamity:major_point/reset if @s[tag=ReadyToStart]