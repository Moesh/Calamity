# Reset if area is empty
execute @e[type=area_effect_cloud,name=ResourcePoint,tag=PlayerAlreadyChecked] ~ ~ ~ testfor @a[dx=0,dy=1,dz=0]
execute @e[type=area_effect_cloud,name=ResourcePoint,tag=PlayerAlreadyChecked,score_SuccessCount=0] ~ ~ ~ scoreboard players tag @s add ResetPoint
execute @e[type=area_effect_cloud,name=ResourcePoint,tag=ResetPoint] ~ ~ ~ scoreboard players tag @s remove PlayerAlreadyChecked
execute @e[type=area_effect_cloud,name=ResourcePoint,tag=ResetPoint] ~ ~ ~ setblock ~ ~-1 ~ minecraft:end_portal_frame 7
execute @e[type=area_effect_cloud,name=ResourcePoint,tag=ResetPoint] ~ ~ ~ playsound minecraft:block.piston.contract block @a ~ ~-1 ~ 1 1.5
scoreboard players tag @e[type=area_effect_cloud,name=ResourcePoint,tag=ResetPoint] remove ResetPoint

# Player steps on pressure plate, if blue team, CheckStatus
execute @e[type=area_effect_cloud,name=ResourcePoint,tag=TeamBlue] ~ ~ ~ testfor @a[dx=0,dy=1,dz=0,team=blue]
execute @e[type=area_effect_cloud,name=ResourcePoint,score_SuccessCount_min=1] ~ ~ ~ execute @s[tag=TeamBlue] ~ ~ ~ scoreboard players tag @s add CheckStatus
execute @e[type=area_effect_cloud,name=ResourcePoint,tag=CheckStatus,score_SuccessCount_min=1] ~ ~ ~ execute @s[tag=TeamBlue] ~ ~ ~ setblock ~ ~-1 ~ minecraft:end_portal_frame 6
execute @e[type=area_effect_cloud,name=ResourcePoint,tag=CheckStatus,score_SuccessCount_min=1] ~ ~ ~ execute @s[tag=TeamBlue] ~ ~ ~ playsound minecraft:block.piston.extend block @a ~ ~-1 ~ 1 1.5

# Player steps on pressure plate, if red team, CheckStatus
execute @e[type=area_effect_cloud,name=ResourcePoint,tag=TeamRed] ~ ~ ~ testfor @a[dx=0,dy=1,dz=0,team=red]
execute @e[type=area_effect_cloud,name=ResourcePoint,score_SuccessCount_min=1] ~ ~ ~ execute @s[tag=TeamRed] ~ ~ ~ scoreboard players tag @s add CheckStatus
execute @e[type=area_effect_cloud,name=ResourcePoint,tag=CheckStatus,score_SuccessCount_min=1] ~ ~ ~ execute @s[tag=TeamRed] ~ ~ ~ setblock ~ ~-1 ~ minecraft:end_portal_frame 6
execute @e[type=area_effect_cloud,name=ResourcePoint,tag=CheckStatus,score_SuccessCount_min=1] ~ ~ ~ execute @s[tag=TeamRed] ~ ~ ~ playsound minecraft:block.piston.extend block @a ~ ~-1 ~ 1 1.5

# Has status been checked already?
scoreboard players tag @e[type=area_effect_cloud,name=ResourcePoint,tag=PlayerAlreadyChecked] remove CheckStatus

# Is the machine running? If so, give status message
execute @e[type=area_effect_cloud,name=ResourcePoint,tag=CheckStatus] ~ ~ ~ function calamity:resource_point/status_message if @s[tag=Running]
# If not running, start running
execute @e[type=area_effect_cloud,name=ResourcePoint,tag=CheckStatus] ~ ~ ~ execute @s[tag=!Running] ~ ~ ~ scoreboard players tag @s[tag=!Start] add Start
execute @e[type=area_effect_cloud,name=ResourcePoint,tag=CheckStatus] ~ ~ ~ function calamity:resource_point/start if @s[tag=Start]

scoreboard players tag @e[type=area_effect_cloud,name=ResourcePoint,tag=CheckStatus] add PlayerAlreadyChecked
scoreboard players tag @e[type=area_effect_cloud,name=ResourcePoint,tag=CheckStatus] remove CheckStatus