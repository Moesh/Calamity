# Called from: calamity:resource_point/pressure_plate/trigger

#---------------------------------------------------------------------------------------------------
# Purpose: When no player is detected on the pressure plate
#---------------------------------------------------------------------------------------------------

tag @s remove PlayerAlreadyChecked
setblock ~ ~-1 ~ minecraft:end_portal_frame[eye=true,facing=east]
playsound minecraft:block.piston.contract block @a[team=blue] ~ ~-1 ~ 1 1.5
playsound minecraft:block.piston.contract block @a[team=red] ~ ~-1 ~ 1 1.5
tag @s remove ResetPoint