# Reset if area is empty
execute @e[type=area_effect_cloud,name=Objective,tag=PlayerAlreadyChecked] ~ ~ ~ testfor @a[r=4]
execute @e[type=area_effect_cloud,name=Objective,tag=PlayerAlreadyChecked,score_SuccessCount=0] ~ ~ ~ scoreboard players tag @s add ResetPoint
execute @e[type=area_effect_cloud,name=Objective,tag=ResetPoint] ~ ~ ~ scoreboard players tag @s remove PlayerAlreadyChecked
execute @e[type=area_effect_cloud,name=Objective,tag=ResetPoint] ~ ~ ~ setblock ~ ~-1 ~ minecraft:end_portal_frame 7
execute @e[type=area_effect_cloud,name=Objective,tag=ResetPoint] ~ ~ ~ execute @s ~ ~ ~ playsound minecraft:block.piston.contract block @a ~ ~-1 ~ 1 1.5
scoreboard players tag @e[type=area_effect_cloud,name=Objective,tag=ResetPoint] remove ResetPoint

# Player steps on pressure plate, if blue team, CheckStatus
execute @e[type=area_effect_cloud,name=Objective] ~ ~ ~ testfor @a[dx=0,dy=1,dz=0]
execute @e[type=area_effect_cloud,name=Objective,score_SuccessCount_min=1] ~ ~ ~ scoreboard players tag @s add CheckStatus
execute @e[type=area_effect_cloud,name=Objective,tag=CheckStatus,score_SuccessCount_min=1] ~ ~ ~ setblock ~ ~-1 ~ minecraft:end_portal_frame 6
execute @e[type=area_effect_cloud,name=Objective,tag=CheckStatus,score_SuccessCount_min=1] ~ ~ ~ playsound minecraft:block.piston.extend block @a[team=blue] ~ ~-1 ~ 1 1.5

# Has status been checked already?
scoreboard players tag @e[type=area_effect_cloud,name=Objective,tag=PlayerAlreadyChecked] remove CheckStatus

# Is the machine running? If so, give status message
execute @e[type=area_effect_cloud,name=Objective,tag=CheckStatus] ~ ~ ~ function calamity:objective/status_message if @s[tag=Running]
# If not running, start running
execute @e[type=area_effect_cloud,name=Objective,tag=CheckStatus] ~ ~ ~ execute @s[tag=!Running] ~ ~ ~ scoreboard players tag @s[tag=!Start] add Start
execute @e[type=area_effect_cloud,name=Objective,tag=CheckStatus] ~ ~ ~ function calamity:objective/start if @s[tag=Start]

scoreboard players tag @e[type=area_effect_cloud,name=Objective,tag=CheckStatus] add PlayerAlreadyChecked
scoreboard players tag @e[type=area_effect_cloud,name=Objective,tag=CheckStatus] remove CheckStatus