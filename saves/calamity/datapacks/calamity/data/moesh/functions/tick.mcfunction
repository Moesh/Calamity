# Called from: #minecraft:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Calls main game handlers. Sometimes a function is a single line.
#---------------------------------------------------------------------------------------------------

# Resource points run every tick. When we establish game states, we'll be able to turn this on only
# when the game is running.
function moesh:resource_point/handler

# Convert end_stone item to cobblestone item.
execute as @e[type=item,nbt={Item:{id:"minecraft:end_stone"}}] run data merge entity @s {Item:{id:"minecraft:cobblestone"}}