# Called from: calamity:player/trigger_ready_team

#>--------------------------------------------------------------------------------------------------
#> Purpose: Update a team's sidebar state
#>--------------------------------------------------------------------------------------------------

team modify fakeRed prefix {"translate":"spacer.right","with":[{"translate":"☑","color":"green"}]}
tellraw @a {"translate":"system.message","color":"red","with":[{"translate":"calamity.team.ready","color":"green","with":[{"translate":"team.red","color":"red"},{"translate":"r","font": "calamity:icons","color":"red"},{"translate":"☑","color":"green"}]}]}
scoreboard players set ReadyRed gameVariable 1