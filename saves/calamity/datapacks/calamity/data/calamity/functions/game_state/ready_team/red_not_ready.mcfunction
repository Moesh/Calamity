# Called from: calamity:game_state/trigger_ready_team

#---------------------------------------------------------------------------------------------------
# Purpose: Update a team's sidebar state
#---------------------------------------------------------------------------------------------------
team modify fakeRed prefix {"translate":"spacer.right","with":[{"translate":"calamity.unicode.ballotBox.scratch","color":"dark_red"}]}
tellraw @a {"translate":"system.message","color":"red","with":[{"translate":"calamity.team.notReady.red","color":"green","with":[{"translate":"team.red","color":"red"},{"translate":"calamity.icon.red_team","font": "calamity:icons","color":"red"},{"translate":"calamity.unicode.ballotBox.scratch","color":"dark_red"}]}]}
scoreboard players set ReadyRed gameVariable 0
execute if score StartingMatch gameVariable matches 1 run function calamity:game_state/trigger_cancel_start