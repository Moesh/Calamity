# Called from: calamity:game_state/tick_match

#>--------------------------------------------------------------------------------------------------
#> Purpose: A player has gone out of bounds, let's punish them a bit for it.
#>--------------------------------------------------------------------------------------------------

# Players not in bounds need a show and tell session.
# Also make sure they can not commit any actions.
effect give @s minecraft:weakness 1 7
effect give @s minecraft:slowness 1 7
title @s times 0 2 1
title @s subtitle {"translate": "calamity.out.of.bounds","color":"red"} 
title @s title {"text": ""} 
gamemode adventure @s[gamemode=survival]

# "Soft out of bounds" is determined by a barrier data layer at y=254. They are allowed to continue to live.
# If a player is not in the "soft out of bounds" area then they can be killed if they touch the ground again.
execute unless block ~-0.3 254 ~-0.3 minecraft:barrier unless block ~0.3 254 ~-0.3 minecraft:barrier unless block ~0.3 254 ~0.3 minecraft:barrier unless block ~-0.3 254 ~0.3 minecraft:barrier unless block ~-0.3 254 ~ minecraft:barrier unless block ~0.3 254 ~ minecraft:barrier unless block ~ 254 ~0.3 minecraft:barrier unless block ~ 254 ~-0.3 minecraft:barrier run tellraw @s[tag=Playing,gamemode=!spectator,gamemode=!creative,nbt={OnGround:1b}] {"translate":"calamity.cheated.yourself","color": "gray","italic": true}
execute unless block ~-0.3 254 ~-0.3 minecraft:barrier unless block ~0.3 254 ~-0.3 minecraft:barrier unless block ~0.3 254 ~0.3 minecraft:barrier unless block ~-0.3 254 ~0.3 minecraft:barrier unless block ~-0.3 254 ~ minecraft:barrier unless block ~0.3 254 ~ minecraft:barrier unless block ~ 254 ~0.3 minecraft:barrier unless block ~ 254 ~-0.3 minecraft:barrier run kill @s[tag=Playing,gamemode=!spectator,gamemode=!creative,nbt={OnGround:1b}]