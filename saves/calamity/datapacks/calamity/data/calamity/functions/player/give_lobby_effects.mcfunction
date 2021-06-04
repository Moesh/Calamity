# Called from: calamity:tick, calamity:player/set_to_lobby_mode

#>--------------------------------------------------------------------------------------------------
#> Purpose: Give player lobby effects
#>--------------------------------------------------------------------------------------------------

effect clear @s
effect give @s minecraft:absorption 4 1
effect give @s minecraft:weakness 999999 9 true

# Perhaps the arena has some special effects. Let's give it to them.
scoreboard players set #arenaAction gameVariable 6
function calamity:arena/handler