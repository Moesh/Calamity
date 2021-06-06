# Called from: calamity:tick

#>--------------------------------------------------------------------------------------------------
#> Purpose: Tick these functions during the match
#>--------------------------------------------------------------------------------------------------

# If no one is playing the match, stop the match
execute store result score #OnlinePlayers gameVariable if entity @a[tag=Playing]
execute if score #OnlinePlayers gameVariable matches 0 run function calamity:game_state/no_players_online

# Give recently respawned players respawn status effects
scoreboard players set #arenaAction gameVariable 6
function calamity:arena/handler

# Give spawn items
scoreboard players set #arenaAction gameVariable 9
function calamity:arena/handler

# Kill players who are out of bounds
execute as @a[tag=Playing,gamemode=!spectator,gamemode=!creative] store result score @s playerHeight run data get entity @s Pos[1]
execute as @a[tag=Playing,gamemode=!spectator,gamemode=!creative] run scoreboard players operation @s playerHeight -= 2 CONST
execute as @a[tag=Playing,gamemode=!spectator,gamemode=!creative] at @s unless block ~ 255 ~ minecraft:barrier run function calamity:player/out_of_bounds
execute as @a[tag=Playing,gamemode=!spectator,gamemode=!creative] unless score @s playerHeight < #arenaHeight gameVariable run function calamity:player/out_of_bounds
execute as @a[tag=Playing,gamemode=adventure] at @s if block ~ 255 ~ minecraft:barrier run gamemode survival @s

# Kill entities which aren't allowed in the spawn area
execute as @e[type=#calamity:banned_from_spawn] at @s if block ~ 251 ~ barrier run kill @s

# Kill out of bounds boats
execute as @e[type=boat] at @s unless block ~ 255 ~ minecraft:barrier run kill @s

# Count the players and check if someone left. If they did, recheck forfeit state. The forfeit
#   check normally only happens when someone triggers the gg trigger. This means that if everyone
#   but one person has voted for forfeit and that player then leaves the game won't end, even
#   though everyone online has voted for forfeit. We'll fix this problem by checking if a player
#   leaves and then checks the forfeit state.
execute store result score #tempVar gameVariable run execute if entity @a
scoreboard players operation Players gameVariable -= #tempVar gameVariable
execute if score Players gameVariable matches 1.. run function calamity:player/trigger/gg
execute run scoreboard players operation Players gameVariable = #tempVar gameVariable
# Reset our temp variable
scoreboard players reset #tempVar gameVariable

# Some players will be cheeky and set triggers to negative numbers, or numbers which will produce
#   no effect. This set of lines handles all cases for how
scoreboard players set @a[scores={gg=..-1}] gg 0
scoreboard players enable @a gg
execute as @a[scores={gg=1..},limit=1,tag=Playing] at @s run function calamity:player/trigger/gg

# Check for a winner
execute if score BluePoints gameVariable >= OreLeft gameVariable run function calamity:game_state/toast/blue_wins
execute if score RedPoints gameVariable >= OreLeft gameVariable run function calamity:game_state/toast/red_wins

# Players can't respawn in moving piston blocks. Make sure there is air at the spawn points.
execute at @e[type=minecraft:area_effect_cloud,name="BlueSpawnpoint"] run fill ~ ~ ~ ~ ~1 ~ minecraft:air destroy
execute at @e[type=minecraft:area_effect_cloud,name="RedSpawnpoint"] run fill ~ ~ ~ ~ ~1 ~ minecraft:air destroy

# Kill players in enemy spawn (But only if their full body is inside and they are standing on a block)
execute as @a[team=blue,tag=Playing,gamemode=!creative,gamemode=!spectator] at @s if block ~ 252 ~0.3 minecraft:barrier if block ~ 252 ~-0.3 minecraft:barrier if block ~0.3 252 ~ minecraft:barrier if block ~-0.3 252 ~ minecraft:barrier if entity @s[nbt={OnGround: 1b}] run kill @s
execute as @a[team=red,tag=Playing,gamemode=!creative,gamemode=!spectator] at @s if block ~ 253 ~0.3 minecraft:barrier if block ~ 253 ~-0.3 minecraft:barrier if block ~0.3 253 ~ minecraft:barrier if block ~-0.3 253 ~ minecraft:barrier if entity @s[nbt={OnGround: 1b}] run kill @s

# Tick the game timer
execute run function calamity:game_state/timer

# Run the functions listed in #calamity:tick_match if a match is running
execute if score GameState gameVariable matches 1 run function #calamity:tick_match