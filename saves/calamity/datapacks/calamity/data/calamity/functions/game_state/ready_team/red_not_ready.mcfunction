# Called from: calamity:player/trigger/ready_team

#>--------------------------------------------------------------------------------------------------
#> Purpose: Update a team's sidebar state
#>--------------------------------------------------------------------------------------------------

team modify fakeRed prefix {"translate":"spacer.right","with":[{"translate":"☒","color":"dark_red"}]}
tellraw @a {"translate":"system.message","color":"red","with":[{"translate":"calamity.team.notReady.red","color":"green","with":[{"translate":"team.red","color":"red"},{"translate":"r","font": "calamity:icons","color":"red"},{"translate":"☒","color":"dark_red"}]}]}
scoreboard players set ReadyRed gameVariable 0
execute if score StartingMatch gameVariable matches 1 run function calamity:player/trigger/cancel_start