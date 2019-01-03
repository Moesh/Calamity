
# Reset if area is empty
execute as @e[type=area_effect_cloud,name=ResourcePoint,tag=PlayerAlreadyChecked] at @s positioned ~-0.5 ~ ~-0.5 unless entity @a[dx=0,dy=1,dz=0] run tag @s add ResetPoint
execute as @e[type=area_effect_cloud,name=ResourcePoint,tag=ResetPoint] at @s run tag @s remove PlayerAlreadyChecked
execute as @e[type=area_effect_cloud,name=ResourcePoint,tag=ResetPoint] at @s run setblock ~ ~-1 ~ minecraft:end_portal_frame[eye=true,facing=east]
execute as @e[type=area_effect_cloud,name=ResourcePoint,tag=ResetPoint] at @s run playsound minecraft:block.piston.contract block @a[team=blue] ~ ~-1 ~ 1 1.5
execute as @e[type=area_effect_cloud,name=ResourcePoint,tag=ResetPoint] at @s run playsound minecraft:block.piston.contract block @a[team=red] ~ ~-1 ~ 1 1.5
tag @e[type=area_effect_cloud,name=ResourcePoint,tag=ResetPoint] remove ResetPoint
tag @e[type=area_effect_cloud,name=ResourcePoint,tag=ResetPoint] remove ResetPoint
 
# Player steps on pressure plate, if blue team, CheckStatus
execute as @e[type=area_effect_cloud,name=ResourcePoint,tag=TeamBlue] at @s positioned ~-0.5 ~ ~-0.5 if entity @a[dx=0,dy=1,dz=0,team=blue] run tag @s add CheckStatus
execute as @e[type=area_effect_cloud,name=ResourcePoint,tag=CheckStatus,tag=TeamBlue,tag=!PlayerAlreadyChecked] at @s run setblock ~ ~-1 ~ minecraft:end_portal_frame[eye=true,facing=west]
execute as @e[type=area_effect_cloud,name=ResourcePoint,tag=CheckStatus,tag=TeamBlue,tag=!PlayerAlreadyChecked] at @s run playsound minecraft:block.piston.extend block @a[team=blue] ~ ~-1 ~ 1 1.5
# Player steps on pressure plate, if red team, CheckStatus
execute as @e[type=area_effect_cloud,name=ResourcePoint,tag=TeamRed] at @s positioned ~-0.5 ~ ~-0.5 if entity @a[dx=0,dy=1,dz=0,team=red] positioned ~-0.5 ~ ~-0.5 run tag @s add CheckStatus
execute as @e[type=area_effect_cloud,name=ResourcePoint,tag=CheckStatus,tag=TeamRed,tag=!PlayerAlreadyChecked] at @s run setblock ~ ~-1 ~ minecraft:end_portal_frame[eye=true,facing=west]
execute as @e[type=area_effect_cloud,name=ResourcePoint,tag=CheckStatus,tag=TeamRed,tag=!PlayerAlreadyChecked] at @s run playsound minecraft:block.piston.extend block @a[team=red] ~ ~-1 ~ 1 1.5
 
# Has status been checked already?
tag @e[type=area_effect_cloud,name=ResourcePoint,tag=PlayerAlreadyChecked] remove CheckStatus
 
# # Is the machine running? If so, give status message
# execute @e[type=area_effect_cloud,name=ResourcePoint,tag=CheckStatus] ~ ~ ~ function calamity:resource_point/status_message if @s[tag=Running]

# # If not running, start running
# execute @e[type=area_effect_cloud,name=ResourcePoint,tag=CheckStatus] ~ ~ ~ execute @s[tag=!Running] ~ ~ ~ scoreboard players tag @s[tag=!Start] add Start
# execute @e[type=area_effect_cloud,name=ResourcePoint,tag=CheckStatus] ~ ~ ~ function calamity:resource_point/start if @s[tag=Start]
 
tag @e[type=area_effect_cloud,name=ResourcePoint,tag=CheckStatus] add PlayerAlreadyChecked
tag @e[type=area_effect_cloud,name=ResourcePoint,tag=CheckStatus] remove CheckStatus