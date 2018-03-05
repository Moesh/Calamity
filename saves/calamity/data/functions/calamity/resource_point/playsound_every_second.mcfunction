# Tick timer down
scoreboard players operation @s progressLights = @s counter
#scoreboard players operation @s progressLights /= TWENTY CONST
scoreboard players operation @s progressLights %= TWENTY CONST
execute @s[score_progressLights_min=0,score_progressLights=0] ~ ~ ~ playsound minecraft:block.note.snare master @a ~ ~ ~ 1 2