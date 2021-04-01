# Called from: calamity:game_state/trigger_ready_team

#---------------------------------------------------------------------------------------------------
# Purpose: Update a team's sidebar state
#---------------------------------------------------------------------------------------------------
team modify fakeRed prefix {"translate":"spacer.right","with":[{"translate":"calamity.unicode.ballotBox.check","color":"green"}]}
tellraw @a {"translate":"system.message","color":"red","with":[{"translate":"calamity.team.ready","color":"green","with":[{"translate":"team.red","color":"red"},{"translate":"calamity.icon.red_team","font": "calamity:icons","color":"red"},{"translate":"calamity.unicode.ballotBox.check","color":"green"}]}]}
scoreboard players set ReadyRed gameVariable 1