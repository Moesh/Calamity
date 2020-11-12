tag @s remove PlayerAlreadyChecked
setblock ~ ~-1 ~ minecraft:end_portal_frame[eye=true,facing=east]
playsound minecraft:block.piston.contract block @a[team=blue] ~ ~-1 ~ 1 1.5
playsound minecraft:block.piston.contract block @a[team=red] ~ ~-1 ~ 1 1.5
tag @s remove ResetPoint