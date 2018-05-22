function calamity:objective/trigger

scoreboard players remove @e[type=area_effect_cloud,name=Objective,tag=Resetting,score_counter_min=1] counter 1
scoreboard players tag @e[type=area_effect_cloud,name=Objective,tag=Resetting,score_counter=0] add ReadyToStart

execute @e[type=area_effect_cloud,name=Objective,tag=Running,score_counter_min=1] ~ ~ ~ scoreboard players remove @s[tag=!Resetting] counter 1
execute @e[type=area_effect_cloud,name=Objective,tag=Running,score_counter=0] ~ ~ ~ scoreboard players tag @s[tag=!Resetting] add Output

execute @e[type=area_effect_cloud,name=Objective,tag=Running] ~ ~ ~ function calamity:objective/update_lights_running if @s[tag=!Resetting]
execute @e[type=area_effect_cloud,name=Objective,tag=Running] ~ ~ ~ function calamity:objective/update_lights_resetting if @s[tag=Resetting]
execute @e[type=area_effect_cloud,name=Objective,tag=Running] ~ ~ ~ function calamity:objective/update_sign

execute @e[type=area_effect_cloud,name=Objective,tag=Running] ~ ~ ~ function calamity:objective/playsound_every_second if @s[tag=!Resetting]


execute @e[type=area_effect_cloud,name=Objective,tag=Output] ~ ~ ~ function calamity:objective/output
execute @e[type=area_effect_cloud,name=Objective] ~ ~ ~ function calamity:objective/reset if @s[tag=ReadyToStart]