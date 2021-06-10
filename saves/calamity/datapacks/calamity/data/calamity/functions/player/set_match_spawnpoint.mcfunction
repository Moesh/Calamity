# Called from: #calamity:reset

#>--------------------------------------------------------------------------------------------------
#> Purpose: Teleport players to starting location and set spawnpoint
#>--------------------------------------------------------------------------------------------------

execute at @e[type=minecraft:area_effect_cloud,name="BlueSpawnpoint"] run teleport @s[team=blue] ~ ~ ~ 0 0
execute at @e[type=minecraft:area_effect_cloud,name="BlueSpawnpoint"] run spawnpoint @s[team=blue] ~ ~ ~
execute at @e[type=minecraft:area_effect_cloud,name="RedSpawnpoint"] run teleport @s[team=red] ~ ~ ~ 0 0
execute at @e[type=minecraft:area_effect_cloud,name="RedSpawnpoint"] run spawnpoint @s[team=red] ~ ~ ~