# Called from: calamity:game_state/tick_lobby

#>--------------------------------------------------------------------------------------------------
#> Purpose: Let players tell each other they are ready to start
#>--------------------------------------------------------------------------------------------------

# This first section is an important step in understanding scripting logic. A player has used the
#   slash command, "/trigger readyTeam". This is a single-input command that treats itself like a
#   toggle, or lever. The first line for these first two sections always sets #tempVar to 0. The
#   second line describes a few conditions which must be met in order for #tempVar to be set to 1.
#   The following lines runs output for either 0 or 1.

# Player used readyTeam, is on the blue team
# Check the current ready state.
execute if entity @a[scores={readyTeam=1..},team=blue] run scoreboard players set #tempVar gameVariable 0
execute if score ReadyBlue gameVariable matches 0 if entity @a[scores={readyTeam=1..},team=blue] run scoreboard players set #tempVar gameVariable 1
    execute if score #tempVar gameVariable matches 1 if entity @a[scores={readyTeam=1..},team=blue] run function calamity:game_state/ready_team/blue_ready
    execute if score #tempVar gameVariable matches 0 if entity @a[scores={readyTeam=1..},team=blue] run function calamity:game_state/ready_team/blue_not_ready
# Player used readyTeam, is on the blue team
# Check the current ready state.
execute if entity @a[scores={readyTeam=1..},team=red] run scoreboard players set #tempVar gameVariable 0
execute if score ReadyRed gameVariable matches 0 if entity @a[scores={readyTeam=1..},team=red] run scoreboard players set #tempVar gameVariable 1
    execute if score #tempVar gameVariable matches 1 if entity @a[scores={readyTeam=1..},team=red] run function calamity:game_state/ready_team/red_ready
    execute if score #tempVar gameVariable matches 0 if entity @a[scores={readyTeam=1..},team=red] run function calamity:game_state/ready_team/red_not_ready
# Reset our temporary variable.
scoreboard players set #tempVar gameVariable 0

# Always reset trigger if the score is not zero.
# You'll see this formation a lot when using triggers. These next two lines are a safeguard for any
#   fools who be wanting to try using trigger for other numbers and softlocking themselves.
#   Don't suffer those fools, OK? You got this.
scoreboard players reset @a[scores={readyTeam=..-1}] readyTeam
scoreboard players reset @a[scores={readyTeam=1..}] readyTeam
scoreboard players enable @a[team=blue] readyTeam
scoreboard players enable @a[team=red] readyTeam

scoreboard players set #tempVar gameVariable 0
execute if score GameState gameVariable matches 0 run scoreboard players operation #tempVar gameVariable = ReadyBlue gameVariable
execute if score GameState gameVariable matches 0 run scoreboard players operation #tempVar gameVariable += ReadyRed gameVariable
execute if score #tempVar gameVariable matches 2 if score StartingMatch gameVariable matches 0 run function calamity:player/trigger_start_match