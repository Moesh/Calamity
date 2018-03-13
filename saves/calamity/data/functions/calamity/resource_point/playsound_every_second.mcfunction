# Tick timer down
scoreboard players operation @s progressSound = @s counter
scoreboard players operation @s progressSound %= TWENTY CONST
execute @s[score_progressSound_min=0,score_progressSound=0,tag=TeamBlue] ~ ~ ~ playsound minecraft:block.note.snare master @a[team=blue] ~ ~ ~ 1 2
execute @s[score_progressSound_min=0,score_progressSound=0,tag=TeamRed] ~ ~ ~ playsound minecraft:block.note.snare master @a[team=red] ~ ~ ~ 1 2