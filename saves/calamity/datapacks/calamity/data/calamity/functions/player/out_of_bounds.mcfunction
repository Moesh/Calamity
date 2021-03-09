# Called from: calamity:tick

#---------------------------------------------------------------------------------------------------
# Purpose: A player has gone out of bounds, let's punish them a bit for it.
#---------------------------------------------------------------------------------------------------

# Kill players who are in the void
effect give @s minecraft:weakness 1 7
effect give @s minecraft:mining_fatigue 1 7
title @s times 0 2 1
title @s subtitle {"translate": "Out of bounds!","color":"red"} 
title @s title {"translate": ""} 
gamemode adventure @s[gamemode=survival]

execute if block ~-1 69 ~-1 #calamity:out_of_bounds_block if block ~1 69 ~-1 #calamity:out_of_bounds_block if block ~1 69 ~1 #calamity:out_of_bounds_block if block ~-1 69 ~1 #calamity:out_of_bounds_block if block ~-1 69 ~ #calamity:out_of_bounds_block if block ~1 69 ~ #calamity:out_of_bounds_block if block ~ 69 ~1 #calamity:out_of_bounds_block if block ~ 69 ~-1 #calamity:out_of_bounds_block unless @e[type=boat,distance=..2] run kill @s[nbt={OnGround:1b}]