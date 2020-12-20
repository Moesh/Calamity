# Called from: moesh:resource_point/handler

#---------------------------------------------------------------------------------------------------
# Purpose: The resource point is returning to a neutral state.
#---------------------------------------------------------------------------------------------------

# Remove tag which determine the resource point state.
tag @s remove Resetting
tag @s remove Charging

# If a player is nearby, advise them the point is ready to use.
execute as @a[distance=..4] if block ~ ~-2 ~ minecraft:bedrock run tag @s add GiveMessage
execute as @a[distance=..4] if block ~ ~-3 ~ minecraft:bedrock run tag @s add GiveMessage
title @a[tag=GiveMessage] actionbar {"translate":"Ready","color":"green"}
tag @a[tag=GiveMessage] remove GiveMessage

# Update the sign
execute as @s[tag=FacingWest] run data merge block ~-3 ~ ~ {Text2:"{\"translate\":\"resourcePoint.sign.ready\"}"}
execute as @s[tag=FacingEast] run data merge block ~3 ~ ~ {Text2:"{\"translate\":\"resourcePoint.sign.ready\"}"}

# Tag which caused the handler to call this function
tag @s remove ReadyToStart