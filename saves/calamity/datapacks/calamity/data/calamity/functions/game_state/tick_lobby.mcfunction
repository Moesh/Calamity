# Called from: calamity:tick

#>--------------------------------------------------------------------------------------------------
#> Purpose: Tick these functions during the lobby stage
#>--------------------------------------------------------------------------------------------------

# Give recently respawned players respawn status effects
execute as @a[scores={timeSinceDeath=0}] run function calamity:player/give_lobby_effects

# Check if any player has used "/trigger readyTeam" and update the team state
function calamity:player/trigger_ready_team
execute if score ReadyBlue gameVariable matches 1 unless entity @a[team=blue] run function calamity:game_state/ready_team/blue_not_ready
execute if score ReadyRed gameVariable matches 1 unless entity @a[team=red] run function calamity:game_state/ready_team/red_not_ready

# Shuffle the players if someone has made a request to!
function calamity:player/trigger_shuffle
execute if score #ShufflePlayers gameVariable matches 1 run function calamity:game_state/shuffle_rest

# This line below is for players who want to be cheeky. If they ever set a score for startMatch,
# go ahead and assume they want to start the match.
scoreboard players set @a[scores={startMatch=..-1}] startMatch 0
scoreboard players enable @a[scores={startMatch=0}] startMatch
# If a game is not starting, check to see if players want to start a game
execute as @a[scores={startMatch=1..}] at @s run function calamity:player/trigger_start_match

# If a game start is happening, check to see if players want to cancel it
execute as @a[scores={cancelStart=1..}] at @s if score StartingMatch gameVariable matches 1 run function calamity:player/trigger_cancel_start

# Tick this every second, if the players will it
execute if score StartingMatch gameVariable matches 1 run function calamity:game_state/timer_start_match

# What if a player selects a team using a trigger?
function calamity:player/trigger_join_team
function calamity:player/trigger_spectate
function calamity:player/trigger_arena