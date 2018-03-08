scoreboard players operation @s progressLights = @s counter
#scoreboard players operation @s progressLights /= HUNDRED CONST

execute @s[score_progressLights_min=380,score_progressLights=380] ~-3 ~-1 ~-2 setblock ~ ~ ~ minecraft:redstone_lamp
execute @s[score_progressLights_min=300,score_progressLights=300] ~-3 ~-1 ~-1 setblock ~ ~ ~ minecraft:redstone_lamp
execute @s[score_progressLights_min=200,score_progressLights=200] ~-3 ~-1 ~0 setblock ~ ~ ~ minecraft:redstone_lamp
execute @s[score_progressLights_min=100,score_progressLights=100] ~-3 ~-1 ~1 setblock ~ ~ ~ minecraft:redstone_lamp
execute @s[score_progressLights_min=0,score_progressLights=0] ~-3 ~-1 ~2 setblock ~ ~ ~ minecraft:redstone_lamp
