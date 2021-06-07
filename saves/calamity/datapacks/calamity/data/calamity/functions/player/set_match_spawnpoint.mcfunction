# Called from: #calamity:reset

#>--------------------------------------------------------------------------------------------------
#> Purpose: Teleport players to starting location and set spawnpoint
#>--------------------------------------------------------------------------------------------------

execute at @e[type=minecraft:area_effect_cloud,name="BlueSpawnpoint"] run teleport @a[team=blue] ~ ~ ~ 0 0
execute at @e[type=minecraft:area_effect_cloud,name="BlueSpawnpoint"] run spawnpoint @a[team=blue] ~ ~ ~
execute at @e[type=minecraft:area_effect_cloud,name="RedSpawnpoint"] run teleport @a[team=red] ~ ~ ~ 0 0
execute at @e[type=minecraft:area_effect_cloud,name="RedSpawnpoint"] run spawnpoint @a[team=red] ~ ~ ~