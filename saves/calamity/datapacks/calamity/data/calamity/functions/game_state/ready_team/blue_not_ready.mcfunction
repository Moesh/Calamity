# Called from: calamity:player/trigger/ready_team

#>--------------------------------------------------------------------------------------------------
#> Purpose: Update a team's sidebar state
#>--------------------------------------------------------------------------------------------------

team modify fakeBlue prefix {"translate":"spacer.right","with":[{"translate":"☒","color":"dark_red"}]}
tellraw @a {"translate":"system.message","color":"blue","with":[{"translate":"calamity.team.notReady.blue","color":"green","with":[{"translate":"team.blue","color":"blue"},{"translate":"b","font": "calamity:icons","color":"blue"},{"translate":"☒","color":"dark_red"}]}]}
scoreboard players set ReadyBlue gameVariable 0
execute if score StartingMatch gameVariable matches 1 run function calamity:player/trigger/cancel_start