# Called from: calamity:player/trigger/ready_team

#>--------------------------------------------------------------------------------------------------
#> Purpose: Update a team's sidebar state
#>--------------------------------------------------------------------------------------------------

team modify fakeBlue prefix {"translate":"spacer.right","with":[{"translate":"☑","color":"green"}]}
tellraw @a {"translate":"system.message","color":"blue","with":[{"translate":"calamity.team.ready","color":"green","with":[{"selector":"@s"},{"translate":"team.blue","color":"blue"},{"translate":"b","font": "calamity:icons","color":"blue"},{"translate":"☑","color":"green"}]}]}
scoreboard players set ReadyBlue gameVariable 1