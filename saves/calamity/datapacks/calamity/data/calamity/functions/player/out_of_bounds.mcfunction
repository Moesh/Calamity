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