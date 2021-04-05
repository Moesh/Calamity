# Called from: calamity:generator/pressure_plate/trigger

#---------------------------------------------------------------------------------------------------
# Purpose: When no player is detected on the pressure plate
#---------------------------------------------------------------------------------------------------

tag @s remove PlayerAlreadyChecked
setblock ~ ~-1 ~ minecraft:end_portal_frame[eye=true,facing=east]
playsound calamity:calamity.eye.release block @a[team=blue] ~ ~-1 ~ 0.5
playsound calamity:calamity.eye.release block @a[team=red] ~ ~-1 ~ 0.5
tag @s remove ResetPoint