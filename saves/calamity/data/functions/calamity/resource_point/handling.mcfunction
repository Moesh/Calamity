execute @e[type=area_effect_cloud,name=ResourcePoint,tag=Running,score_counter_min=1] ~ ~ ~ scoreboard players remove @s[tag=!Resetting] counter 1
execute @e[type=area_effect_cloud,name=ResourcePoint,tag=Running,score_counter=0] ~ ~ ~ scoreboard players tag @s[tag=!Resetting] add Reset

scoreboard players remove @e[type=area_effect_cloud,name=ResourcePoint,tag=Resetting,score_counter_min=1] counter 1
scoreboard players tag @e[type=area_effect_cloud,name=ResourcePoint,tag=Resetting,score_counter=0] add ReadyToStart

execute @e[type=area_effect_cloud,name=ResourcePoint,tag=Running] ~ ~ ~ function calamity:resource_point/update_lights_running if @s[tag=!Resetting]
execute @e[type=area_effect_cloud,name=ResourcePoint,tag=Running] ~ ~ ~ function calamity:resource_point/update_sign_running if @s[tag=!Resetting]
execute @e[type=area_effect_cloud,name=ResourcePoint,tag=Running] ~ ~ ~ function calamity:resource_point/playsound_every_second if @s[tag=!Resetting]
execute @e[type=area_effect_cloud,name=ResourcePoint,tag=Running] ~ ~ ~ function calamity:resource_point/update_lights_resetting if @s[tag=Resetting]

scoreboard players tag @e[type=area_effect_cloud,name=ResourcePoint,tag=Reset] add Resetting
scoreboard players operation @e[type=area_effect_cloud,name=ResourcePoint,tag=Reset] counter = ResettingTime gameRules
execute @e[type=area_effect_cloud,name=ResourcePoint,tag=Reset] ~ ~ ~ say Resources given
scoreboard players tag @e[type=area_effect_cloud,name=ResourcePoint,tag=Reset] remove Reset

scoreboard players tag @e[type=area_effect_cloud,name=ResourcePoint,tag=ReadyToStart] remove Resetting
scoreboard players tag @e[type=area_effect_cloud,name=ResourcePoint,tag=ReadyToStart] remove Running
execute @e[type=area_effect_cloud,name=ResourcePoint,tag=ReadyToStart] ~ ~ ~ say Point reset
scoreboard players tag @e[type=area_effect_cloud,name=ResourcePoint,tag=ReadyToStart] remove ReadyToStart