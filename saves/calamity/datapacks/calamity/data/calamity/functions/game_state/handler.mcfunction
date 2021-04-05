# Called from: calamity:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Tick these functions during the lobby stage
#---------------------------------------------------------------------------------------------------

# Check if any player has used "/trigger readyTeam" and update the team state
execute if score GameState gameVariable matches 0 run function calamity:game_state/trigger_ready_team
execute if score ReadyBlue gameVariable matches 1 unless entity @a[team=blue] run function calamity:game_state/ready_team/blue_not_ready
execute if score ReadyRed gameVariable matches 1 unless entity @a[team=red] run function calamity:game_state/ready_team/red_not_ready

# Shuffle the players if someone has made a request to!
execute if score GameState gameVariable matches 0 run function calamity:game_state/trigger_shuffle
execute if score #ShufflePlayers gameVariable matches 1 run function calamity:game_state/shuffle_rest

# This line below is for players who want to be cheeky. If they ever set a score for startMatch,
# go ahead and assume they want to start the match.
execute if score GameState gameVariable matches 0 run scoreboard players set @a[scores={startMatch=..-1}] startMatch 0
execute if score GameState gameVariable matches 0 run scoreboard players enable @a[scores={startMatch=0}] startMatch
# If a game is not starting, check to see if players want to start a game
execute as @a[scores={startMatch=1..}] at @s run function calamity:game_state/trigger_start_match

# If a game start is happening, check to see if players want to cancel it
execute as @a[scores={cancelStart=1..}] at @s if score StartingMatch gameVariable matches 1 run function calamity:game_state/trigger_cancel_start

# Tick this every second, if the players will it
execute if score GameState gameVariable matches 0 if score StartingMatch gameVariable matches 1 run function calamity:game_state/timer_start_match

#---------------------------------------------------------------------------------------------------
# Purpose: Tick these functions during the match
#---------------------------------------------------------------------------------------------------

# Kill players who are out of bounds
execute as @a[tag=Playing,gamemode=!spectator,gamemode=!creative] at @s unless block ~ 74 ~ minecraft:barrier run function calamity:player/out_of_bounds
execute as @a[tag=Playing,gamemode=adventure] at @s if block ~ 74 ~ minecraft:barrier run gamemode survival @s
execute as @a[tag=Playing,gamemode=!spectator,gamemode=!creative] at @s if block 96 ~1 86 minecraft:barrier run tellraw @s {"translate":"calamity.cheated.yourself","color": "gray","italic": true}
execute as @a[tag=Playing,gamemode=!spectator,gamemode=!creative] at @s if block 96 ~1 86 minecraft:barrier run kill @s
# Kill out of bounds boats
execute as @e[type=boat] at @s unless block ~ 74 ~ minecraft:barrier run kill @s

# Handle the spawn items
execute if score GameState gameVariable matches 1 as @a[tag=Playing] run function calamity:player/spawn_items/handler
kill @e[type=item,nbt={Item: {tag: {Calamity: {SpawnItem: 1b}}}}]

# Count the players and check if someone left. If they did recheck forfeit state
# The forfeit check normally only happens when someone triggers the gg trigger
# Meaning that if everyone but one person has voted for forfeit and that player then leaves the game won't end
# even though everyone online has voted for forfeit
# We fix this problem by checking if a player leaves and then checks the forfeit state
execute if score GameState gameVariable matches 1 store result score #tempVar gameVariable run execute if entity @a
execute if score GameState gameVariable matches 1 run scoreboard players operation Players gameVariable -= #tempVar gameVariable
execute if score GameState gameVariable matches 1 if score Players gameVariable matches 1.. run function calamity:game_state/trigger_gg
execute if score GameState gameVariable matches 1 run scoreboard players operation Players gameVariable = #tempVar gameVariable
# Reset our temp variable
scoreboard players reset #tempVar gameVariable

# This next line is essentially protection of players against themselves. They can use
# Let players run a GG command to end a game early
# /trigger set gg 0, therefore disabling the gg trigger for themselves.
execute if score GameState gameVariable matches 1 run scoreboard players set @a[scores={gg=..-1}] gg 0
execute if score GameState gameVariable matches 1 run scoreboard players enable @a[scores={gg=0}] gg
execute as @a[scores={gg=1..},limit=1,tag=Playing] at @s if score GameState gameVariable matches 1 run function calamity:game_state/trigger_gg

# Check for winner
execute if score GameState gameVariable matches 1 if score BluePoints gameVariable >= OreLeft gameVariable run function calamity:game_state/blue_wins
execute if score GameState gameVariable matches 1 if score RedPoints gameVariable >= OreLeft gameVariable run function calamity:game_state/red_wins

# Make sure there is air at the spawn points (Players can't respawn in moving piston blocks)
execute if score GameState gameVariable matches 1 run fill 159 45 90 159 46 90 air destroy
execute if score GameState gameVariable matches 1 run fill 113 45 90 113 46 90 air destroy

execute if score GameState gameVariable matches 1 run function calamity:game_state/timer

#---------------------------------------------------------------------------------------------------
# Purpose: Tick these functions during the post-game
#---------------------------------------------------------------------------------------------------

# This line below is for players who want to be cheeky. If they ever set a score for startMatch,
# go ahead and assume they want to start the match.
execute if score GameState gameVariable matches 2 run scoreboard players set @a[scores={reset=..-1}] reset 0
execute if score GameState gameVariable matches 2 run scoreboard players enable @a[scores={reset=0}] reset

# If a game is not starting, check to see if players want to start a game
execute as @a[scores={reset=1..}] at @s if score GameState gameVariable matches 2 run function calamity:game_state/reset