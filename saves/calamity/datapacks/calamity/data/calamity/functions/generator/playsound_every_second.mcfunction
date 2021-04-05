# Tick timer down
scoreboard players operation @s progressSound = @s PointTimer
scoreboard players operation @s progressSound %= 20 CONST
execute as @s[scores={progressSound=0},tag=TeamBlue] run playsound minecraft:block.note_block.snare master @a[team=blue] ~ ~ ~ 1 2
execute as @s[scores={progressSound=0},tag=TeamRed] run playsound minecraft:block.note_block.snare master @a[team=red] ~ ~ ~ 1 2