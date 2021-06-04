# Called from: #calamity:reset

#>--------------------------------------------------------------------------------------------------
#> Purpose: Playing coming out of spawn should be a bit more powerful, so that they are not trapped
#   by an overpowered player.
#>--------------------------------------------------------------------------------------------------

effect clear @s
effect give @s minecraft:speed 10 1
effect give @s minecraft:strength 10 1
effect give @s minecraft:absorption 10 1
effect give @s minecraft:fire_resistance 10 1
effect give @s minecraft:resistance 10 0

# Perhaps the arena has some special effects. Let's give it to them.
scoreboard players set #arenaAction gameVariable 7
function calamity:arena/handler