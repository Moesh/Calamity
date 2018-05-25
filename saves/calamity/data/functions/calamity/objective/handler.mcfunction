function calamity:objective/trigger

# Tick things up
scoreboard players remove @e[type=area_effect_cloud,name=Objective,tag=Running,score_counter_min=1] counter 1
scoreboard players tag @e[type=area_effect_cloud,name=Objective,tag=Running,score_counter=0] add Output

execute @e[type=area_effect_cloud,name=Objective,tag=Running] ~ ~ ~ function calamity:objective/update_lights
execute @e[type=area_effect_cloud,name=Objective,tag=Running] ~ ~ ~ function calamity:objective/update_sign
execute @e[type=area_effect_cloud,name=Objective,tag=Running] ~ ~ ~ function calamity:objective/playsound_every_second


execute @e[type=area_effect_cloud,name=Objective,tag=Output] ~ ~ ~ function calamity:objective/output