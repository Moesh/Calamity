scoreboard players operation @s progressLights = @s counter
scoreboard players operation @s progressLights /= EIGHTY CONST

execute @s[score_progressLights_min=4,score_progressLights=4] ~-4 ~-1 ~-2 setblock ~ ~ ~ minecraft:redstone_lamp
execute @s[score_progressLights_min=3,score_progressLights=3] ~-4 ~-1 ~-1 setblock ~ ~ ~ minecraft:redstone_lamp
execute @s[score_progressLights_min=2,score_progressLights=2] ~-4 ~-1 ~0 setblock ~ ~ ~ minecraft:redstone_lamp
execute @s[score_progressLights_min=1,score_progressLights=1] ~-4 ~-1 ~1 setblock ~ ~ ~ minecraft:redstone_lamp
execute @s[score_progressLights_min=0,score_progressLights=0] ~-4 ~-1 ~2 setblock ~ ~ ~ minecraft:redstone_lamp
