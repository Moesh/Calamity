# Called from: calamity:game_state/trigger_ready_team

#---------------------------------------------------------------------------------------------------
# Purpose: Update a team's sidebar state
#---------------------------------------------------------------------------------------------------
team modify fakeBlue prefix {"translate":"spacer.right","with":[{"translate":"calamity.unicode.ballotBox.check","color":"green"}]}
tellraw @a {"translate":"system.message","color":"blue","with":[{"translate":"calamity.team.ready","color":"green","with":[{"translate":"team.blue","color":"blue"},{"translate":"calamity.icon.blue_team","font": "calamity:icons","color":"blue"},{"translate":"calamity.unicode.ballotBox.check","color":"green"}]}]}
scoreboard players set ReadyBlue gameVariable 1