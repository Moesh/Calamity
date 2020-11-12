# Called from: calamity:resource_point/pressure_plate/trigger

#---------------------------------------------------------------------------------------------------
# Purpose: Display a status message of current progress when player steps on fake pressure plate
#---------------------------------------------------------------------------------------------------

# Do some math to figure out seconds from PointTimer
scoreboard players operation @s displaySecond = @s PointTimer
scoreboard players operation @s displaySecond /= 20 CONST

# Charging
# More than one second left
execute at @s[tag=Running,scores={displaySecond=2..}] run title @a[distance=..4] actionbar {"translate":"resourcePoint.statusMessage.chargeSeconds","color":"green","with":[{"score":{"name":"@s","objective":"displaySecond"},"color":"white"}]}
# One second left
execute at @s[tag=Running,scores={displaySecond=1}] run title @a[distance=..4] actionbar {"translate":"resourcePoint.statusMessage.chargeSecond","color":"green","with":[{"score":{"name":"@s","objective":"displaySecond"},"color":"white"}]}


# Resetting
# More than one second left
execute at @s[tag=Resetting,scores={displaySecond=2..}] run title @a[distance=..4] actionbar {"translate":"resourcePoint.statusMessage.resettingSeconds","color":"green","with":[{"score":{"name":"@s","objective":"displaySecond"},"color":"white"}]}
# One second left
execute at @s[tag=Resetting,scores={displaySecond=1}] run title @a[distance=..4] actionbar {"translate":"resourcePoint.statusMessage.resettingSecond","color":"green","with":[{"score":{"name":"@s","objective":"displaySecond"},"color":"white"}]}
