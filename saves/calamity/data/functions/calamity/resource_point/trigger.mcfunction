# Player steps on pressure plate, if blue team, CheckStatus
execute @e[type=area_effect_cloud,name=ResourcePoint] ~ ~ ~ testfor @a[dx=0,dy=1,dz=0,team=blue]
execute @e[type=area_effect_cloud,name=ResourcePoint,score_SuccessCount_min=1] ~ ~ ~ scoreboard players tag @s add CheckStatus

# Has status been checked already?
scoreboard players tag @e[type=area_effect_cloud,name=ResourcePoint,tag=CheckedStatus] remove CheckStatus

# Reset if area is empty
execute @e[type=area_effect_cloud,name=ResourcePoint,tag=CheckedStatus] ~ ~ ~ testfor @a[dx=0,dy=1,dz=0]
execute @e[type=area_effect_cloud,name=ResourcePoint,tag=CheckedStatus,score_SuccessCount=0] ~ ~ ~ scoreboard players tag @s remove CheckedStatus

# Is the machine running?
execute @e[type=area_effect_cloud,name=ResourcePoint,tag=CheckStatus] ~ ~ ~ execute @s[tag=Running] ~ ~ ~ execute @s[tag=Resetting] ~ ~ ~ say Resetting status!
# Is the machine resetting?
execute @e[type=area_effect_cloud,name=ResourcePoint,tag=CheckStatus] ~ ~ ~ execute @s[tag=Running] ~ ~ ~ execute @s[tag=!Resetting] ~ ~ ~ say Running status!

# If not running, start running
execute @e[type=area_effect_cloud,name=ResourcePoint,tag=CheckStatus] ~ ~ ~ execute @s[tag=!Running] ~ ~ ~ scoreboard players tag @s[tag=!Start] add Start
execute @e[type=area_effect_cloud,name=ResourcePoint,tag=CheckStatus] ~ ~ ~ function calamity:resource_point/start if @s[tag=Start]


scoreboard players tag @e[type=area_effect_cloud,name=ResourcePoint,tag=CheckStatus] add CheckedStatus
scoreboard players tag @e[type=area_effect_cloud,name=ResourcePoint,tag=CheckStatus] remove CheckStatus

