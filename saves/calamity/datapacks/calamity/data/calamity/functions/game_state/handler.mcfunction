# Called from: calamity:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Tick these functions during the lobby stage
#---------------------------------------------------------------------------------------------------

# This line below is for players who want to be cheeky. If they ever set a score for startMatch,
# go ahead and assume they want to start the match.
execute if score GameState gameVariable matches 0 run scoreboard players set @a[scores={startMatch=..-1}] startMatch 0
execute if score GameState gameVariable matches 0 run scoreboard players enable @a[scores={startMatch=0}] startMatch

# If a game is not starting, check to see if players want to start a game
execute as @a[scores={startMatch=1..}] at @s run function calamity:game_state/trigger_start_match

# If a game start is happening, check to see if players want to cancel it
execute as @a[scores={cancelStart=1..}] at @s run execute if score StartingMatch gameVariable matches 1 run function calamity:game_state/trigger_cancel_start

# Tick this every second if the players will it
execute if score GameState gameVariable matches 0 if score StartingMatch gameVariable matches 1 run function calamity:game_state/timer_start_match

#---------------------------------------------------------------------------------------------------
# Purpose: Tick these functions during the match
#---------------------------------------------------------------------------------------------------

# Prevent players from leaving the play area
# TODO: execute as @a at @s unless entity @s[gamemode=spectator] if score GameState gameVariable matches 1 run function calamity:game_state/out_of_bounds

# Count the players and check if someone left. If they did recheck forfeit state
#
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
execute if score GameState gameVariable matches 1 if score BluePoints gameVariable >= RequiredToWin mapRules run tellraw @a {"translate":"%s Blue wins!","color":"blue","with":[{"text":">>>","color":"white"}]}
execute if score GameState gameVariable matches 1 if score BluePoints gameVariable >= RequiredToWin mapRules run function calamity:game_state/end_match
execute if score GameState gameVariable matches 1 if score RedPoints gameVariable >= RequiredToWin mapRules run tellraw @a {"translate":"%s Red wins!","color":"red","with":[{"text":">>>","color":"white"}]}
execute if score GameState gameVariable matches 1 if score RedPoints gameVariable >= RequiredToWin mapRules run function calamity:game_state/end_match

#---------------------------------------------------------------------------------------------------
# Purpose: Tick these functions during the post-game
#---------------------------------------------------------------------------------------------------

# This line below is for players who want to be cheeky. If they ever set a score for startMatch,
# go ahead and assume they want to start the match.
execute if score GameState gameVariable matches 2 run scoreboard players set @a[scores={reset=..-1}] reset 0
execute if score GameState gameVariable matches 2 run scoreboard players enable @a[scores={reset=0}] reset

# If a game is not starting, check to see if players want to start a game
execute as @a[scores={reset=1..}] at @s if score GameState gameVariable matches 2 run function calamity:game_state/trigger_reset_game