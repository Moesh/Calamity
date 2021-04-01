# Called from: calamity:game_state/trigger_ready_team

#---------------------------------------------------------------------------------------------------
# Purpose: Update a team's sidebar state
#---------------------------------------------------------------------------------------------------
team modify fakeBlue prefix {"translate":"spacer.right","with":[{"translate":"calamity.unicode.ballotBox.scratch","color":"dark_red"}]}
tellraw @a {"translate":"system.message","color":"blue","with":[{"translate":"calamity.team.notReady.blue","color":"green","with":[{"translate":"team.blue","color":"blue"},{"translate":"calamity.icon.blue_team","font": "calamity:icons","color":"blue"},{"translate":"calamity.unicode.ballotBox.scratch","color":"dark_red"}]}]}
scoreboard players set ReadyBlue gameVariable 0
execute if score StartingMatch gameVariable matches 1 run function calamity:game_state/trigger_cancel_start