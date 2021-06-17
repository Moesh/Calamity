# Called from: calamity:generator/handler

#>--------------------------------------------------------------------------------------------------
#> Purpose: Play a sound as the generator charges
#>--------------------------------------------------------------------------------------------------

# Tick timer down
scoreboard players operation @s progressSound = @s GeneratorTimer
scoreboard players operation @s progressSound %= 20 CONST

# Play the sound for everyone
execute as @s[scores={progressSound=0},tag=TeamBlue] run playsound calamity:generator.tick master @a[team=blue] ~ ~-1 ~ 1 2
execute as @s[scores={progressSound=0},tag=TeamRed] run playsound calamity:generator.tick master @a[team=red] ~ ~-1 ~ 1 2