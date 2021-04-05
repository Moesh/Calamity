# Called from: calamity:tick

#---------------------------------------------------------------------------------------------------
# Purpose: A player has gone out of bounds, let's punish them a bit for it.
#---------------------------------------------------------------------------------------------------

# Kill players who are in the void
effect give @s minecraft:weakness 1 7
effect give @s minecraft:mining_fatigue 1 7
title @s times 0 2 1
title @s subtitle {"translate": "calamity.out.of.bounds","color":"red"} 
title @s title {"text": ""} 
gamemode adventure @s[gamemode=survival]

execute unless block ~-1 74 ~-1 minecraft:barrier unless block ~1 74 ~-1 minecraft:barrier unless block ~1 74 ~1 minecraft:barrier unless block ~-1 74 ~1 minecraft:barrier unless block ~-1 74 ~ minecraft:barrier unless block ~1 74 ~ minecraft:barrier unless block ~ 74 ~1 minecraft:barrier unless block ~ 74 ~-1 minecraft:barrier unless entity @e[type=boat,distance=..2] run kill @s[nbt={OnGround: 1b}]