# Player steps into range, if blue team, start objective countdown
execute @e[type=area_effect_cloud,name=Objective,tag=TeamBlue] ~ ~ ~ scoreboard players tag @a[r=4] add CheckIfPlayerInRange
execute @e[type=area_effect_cloud,name=Objective,tag=TeamBlue] ~ ~ ~ execute @a[tag=CheckIfPlayerInRange,r=4] ~ ~ ~ detect ~ ~-3 ~ minecraft:end_portal_frame 6
scoreboard players tag @e[type=area_effect_cloud,name=Objective,r=1,tag=!PlayerAlreadyChecked] add CheckStatus

# If not running, start running
execute @e[type=area_effect_cloud,name=Objective,tag=CheckStatus] ~ ~ ~ execute @s[tag=!Running] ~ ~ ~ scoreboard players tag @s[tag=!Start] add Start
execute @e[type=area_effect_cloud,name=Objective,tag=CheckStatus] ~ ~ ~ function calamity:objective/start if @s[tag=Start]

scoreboard players tag @e[type=area_effect_cloud,name=Objective,tag=CheckStatus] add PlayerAlreadyChecked
scoreboard players tag @e[type=area_effect_cloud,name=Objective,tag=CheckStatus] remove CheckStatus