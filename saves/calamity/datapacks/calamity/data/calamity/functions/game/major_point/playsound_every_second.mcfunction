# Tick timer down
scoreboard players operation @s progressSound = @s counter
scoreboard players operation @s progressSound %= 20 CONST
execute @s[score_progressSound_min=0,score_progressSound=0] ~ ~ ~ playsound minecraft:block.note.snare master @a ~ ~ ~ 1 2