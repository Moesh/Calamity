# Called from: calamity:game_state/tick_match

#>--------------------------------------------------------------------------------------------------
#> Purpose: A player has gone out of bounds, let's punish them a bit for it.
#>--------------------------------------------------------------------------------------------------

# Kill players who are in the void. We don't actually care of they stare into the void. We're only
#   slightly concerned about what stares back. Don't think about it. Don't think about it.
effect give @s minecraft:weakness 1 7
effect give @s minecraft:mining_fatigue 1 7
effect give @s minecraft:slowness 1 7
title @s times 0 2 1
title @s subtitle {"translate": "calamity.out.of.bounds","color":"red"} 
title @s title {"text": ""} 
gamemode adventure @s[gamemode=survival]
# Unless, unless, unless, unless you're out of bounds...you're going to be alright. Unless.
execute unless block ~-1 255 ~-1 minecraft:barrier unless block ~1 255 ~-1 minecraft:barrier unless block ~1 255 ~1 minecraft:barrier unless block ~-1 255 ~1 minecraft:barrier unless block ~-1 255 ~ minecraft:barrier unless block ~1 255 ~ minecraft:barrier unless block ~ 255 ~1 minecraft:barrier unless block ~ 255 ~-1 minecraft:barrier unless entity @e[type=boat,distance=..2] run kill @s[nbt={OnGround: 1b}]

# If a player somehow did the impossible and placed a block out of bounds, let's send them the most
#   ridiculous message we can think of.
tellraw @s[tag=Playing,gamemode=!spectator,gamemode=!creative,nbt={OnGround:1b}] {"translate":"calamity.cheated.yourself","color": "gray","italic": true}
kill @s[tag=Playing,gamemode=!spectator,gamemode=!creative,nbt={OnGround:1b}]