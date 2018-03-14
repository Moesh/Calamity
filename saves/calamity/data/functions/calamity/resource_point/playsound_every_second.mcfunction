# Tick timer down
scoreboard players operation @e[type=area_effect_cloud] progressSecond = @s counter
scoreboard players operation @e[type=area_effect_cloud] progressSecond %= 20 CONST
execute @s[score_progressSound_min=0,score_progressSecond=0] ~ ~ ~ playsound minecraft:block.note.snare master @a ~ ~ ~ 1 2