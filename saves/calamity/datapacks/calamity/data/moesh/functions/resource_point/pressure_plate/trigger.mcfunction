# Called from: moesh:resource_point/handler

#---------------------------------------------------------------------------------------------------
# Purpose: Handler for triggering the custom pressure plate
#---------------------------------------------------------------------------------------------------
# I've always liked the idea of using the Ender Eye Portal Block as a pressure plate. This
# implementation is design to allow multiple players to quickly activate the trigger without having
# the delay of a normal pressure plate. In order to do this, we must also

# Unless a player is standing on the ender_eye block, reset the ender_eye block
execute as @e[type=area_effect_cloud,name=ResourcePoint,tag=PlayerAlreadyChecked] at @s positioned ~-0.5 ~ ~-0.5 unless entity @a[dx=0,dy=1,dz=0] run tag @s add ResetPoint
execute as @e[type=area_effect_cloud,name=ResourcePoint,tag=ResetPoint] at @s run function moesh:resource_point/pressure_plate/reset_plate

# Player steps on pressure plate
    # Check if correct team (does tag TeamBlue )
    # Check if PlayerAlreadyChecked tag does not exists
# If blue team...
execute as @e[type=area_effect_cloud,name=ResourcePoint,tag=TeamBlue,tag=!PlayerAlreadyChecked] at @s positioned ~-0.5 ~ ~-0.5 if entity @a[dx=0,dy=1,dz=0,team=blue] run tag @s add CheckStatus
execute as @e[type=area_effect_cloud,name=ResourcePoint,tag=CheckStatus,tag=TeamBlue] at @s run setblock ~ ~-1 ~ minecraft:end_portal_frame[eye=true,facing=west]
execute as @e[type=area_effect_cloud,name=ResourcePoint,tag=CheckStatus,tag=TeamBlue] at @s run playsound minecraft:block.piston.extend block @a[team=blue] ~ ~-1 ~ 1 1.5
# If red eam...
execute as @e[type=area_effect_cloud,name=ResourcePoint,tag=TeamRed,tag=!PlayerAlreadyChecked] at @s positioned ~-0.5 ~ ~-0.5 if entity @a[dx=0,dy=1,dz=0,team=red] positioned ~-0.5 ~ ~-0.5 run tag @s add CheckStatus
execute as @e[type=area_effect_cloud,name=ResourcePoint,tag=CheckStatus,tag=TeamRed] at @s run setblock ~ ~-1 ~ minecraft:end_portal_frame[eye=true,facing=west]
execute as @e[type=area_effect_cloud,name=ResourcePoint,tag=CheckStatus,tag=TeamRed] at @s run playsound minecraft:block.piston.extend block @a[team=red] ~ ~-1 ~ 1 1.5
 
# Has status been checked already?
# Is the point charging or resetting? Send a message.
execute as @e[type=area_effect_cloud,name=ResourcePoint,tag=CheckStatus,tag=Charging] at @s run function moesh:resource_point/status_message
execute as @e[type=area_effect_cloud,name=ResourcePoint,tag=CheckStatus,tag=Resetting] at @s run function moesh:resource_point/status_message

# Is the point idle? Start charging.
execute as @e[type=area_effect_cloud,name=ResourcePoint,tag=CheckStatus,tag=!Charging,tag=!Resetting] run function moesh:resource_point/start
 

# If a player has already stepped here in the last tick, make it so the pressure plate is not triggered again until they leave.
tag @e[type=area_effect_cloud,name=ResourcePoint,tag=CheckStatus] add PlayerAlreadyChecked
# We checked the status, remove the status tag.
tag @e[type=area_effect_cloud,name=ResourcePoint,tag=CheckStatus] remove CheckStatus