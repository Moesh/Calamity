#function calamity:resource_point/handler
#function calamity:major_point/handler

# Convert end_stone item to cobblestone item.
execute as @e[type=item,nbt={Item:{id:"minecraft:end_stone"}}] run data merge entity @s {Item:{id:"minecraft:cobblestone"}}